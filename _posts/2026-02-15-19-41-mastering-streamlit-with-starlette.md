---
layout: post
title: Mastering Streamlit with Starlette
subtitle: Unleash the Full Potential of Your Data Apps with Advanced Backend Integration
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/streamyt_starlit_backend_integration.png.png
share-img: /assets/img/streamyt_starlit_backend_integration.png.png
tags: [Streamlit, Starlette, Backend, Web Development, Data Science, API, Real-time, WebSockets, Security, DevOps, Python]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/streamyt_starlit_backend_integration.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Streamlit, a popular framework for building interactive data applications, has recently received a significant update to version 1.53, unlocking unprecedented backend customization capabilities. This update is a game-changer, integrating the powerful Starlette ASGI (Asynchronous Server Gateway Interface) toolkit directly into Streamlit's server frontend. Previously, Streamlit users were locked into its default Tornado server, limiting advanced backend functionalities. Now, with Starlette's integration, developers can build high-performance web services, customize API endpoints, and enhance the security and user experience of their Streamlit applications.

This integration transforms Streamlit into a more robust and versatile platform, enabling functionalities akin to FastAPI (which is built on Starlette). Developers can now handle complex backend logic, integrate with external services, and deliver sophisticated data applications with greater control and efficiency.

### Unlocking Streamlit's Backend with Starlette

The core of this breakthrough lies in enabling the `server.enableXsrfProtection` flag within Streamlit's configuration. This allows for a split project structure, separating the Streamlit frontend from a dedicated Starlette-powered backend.

#### Step-by-Step Implementation

To leverage this powerful new feature, follow these steps:

1.  **Enable Starlette in Streamlit Configuration**:
    *   Navigate to your `.streamlit/config.toml` file.
    *   Set the `server.enableXsrfProtection` flag to `true`. This action gives you control over the backend server.

2.  **Split Your Streamlit Project**:
    *   **Frontend File (`streamlit_app.py`)**: This file will contain your Streamlit UI, including your homepage and any multi-page applications located in an `apps` folder.
    *   **Backend File (`app.py`)**: This new file will house your Starlette backend logic, including custom API endpoints, static file serving, and middleware.

3.  **Initialize the Starlette App**:
    *   In your `app.py` file, import `StreamlitApp` from the `streamlit.web.server.starlette_app` module.
    *   Instantiate `StreamlitApp`, pointing it to your frontend Streamlit file:
        ```python
        from streamlit.web.server.starlette_app import StreamlitApp
        
        # Initialize the Streamlit app as a Starlette sub-application
        frontend_app = StreamlitApp(
            ...  # Configuration for your Streamlit frontend, pointing to streamlit_app.py
        )
        ```
    *   This `StreamlitApp` object now follows the Starlette application standard, inheriting many of its features.

4.  **Run Your Application**:
    *   Instead of running `streamlit run streamlit_app.py`, you will now run:
        ```bash
        streamlit run app.py
        ```
    *   Alternatively, for production deployments, you can use Uvicorn:
        ```bash
        uvicorn app:frontend_app --reload
        ```

### Core Starlette Features within Streamlit

Once the backend is configured, Streamlit users can harness a variety of Starlette's advanced functionalities:

#### 1. Custom API Endpoints

Define API endpoints in asynchronous Python functions within your `app.py`. These functions can return Starlette-specific response types like `JSONResponse` or `HTMLResponse`.

*   **Example**: Fetching raw JSON data or HTML fragments from the backend.
*   **Implementation**:
    *   Create asynchronous functions, e.g., `custom_starlette_data` or `html_response_demo`.
    *   Return `JSONResponse` objects with `raw_starlette` data or `HTMLResponse` with HTML fragments.
    *   Mount these functions to specific routes in a `routes` list, which is then passed as an argument to your `StreamlitApp` initialization.

#### 2. Serving Static Assets

Host static websites (marketing pages, documentation, etc.) alongside your Streamlit app.

*   **Implementation**:
    *   Use `starlette.staticfiles.StaticFiles` to map a directory (e.g., `landing/`) to a subpath (e.g., `/landing`).
    *   Set `html=True` to specify a default `index.html` for that path.
    *   Use `Mount` instead of `Route` to ensure subpaths within the static directory are also handled.
    *   **Caution**: Avoid using `/static` as a path, as it might conflict with Streamlit's internal static assets.

#### 3. Custom Metadata and SEO

Manage how search engines perceive your application by serving custom metadata files.

*   **Implementation**:
    *   Create asynchronous functions for `robots.txt`, `sitemap.xml`, and `manifest.json`.
    *   Return `PlainTextResponse` for `robots.txt` and `Response` with `media_type="application/xml"` for `sitemap.xml`.
    *   Mount these functions to their respective routes. This improves SEO and enables Progressive Web App (PWA) features.

