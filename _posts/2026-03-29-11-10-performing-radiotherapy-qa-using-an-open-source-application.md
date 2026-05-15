---
layout: post
title:  Performing Radiotherapy QA Using an Open-Source Application
subtitle: A Step-by-Step Guide
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/open_source_qa_analysis_application.png
share-img: /assets/img/open_source_qa_analysis_application.png
tags: [Radiotherapy, QA, Medical Physics, Open Source, Python, Pycharm, DICOM, Customization]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/open_source_qa_analysis_application.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

## Introduction to Open-Source Radiotherapy QA

This guide focuses on how to access and utilize an open-source application designed for radiotherapy Quality Assurance (QA) analysis, particularly for DICOM image-based evaluation. While this tool can greatly assist in the QA process, it is crucial to remember that the final analysis report and validation always remain the responsibility of the medical physicist directly involved. This step-by-step tutorial is tailored for those new to this method of QA.

The application and its user interface package are developed by medical physics teams and are available on a GitHub repository.

## Step-by-Step Guide to Using the QA Application

### 1. Downloading the Application Package

1.  **Access the Repository:** Locate the GitHub repository for the application. A link to this repository is typically provided in the accompanying documentation or video description.
2.  **Download the Zip File:** On the repository page, click the green "Code" button and select "Download ZIP."
3.  **Extract the Archive:** Save the downloaded zip file to a desired location on your local system and then extract its contents. This will create a folder containing the complete application package, including all necessary scripts and test files (e.g., for Catphan, VMAT, Picket Fence, and Machine Log analysis).

### 2. Setting Up the Python Environment with PyCharm

The application requires a Python interface to run. PyCharm is a recommended Integrated Development Environment (IDE) for this purpose.

1.  **Open PyCharm:** Launch PyCharm.
2.  **Open Project:** Click "Open" and navigate to the extracted application folder. Select this folder to open it as a project in PyCharm.
3.  **Identify the User Interface Script:** In the project section, locate the file named `linac_qa.pyw`. This script initiates the graphical user interface (GUI) for the QA analysis.
4.  **Install Required Packages:** Before running the script, you need to install specific Python packages.
    *   **Check `README.md`:** Open the `README.md` file within the project folder to identify all necessary system requirements and Python packages.
    *   **Install via PyCharm:** In PyCharm, go to the "Python Packages" tab.
        *   Type `PyQt5` and click "Install."
        *   Type `pylinac` and click "Install."
        *   Type `pydicom` and click "Install."
        *   (*Note: `Pillow` is often installed automatically as a dependency.*)
        *   The installation progress will be displayed at the bottom of the PyCharm window.

### 3. Running the QA Application

1.  **Execute the Script:** Once all packages are installed, return to the `linac_qa.pyw` file in PyCharm. Click the "Run" icon (usually a green play button) next to the file name.
2.  **Access the User Interface:** The application's user interface will open. This interface supports various DICOM image-based QA analyses, including modules for Catphan phantoms (for VMAT, CBCT, EPID), various film emulsions (e.g., EBT3, Gafchromic), VMAT QA, plan/imaging QA (e.g., PTW EPID QC, Las Vegas), electron and Varian D-Log file analysis, StarShot, and Winston-Lutz tests.

### 4. Performing a QA Analysis

Here's an example using the Picket Fence analysis:

1.  **Export Images:** First, export the required DICOM images from your treatment planning system (e.g., Eclipse) and save them to a local folder.
2.  **Open Images:** In the QA application's user interface, click the "Open Images" icon.
3.  **Select Images:** Navigate to your saved image files (e.g., for a Picket Fence test) and select them. The application may display the DICOM images preview.
4.  **Select Emulsion/Analysis Type:** From the dropdown menu, choose the appropriate emulsion or analysis type (e.g., "True Beam" for a Millennium MLCI with Picket Fence).
5.  **Run Analysis:** Click the specific analysis icon (e.g., the Picket Fence icon). The application will prompt you to save the resulting report.
6.  **Review Report:** A PDF report, similar to a Picket Fence report, will be generated and displayed.

Repeat these steps for other QA analyses, such as Las Vegas, by selecting the appropriate images and analysis modules.

## Customizing the Application for Enhanced Analysis

The open-source nature of this application allows for significant customization to meet specific institutional needs.

### Why Customize?

The default reports provide basic information (e.g., maximum error values). Customization allows you to:
*   Add more parameters, plots, or graphs for deeper insights.
*   Improve visualization and data representation.
*   Display comprehensive data, such as errors for specific banks or leaves.
*   Integrate multi-image analysis (e.g., from different gantry angles).

### Examples of Customization

Imagine analyzing multiple Picket Fence images taken at various gantry angles (0°, 90°, 180°, 270°) and even with induced errors. A customized application could:
*   Process all images in one go and provide a consolidated analysis.
*   Generate detailed reports indicating which leaves or banks exhibit higher error values.
*   Visualize data for each bank and its corresponding Pickets.

### Creating an Executable for Easier Access

Continuously opening PyCharm and running the script can be cumbersome. You can convert the Python package into a standalone executable (`.exe` file) for simpler access, especially after customization.

1.  **Install `PyInstaller`:**
    *   Open the "Terminal" tab in PyCharm (located at the bottom of the window).
    *   Type `pip install pyinstaller` and press Enter, or install it via the "Python Packages" tab in PyCharm.
2.  **Convert to Executable:**
    *   In the PyCharm terminal, navigate to your project directory.
    *   Execute the command: `pyinstaller --icon=your_icon.ico linac_qa.pyw` (replace `your_icon.ico` with the path to your desired icon file, or omit `--icon` if not needed).
    *   This process may take 3-5 minutes.
3.  **Locate the Executable:**
    *   After the process completes, new `"build"` and `"dist"` folders will be created in your project directory.
    *   The executable file (`linac_qa.exe`) will be found inside the `"dist"` folder.
4.  **Run the Executable:** You can now directly double-click this `.exe` file to launch the application interface without opening PyCharm.

### Further Customization Possibilities

Customization isn't limited to analysis; it can also extend to the application's appearance and branding:
*   **Branding:** Add your institution's name, logo, and machine names.
*   **Reporting:** Include fields for physicist signatures and other verification details.

This ongoing development allows for a highly tailored QA process that can evolve with specific clinical and research demands.

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