---
layout: post
title:  "Desktop Deployment of Streamlit Apps Without Python or Docker"
subtitle: "Transforming Streamlit into standalone desktop applications for effortless distribution"  
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/trimit_app_packaging_workflow.png
share-img: /assets/img/trimit_app_packaging_workflow.png
tags: ["Streamlit", "Pyodide", "Electron", "Desktop Apps", "Deployment", "Python", "No-install", "Web Technologies"]  
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/trimit_app_packaging_workflow.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Many data scientists and developers leverage the power of Streamlit to create interactive web applications. However, distributing these applications to end-users, especially those without technical backgrounds, often presents challenges related to Python installations, dependency management, or Docker environments. This article details a robust method to convert Streamlit applications into standalone desktop executables, eliminating the need for Python, Docker, or internet downloads on the client machine. This is achieved through the innovative combination of Pyodide and Electron, facilitated by a library called "Estilite."

### The Challenge of Streamlit Distribution

Imagine a scenario where you've built a fantastic Streamlit application, perhaps for data analysis or visualization, and your manager or marketing team wants to use it. The typical hurdles include:
*   **Python Installation:** Users need to install Python and all its associated libraries, which can be complex and error-prone.
*   **Dependency Management:** Ensuring all required packages are correctly installed in the user's environment is a constant struggle.
*   **Docker Requirement:** While Docker simplifies deployment, it introduces another layer of software that end-users might not have or want to install.
*   **Internet Connection:** Many deployment methods require an active internet connection to download dependencies or run container images.

### Introducing Estilite: The Game Changer

Estilite is a library that allows Streamlit applications to run in a web browser without a direct Python installation. It achieves this by utilizing Pyodide, a project that brings the Python scientific stack to the browser. Once your Streamlit app is "Pyodide-compiled," it can then be packaged into a desktop executable using Electron, a framework for building desktop applications with web technologies. This combination results in a user-friendly, double-click-to-run experience.

### Step-by-Step Guide to Desktop Deployment

Let's walk through the process of transforming your Streamlit application into a standalone desktop app.

#### Prerequisites

Before you begin, ensure you have:
*   **Node.js and npm:** Estilite relies on npm for package management. If you don't have it, install Node.js which includes npm.
*   **A Streamlit Application:** For this guide, we'll assume a multi-page Streamlit app with assets (like images or Lottie animations) loaded from local folders and a `requirements.txt` file listing external Python packages like `pandas` and `plotly`.

#### Step 1: Project Structure and Dependencies

Organize your Streamlit project with the following structure:

```
your_project_root/
├── streamlit_app_folder/
│   ├── streamlit_script.py
│   ├── pages/
│   │   └── sub_page.py
│   └── images/
│       ├── penguin.png
│       └── 404_animation.json (Lottie file)
├── requirements.txt
└── package.json (to be created)
```

The `requirements.txt` file should list all your Python dependencies (e.g., `pandas`, `plotly`, `streamlit-lottie`).

**Important Note on Python Packages:** Pyodide supports pure Python packages with wheels on PyPI. However, packages with C extensions (like `numpy`, `opencv`, `xgboost`) need to be recompiled for Pyodide. You can check the current list of supported and recompiled packages on the Pyodide website.

#### Step 2: Initialize npm Project and Install Estilite

1.  **Create `package.json`:** At the root of your project, create a file named `package.json`. Copy the content from the Estilite desktop README file into this `package.json`. This file will define your project's metadata and dependencies.

2.  **Install npm Dependencies:** Open your terminal in the project root and run:
    ```bash
    npm install
    ```
    This command will install all dependencies specified in `package.json` into a `node_modules` folder. It will also create a `package-lock.json` file, which pins the exact versions of all installed packages. Both `node_modules` and `package-lock.json` should generally be ignored in version control systems like Git.

#### Step 3: Dump Your Streamlit App to a Pyodide Project

