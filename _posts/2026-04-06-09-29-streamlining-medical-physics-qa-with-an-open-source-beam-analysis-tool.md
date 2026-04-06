---
layout: post
title:  Streamlining Medical Physics QA with an Open-Source Beam Analysis Tool
subtitle: A Practical Guide for Python Beginners and Medical Physicists
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/open_source_qa_tool_medical_physics.png
share-img: /assets/img/open_source_qa_tool_medical_physics.png
tags: [Medical Physics, QA, Open Source, Python, Beam Analysis, EPID, Python for Medical Physics, Quality Assurance, Dosimetry]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/open_source_qa_tool_medical_physics.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

In the demanding field of medical physics, quality assurance (QA) is paramount. Regularly analyzing beam parameters, field sizes, flatness, and symmetry is crucial for patient safety and treatment efficacy. While many commercial solutions exist, open-source tools offer an accessible and customizable alternative, especially for those new to programming with Python or seeking a deeper understanding of the underlying algorithms.

This article introduces an invaluable open-source QA tool hosted on GitHub, specifically designed for medical physicists and Python beginners. It demystifies the process of utilizing this tool for beam analysis, particularly for EPID-based field size measurements.

**Crucial Disclaimer for Medical Physicists:**

It is essential to remember that while this tool facilitates analysis, the ultimate responsibility for validating and clinically approving any QA results rests solely with the medical physicist performing the analysis. This guide focuses on demonstrating the tool's usage, not on clinical validation.

### Understanding the Open-Source QA Tool

This particular tool, often referred to as a "beam scheme" application, specializes in analyzing field size and other crucial beam parameters using images from Electronic Portal Imaging Devices (EPID). For physicists who routinely perform field size analysis manually, this tool provides concrete, quantifiable results, enhancing efficiency and accuracy.

The tool’s repository, initially developed by Mr. Alan Chamberlain and his team, provides clear instructions, licensing information, and vital validation guidelines.

**Key Validation Considerations:**

*   **2D Array Detectors:** When using a 2D array, ensure the detector plane is positioned at 100 cm Source-Axis Distance (SAD) for accurate results. Small discrepancies between reported and measured dosimetry might occur otherwise.
*   **EPID Images:** Generally, no correction is needed for EPID images unless specific modifications are desired.

### Step-by-Step Guide to Using the Beam Scheme Application

This section outlines how to download, install, and utilize this open-source QA tool for beam analysis.

#### Step 1: Downloading the Application

1.  **Navigate to the GitHub Repository:** Access the project's GitHub page.
2.  **Locate "Releases":** On the right-hand side of the repository page, find and click on the "Releases" section.
3.  **Choose the Executable File:** Within the releases, locate the `setup.exe` file. This is the executable installer for the application. (For advanced users or programmers, source codes are also available if you wish to modify the application's logic).
4.  **Download:** Click on `setup.exe` to download the installer to your local machine.

#### Step 2: Installing the Application

1.  **Run the Installer:** Once the download is complete, navigate to your downloads folder and double-click the `setup.exe` file.
2.  **Follow On-Screen Prompts:** The installation process is straightforward. Simply click "Run," then "Next" through the subsequent prompts to install the application on your computer.

#### Step 3: Launching and Initial Interface Overview

1.  **Launch the Application:** After successful installation, launch the "Beam Scheme" application.
2.  **Main Interface:** You will be greeted with the main interface.
3.  **Help Content:** Within the application, navigate to "Help" > "Content Help" to access the same detailed instructions and validation guidelines found in the GitHub repository.
4.  **File Operations:** Explore the "File" menu, which includes options for exporting results.

#### Step 4: Loading and Analyzing an Image

1.  **Open File:** Click on the "Open File" icon (often represented by a folder icon or similar).
2.  **Select EPID Image:** Browse to the location of your EPID image file (e.g., a DICOM image of a 20x15 cm field taken on a linear accelerator).
3.  **Automatic Analysis:** Once loaded, the application automatically processes the image, analyzing both in-line and cross-line profiles.
4.  **Review Default Values:** The tool will immediately display default values for various beam parameters.

#### Step 5: Utilizing Protocols and Retrieving Beam Parameters

1.  **Select Protocol:** The application offers several built-in protocols for analysis, such as:
    *   D-Electron Photon
    *   Triple F Field Size
    *   IEC Pro97
    *   Varian
    Choose the protocol relevant to your QA procedure.
2.  **Access Field Size Data:** Click on the "Field Size" option. The application will clearly display the field size for both the X-profile (in-plane) and Y-profile (cross-plane), for example, 20 cm for X and 15 cm for Y.
3.  **Extract Flatness and Symmetry:** Based on the chosen protocol (e.g., Varian), the tool will also provide values for beam flatness and symmetry, essential parameters for assessing beam quality.

#### Step 6: Exporting Results

*   Use the "File" > "Export" option to save your analysis results for documentation, trending, or further processing.

### Practical Tips

*   **DICOM Export:** To use this tool effectively, you will need to export EPID images (DICOM files) from your treatment planning system (e.g., Eclipse) or directly from your linear accelerator console to a local drive or network location accessible by the application.
*   **Community Support:** If you encounter any challenges or have questions about the tool, leverage the comments section of the corresponding video or the GitHub repository's issue tracker for community support.

This open-source beam analysis tool offers a powerful and accessible solution for medical physicists looking to enhance their QA procedures, particularly those involving EPID images. By following these steps, even Python beginners can effectively integrate this tool into their routine workflows, contributing to safer and more accurate radiation therapy.

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