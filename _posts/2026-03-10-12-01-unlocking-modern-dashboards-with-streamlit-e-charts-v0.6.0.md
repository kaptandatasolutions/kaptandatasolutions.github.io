---
layout: post
title: Unlocking Modern Dashboards with Streamlit E-Charts v0.6.0
subtitle: Build Stunning, Interactive Visualizations in Pure Python
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/streamlit_echarts_dashboard_features.png
share-img: /assets/img/streamlit_echarts_dashboard_features.png
tags: [Streamlit, E-charts, Python, Data Visualization, Interactive Dashboards, Web Development, Data Science, AI, LLM]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/streamlit_echarts_dashboard_features.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

In the world of data science and web development, creating compelling and interactive dashboards is key to effectively communicating insights. While JavaScript libraries often dominate the space for rich visualizations, the `streamlit-echarts` library offers a powerful and elegant solution for Python users. This post delves into the features of `streamlit-echarts` version 0.6.0, demonstrating how to build modern, interactive dashboards purely in Python, bypassing the need for complex JavaScript.

### What is `streamlit-echarts`?

`streamlit-echarts` is a Streamlit component that integrates Apache ECharts, a robust, enterprise-level charting and visualization library, directly into your Streamlit applications. This means you can leverage ECharts' extensive range of chart types, animations, and interactivity features, all while writing your dashboard logic in Python.

### Getting Started: Your First E-Charts Dashboard

The core of `streamlit-echarts` relies on ECharts' JSON-based option specification. This specification defines everything about your chart, from data series to axes, tooltips, and legends.

**Step-by-Step Guide:**

1.  **Installation**:
    First, ensure you have `streamlit-echarts` installed in your Python environment:
    ```bash
    pip install streamlit-echarts
    ```

2.  **Basic Chart Structure**:
    All `streamlit-echarts` charts begin with defining an `option` dictionary in Python, mirroring the JavaScript ECharts option object.

    Let's create a simple bar chart:
    ```python
    from streamlit_echarts import st_echarts

    # Define chart options as a Python dictionary
    options = {
        "xAxis": {
            "type": "category",
            "data": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
        "yAxis": {"type": "value"},
        "series": [{"data": [120, 200, 150, 80, 70, 110, 130], "type": "bar"}],
        "tooltip": {"trigger": "axis"} # Add a tooltip for interactivity
    }

    # Render the chart in Streamlit
    st_echarts(options=options)
    ```
    This code snippet will display a basic bar chart with labels and values. The `tooltip` option enhances interactivity, showing data details on hover.

3.  **Leveraging AI for Option Generation**:
    If you're not deeply familiar with ECharts' JSON schema, you can use Large Language Models (LLMs) or coding agents to translate complex JavaScript ECharts examples into the required Python dictionary format. Simply provide the JavaScript option configuration to your LLM and ask it to convert it into a Python dictionary suitable for `streamlit-echarts`.

### Advanced Features and Customization

`streamlit-echarts` offers a rich set of arguments to control your charts' behavior and appearance.

1.  **Sizing and Layout**:
    *   `height` and `width`: Control the dimensions of your chart in pixels.
    *   `streamlit` Layout Integration: `streamlit-echarts` seamlessly integrates with Streamlit's layout system. If placed in a container with `st.container(width="stretch")`, the chart will expand to fill the available width. For content-driven sizing, use `st.container(width="content")`.

2.  **Rendering Methods (`renderer`)**:
    *   **Canvas (Default)**: Ideal for high-performance charting, large datasets, and real-time updates. Renders directly onto an HTML canvas.
    *   **SVG**: Renders as Scalable Vector Graphics. This is excellent for charts that need to be crisp at any zoom level, or for post-production editing in tools like Adobe Illustrator, as it provides a vector-based output with editable layers.
    ```python
    st_echarts(options=options, renderer="svg")
    ```