#### 4. Mounting Other ASGI Applications (e.g., FastAPI)

Integrate other ASGI frameworks like FastAPI directly into your Streamlit backend.

*   **Example**: Mounting a FastAPI application with health check and prediction endpoints.
*   **Implementation**:
    *   Create a FastAPI app within `app.py`.
    *   Mount this FastAPI app under a specific endpoint (e.g., `/api`) using `Mount`.
    *   This allows full utilization of FastAPI's features, including its auto-generated documentation (Swagger UI).
    *   The inverse is also possible: mounting Streamlit within FastAPI, Flask, or Django.

#### 5. Real-time Data Streaming with WebSockets

Display live data updates in your Streamlit UI without relying on Streamlit's `st.rerun()` mechanism, which can be inefficient for constant updates.

*   **Implementation**:
    *   Define an asynchronous WebSocket endpoint in `app.py` using `starlette.websockets.WebSocket` and `WebSocketEndpoint`.
    *   In a loop, send data (e.g., random numbers) over the WebSocket connection at specified intervals.
    *   On the Streamlit frontend, use JavaScript within an `st.html()` component to connect to this WebSocket endpoint.
    *   Parse incoming JSON messages and update the HTML DOM directly, ensuring smooth, real-time updates independent of Streamlit's rendering cycle.

#### 6. Integrating Multi-Agent Communication Protocol (MCP) Servers

Host MCP servers within your Streamlit backend for agent-based applications.

*   **Implementation**:
    *   Define your MCP server logic in `app.py`.
    *   Transform the MCP app into a Starlette app using `http_app` method.
    *   Mount this app under a specific path (e.g., `/analytics`).
    *   **Crucial**: The MCP app needs to be initialized before Starlette's main lifespan starts (see Lifespan Management section).

#### 7. Server-Level Security with Middleware

Enhance the security of your Streamlit application by intercepting requests and responses with Starlette middleware.

*   **Implementation**:
    *   **Security Headers**: Use `starlette.middleware.lifespan.LifespanMiddleware` to inject security headers like `X-Frame-Options`, `X-Content-Type-Options`, and `Strict-Transport-Security`.
    *   **Cookie Management**: Set and access cookies via `starlette.middleware.sessions.SessionMiddleware` and Streamlit's `st.runtime.get_instance()._cookies` method.
    *   **IP Whitelisting**: Restrict access to internal tools based on client IP using `starlette.middleware.trusted_host.TrustedHostMiddleware` or custom middleware.
    *   Define a list of middleware objects and pass them to the `middleware` argument during `StreamlitApp` initialization.

#### 8. Lifespan Management for Heavy Tasks

Manage the lifecycle of your Starlette server to perform setup tasks (e.g., database connections, model loading) before the app starts and cleanup routines after it shuts down.

*   **Implementation**:
    *   Define an asynchronous `lifespan` function decorated with `@contextlib.asynccontextmanager`.
    *   Perform `startup` tasks (e.g., connecting to a database, pre-warming machine learning models) before yielding control.
    *   Perform `shutdown` tasks (e.g., disconnecting from the database) after the yield statement.
    *   Pass this `lifespan` function to the `lifespan` argument of your `StreamlitApp` object.
    *   This ensures your Streamlit app is fully responsive from the first visit, as heavy backend processes are ready beforehand.

#### 9. Background Tasks

Execute long-running or resource-intensive tasks in the background without blocking the API response.

*   **Implementation**:
    *   Define an asynchronous function for the heavy task (e.g., sending an email with a PDF).
    *   Use `starlette.background.BackgroundTask` within your API endpoint to queue this function for background execution.
    *   The API endpoint can immediately return a response, informing the user that the task has been queued, providing a smoother user experience.

#### 10. Robust Error Handling

Customize error pages for different HTTP status codes (e.g., 404, 500) to provide a better user experience when things go wrong.

*   **Implementation**:
    *   Create custom HTML response bodies for 404 (Not Found) and 500 (Server Error) pages.
    *   Use `starlette.exceptions.ExceptionHandlerMiddleware` or directly define an `exception_handlers` dictionary when initializing your `StreamlitApp`.
    *   Map status codes to your custom error pages, ensuring a consistent and branded error experience.

With these enhanced features, Streamlit applications can now be built with greater architectural flexibility, performance, and security. The integration with Starlette significantly elevates Streamlit's capabilities, making it a powerful choice for developing full-stack data applications that can handle complex backend logic and real-time interactions while maintaining a user-friendly frontend. This effectively transforms Streamlit into a comprehensive micro-footstack library for data apps, offering enterprise-grade features like authentication, session-scoped caching, and more.

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
      <a href="https://kaptan-data.streamlit.app/">💻 Test our ready-to-use QA dashboards online</a>
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