1.  **Run the Dump Command:** After `npm install` is complete, you can use `npm run` to execute scripts defined in your `package.json`. To prepare your Streamlit app for Pyodide, run the following command:

    ```bash
    npm run dump -- streamlit_app_folder --packages plotly pandas streamlit-lottie --requirements requirements.txt
    ```

    *   `streamlit_app_folder`: Replace this with the name of your folder containing the Streamlit application. Estilite currently expects a Streamlit app within a dedicated folder.
    *   `--packages`: Explicitly list any Python packages your app uses that need to be included in the Pyodide environment.
    *   `--requirements`: (Optional, but recommended) Use the `-R` or `--requirements` flag to point to your `requirements.txt` file. The dump command will then automatically parse and include these dependencies.

    This command will create a new `build` folder. This folder contains your application code, external resources (like `pages` and `images`), the Estilite executable, and the Pyodide-compiled versions of your Python packages. Think of this `build` folder as a browser-compiled version of your Streamlit app. Remember that you'll need to re-run the `dump` command every time you make changes to your Streamlit app's source code.

#### Step 4: Test the Pyodide-Compiled Application

Before packaging, it's crucial to verify that the Pyodide-compiled version of your app works correctly.

1.  **Serve the Application:** In your terminal, run:
    ```bash
    npm run serve
    ```
    *   **Windows Users:** If you encounter issues with environment variable settings in your command line, you might need to adapt the `serve` script in your `package.json` or manually set the environment variable. A common workaround is to duplicate the `serve` script, rename it (e.g., `serve-windows`), remove the environment variable setting from the script, and then set the environment variable manually in your terminal before running `npm run serve-windows`.

2.  **Verify Functionality:** After running the `serve` command, a new window will pop up, loading your Streamlit application. This initial loading might take a few seconds as Pyodide initializes. Monitor the developer tools for any errors during this process.

    *   **Troubleshooting:** If the app fails to load or encounters errors (a common issue can be a "freak out" moment!), ensure you are using the latest version of Estilite. Go back to your `package.json`, update the Estilite dependency version, delete your `node_modules` folder and `package-lock.json` (if present), run `npm install` again, and then re-run the `dump` and `serve` commands.

#### Step 5: Package into an Electron Desktop App

Once you've confirmed that the Pyodide-compiled version of your Streamlit app is working, you can package it into a desktop executable using Electron Builder.

1.  **Configure Electron Builder:** Electron Builder's configurations are stored within a `build` object in your `package.json` file.
    *   Refer to the Electron Build documentation (e.g., for Windows targets) to find the specific configurations you need. For example, to create a portable Windows executable (`.exe` that doesn't require installation), you would add specific `win` and `target` configurations.

    **Cross-Platform Packaging:** While Electron Builder *can* sometimes perform cross-platform builds, it's generally recommended to package the application on the target operating system (e.g., build Windows executables on a Windows machine, Mac executables on a macOS machine, and Linux executables on a Linux machine). This helps avoid potential compatibility issues.

2.  **Build the Executable:** Once your `package.json` is configured with the desired build settings, run the following command:

    ```bash
    npm run dist
    ```
    This command will execute Electron Builder, read your build configurations, and create a `dist` folder, which will contain your executable file.

#### Step 6: Customize with an Icon (Optional)

To give your desktop application a professional look, you can add a custom icon.

1.  **Prepare Your Icon:** Have an icon file (e.g., `.png`, `.ico`) ready in your project's `assets` folder.
2.  **Add Icon Configuration:** Go back to the Electron Build documentation (icon section) and find the `icon` argument. Add this argument to the `build` object in your `package.json`, specifying the path to your icon file.
3.  **Repackage:** Re-run `npm run dist` to build a new executable with your custom icon.

#### Step 7: Distribute and Test

Copy the generated executable from the `dist` folder to your desired location. Double-click to launch it. The application will load, demonstrating smooth functionality without any prior Python or Docker installation on the target machine. While the initial load might take a moment (as it's essentially running a full Python environment within a sandboxed Chromium environment), the subsequent user experience is seamless.


This method provides a powerful solution for distributing Streamlit applications as truly standalone desktop executables, significantly improving accessibility for non-technical users and simplifying deployment workflows.

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