3.  **Theming (`theme`, `custom_theme`)**:
    *   **Streamlit Theme (Default)**: Automatically picks up colors from your Streamlit app's active theme.
    *   **ECharts Built-in Themes**: Use themes like "dark" or "light" directly.
    *   **Custom Themes**: You can load a custom theme definition from a JSON file (e.g., generated from ECharts' theme builder) and pass it via the `custom_theme` argument.
    ```python
    # Load a custom theme from a JSON file
    with open("my_custom_theme.json", "r") as f:
        custom_theme_json = json.load(f)
    st_echarts(options=options, theme="custom", custom_theme=custom_theme_json)
    ```

4.  **Interactivity and Events**:
    *   **Selection (`onSelect="rerun"`, `selection_mode`)**: When `onSelect="rerun"` is set, any click or selection on chart elements will re-execute the Streamlit script from top to bottom. The selected data points will be available in a Python variable.
        *   `selection_mode`: Allows specifying selection types like `"single"`, `"multiple"`, `"box"`, or `"lasso"`.
        ```python
        selected_data = st_echarts(
            options=options,
            onSelect="rerun",
            selection_mode="multiple"
        )
        if selected_data:
            st.write("Selected points:", selected_data)
        ```
    *   **Lower-Level Event API (`events`)**: For more granular control over ECharts events (e.g., `mouseover`, `legendselectchanged`, `datazoom`), use the `events` dictionary. This allows you to specify a JavaScript function that will be executed and return custom data to Streamlit.
        ```python
        from streamlit_echarts import JsCode

        events = {
            "click": JsCode("function(params) { return {name: params.name, value: params.value}; }").js_code,
            "mouseover": JsCode("function(params) { return {name: params.name, value: params.value}; }").js_code
        }
        click_result = st_echarts(options=options, events=events)
        if click_result:
            st.write(f"Event: {click_result}")
        ```
    *   **`on_change` Callback**: This Streamlit-specific callback allows you to execute a Python function whenever a chart event fires. It's useful for updating session state, fetching new data, or triggering other Streamlit components without a full script rerun.
        ```python
        def handle_chart_change():
            st.session_state.chart_clicks = st.session_state.get('chart_clicks', 0) + 1
            st.write("Chart clicked!")

        st_echarts(options=options, key="my_chart", on_change=handle_chart_change)
        st.write(f"Total clicks: {st.session_state.get('chart_clicks', 0)}")
        ```

5.  **Persistent Charts with `key`**:
    When `streamlit-echarts` components have a `key` argument, they persist across Streamlit reruns. This allows for smoother animations and state transitions when only a portion of the chart's options (e.g., data) changes, avoiding the "phoenix" effect of recreating the entire widget.

6.  **Dynamic Data Updates (`replace_merge`)**:
    For dynamic animations when changing the number of series or data points in a chart, use `replace_merge=True`. This tells ECharts to update the existing chart with new options rather than redrawing it entirely, producing fluid transitions.

7.  **Geographical Maps (`map`)**:
    `streamlit-echarts` supports geographical visualizations. You can load GeoJSON data for maps (e.g., world maps, country maps) and integrate them into your charts using the `map` argument and `Map` object from the library.
    ```python
    from streamlit_echarts import Map
    # Assume 'world_geojson' is loaded GeoJSON data
    world_map = Map(map_name="world", map_data=world_geojson)
    # Then integrate into your options with series of type 'map'
    # And pass map=world_map to st_echarts
    ```

8.  **Injecting Custom JavaScript (`JsCode`)**:
    For highly customized behaviors, such as advanced tooltips, custom formatters, or gradient fills, you can directly inject JavaScript code into your ECharts options using the `JsCode` utility. This allows you to leverage the full power of ECharts' JavaScript API.
    ```python
    from streamlit_echarts import JsCode
    options_with_js = {
        # ... other options ...
        "tooltip": {
            "formatter": JsCode("function(params) { return params.name + ': ' + params.value + ' units'; }").js_code
        }
    }
    st_echarts(options=options_with_js)
    ```

9.  **Collapsible Containers**:
    Version 0.6.0 addresses previous issues with displaying E-Charts inside Streamlit's collapsible containers (tabs, expanders, popovers, dialog boxes). Charts now render correctly within these elements, even with animations, thanks to an underlying resize observer.

### `pyecharts` Integration

For users who prefer a more Python-idiomatic way to build ECharts (similar to Plotly Express), `streamlit-echarts` offers optional integration with `pyecharts`. You can install it via:
```bash
pip install "streamlit-echarts[pyecharts]"
```
`pyecharts` provides a Pythonic API to construct ECharts objects, which can then be passed to `st_echarts`. This offers auto-completion and a more structured way to define charts without directly manipulating JSON dictionaries.

### Extensions

`streamlit-echarts` also conveniently integrates popular ECharts extensions:
*   **Word Cloud**: Create visually engaging word clouds.
*   **Liquid Fill**: Display progress bars or data using liquid-fill animations.

### Conclusion

`streamlit-echarts` version 0.6.0 empowers Python developers to create stunning, interactive, and modern dashboards within Streamlit with remarkable ease. From straightforward bar charts to complex geographical maps and dynamic animations, the library provides all the tools needed to bring your data to life. With features like AI-assisted option generation, SVG rendering for professional outputs, comprehensive interactivity management, and seamless Streamlit integration, `streamlit-echarts` stands out as an indispensable tool for data visualization in the Python ecosystem. Explore the demo, experiment with the examples, and elevate your Streamlit dashboards to the next level.

---


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kaptan Data Solutions</title>
    <style>
        .citation {
            background-color: #f3e8ff;
            border-left: 4px solid #8b5cf6;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
        }
        .citation h3 {
            color: #6b21a8;
            margin-top: 0;
        }
        .citation a {
            color: #7c3aed;
            text-decoration: none;
        }
        .citation a:hover {
            text-decoration: underline;
        }
        .expertise-list {
            margin: 15px 0;
        }
        .hashtags {
            font-weight: bold;
            color: #7c3aed;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="citation">
        <h3>🔍 Discover Kaptan Data Solutions — your partner for medical-physics data science & QA!</h3>

    <p>We're a French startup dedicated to building innovative web applications for <strong>medical physics, and quality assurance (QA)</strong>.</p>

    <p>Our mission: provide hospitals, cancer centers and dosimetry labs with powerful, intuitive and compliant tools that streamline beam-data acquisition, analysis and reporting.</p>

    <p>
      <a href="https://kaptandatasolutions.github.io/">🌐 Explore all our medical-physics services and tech updates</a><br>
      <a href="https://kaptan-data-solutions.app/">💻 Test our ready-to-use QA dashboards online</a><br>
      <a href="https://www.kaptan-data-solutions.app/upcoming_saas/">Our medical physics SaaS is coming soon — designed for radiation therapy, imaging, and nuclear medicine centers.</a>
    </p>

    <p><strong>Our expertise covers:</strong></p>
    <div class="expertise-list">
      📊 Interactive dashboards for linac performance & trend analysis<br>
      🔬 Patient-specific dosimetry and image QA (EPID, portal dosimetry)<br>
      📈 Statistical Process Control (SPC) & anomaly detection for beam data<br>
      🤖 Automated QA workflows with n8n + AI agents (predictive maintenance)<br>
      📑 DICOM-RT / HL7 compliant reporting and audit trails
    </div>

    <p>Leveraging advanced Python analytics and n8n orchestration, we help physicists automate routine QA, detect drifts early and generate regulatory-ready PDFs in one click.</p>

    <p>Ready to boost treatment quality and uptime? Let’s discuss your linac challenges and design a tailor-made solution!</p>

    <div class="hashtags">
      #MedicalPhysics #Radiotherapy #LinacQA #DICOM #DataScience #Automation
    </div>

    <p><a href="https://kaptandatasolutions.github.io/submit-project/">Request a quote</a></p>
        
        <p>Get in touch to discuss your specific requirements and discover how our tailor-made solutions can help you unlock the value of your data, make informed decisions, and boost operational performance!</p>
        
        <div class="hashtags">
            #DataScience #Automation #Python #n8n #Streamlit #DataAnalysis #AI #Visualization
        </div>
        
        <p><a href="https://kaptandatasolutions.github.io/submit-project/">Submit your project brief and receive a proposal</a></p>
    </div>
</body>
</html>