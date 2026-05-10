---
layout: post
title: myRTQA — Advancing Radiotherapy QA with Biotic Wave 2
subtitle: A Comprehensive Guide to Triple-Field Analysis and More
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/myrtqa_biotic_wave_quality_analysis.png
share-img: /assets/img/myrtqa_biotic_wave_quality_analysis.png
tags: [Radiotherapy, Quality Assurance, Medical Physics, Python, QA Automation, Data Analysis]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/myrtqa_biotic_wave_quality_analysis.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Ensuring the highest quality and safety in radiotherapy treatments is paramount. This article introduces myRTQA's Biotic Wave 2, a powerful and user-friendly software solution designed to streamline and enhance quality assurance (QA) protocols, particularly for triple-field analysis as per ARB guidelines. Developed with medical physicists in mind, Biotic Wave 2 integrates various data inputs and offers robust analytical capabilities.

### What is Biotic Wave 2?

Biotic Wave 2 is a specialized tool within the myRTQA suite, focusing on comprehensive QA analysis for linear accelerators. Its key features include:

*   **Triple-Field Analysis:** Adheres to ARB protocol guidelines, providing detailed insights into beam profiles.
*   **Multiple Data Inputs:** Supports RF data (ASCII export to Excel) and EPID DICOM images (from TrueBeam, Elekta, and Varian machines).
*   **Ease of Use:** Designed for straightforward operation, from data upload to PDF report generation.
*   **Powered by Pyhe-RT:** Leverages a robust Python library for its underlying calculations.

### Step-by-Step Guide: Performing Triple-Field Analysis

This section outlines how to perform triple-field analysis using both 2D image data (EPID DICOM) and RF data (Excel).

#### Method 1: Using 2D Image Data (EPID DICOM)

1.  **Launch and Initialize:**
    *   Open the Biotic Wave 2 application.
    *   Enter all necessary institution details on the main page (e.g., department, machine ID, facility information). These details will populate the final report.

2.  **Select QA Type:**
    *   From the drop-down menu or analysis menu, select "Triple Field Analysis."

3.  **Choose Data Source:**
    *   Select "2D Image Data" as your input method.

4.  **Upload DICOM File:**
    *   Click to upload your DICOM image file. The software supports DICOM and raw image formats from various vendors.
    *   **Vendor Selection:** Crucially, select the correct vendor (e.g., Elekta, Varian) from the drop-down menu. This is vital because the image processing algorithms differ significantly between manufacturers.
    *   Specify the machine energy (e.g., 6MV, 10MV).
    *   Enter the monitor units (MU) used for the image acquisition. This is often implicitly part of the image data but can be manually input if needed.

5.  **Process Data:**
    *   Click the "Process" button. The software will then utilize first derivative concepts for profile analysis, identifying key inflection points. This may take a moment.
    *   Once processing is complete, a "Process Complete" notification will appear.

6.  **Generate and Review Report:**
    *   Click "Download PDF" to generate a detailed report.
    *   Save the PDF with a descriptive name (e.g., "Elekta\_6MV\_Profile\_1").
    *   **Review Report Content:** The PDF report will include:
        *   The processed image with overlaid analysis markers.
        *   All initial institution and machine details.
        *   Crucial beam parameters such as penumbra (left/right), field size, inflection points, X90, X75, and X16, which are critical for ARB guidelines.
        *   Processed profile data and other relevant metrics.

#### Method 2: Using RF Data (Excel)

If you use RF data, you'll need to prepare an Excel file based on your ASCII export.

1.  **Prepare RF Data (Excel Format):**
    *   Export your RF data in ASCII format from your treatment planning system or measurement device.
    *   **Create Excel Sheets:** The Excel workbook *must* contain two sheets, precisely named "In-Line" and "Cross-Line."
    *   **Column Headers:** Each sheet requires specific column headers.
        *   For the "In-Line" sheet, the columns should be "In-Line mm" (or "In-Line cm" if using centimeters) and "Percentage Dose" (or "Percentage").
        *   For the "Cross-Line" sheet, the columns should be "Cross-Line mm" (or "Cross-Line cm") and "Percentage Dose" (or "Percentage").
    *   **Units:** Ensure consistency in units (mm or cm) and reflect this in the column headers. The software is flexible with units but requires accurate naming.
    *   **Normalization:** The software will attempt to normalize your profile to 100% at the central axis (e.g., 6.8 cm).

2.  **Launch and Initialize (Same as Method 1):**
    *   Open Biotic Wave 2 and enter institution details.

3.  **Select QA Type:**
    *   From the drop-down menu, select "Triple Field Analysis."

4.  **Choose Data Source:**
    *   Select "RF Data" as your input method.

5.  **Upload Excel File:**
    *   Upload your carefully formatted Excel file.

6.  **Process and Generate Report:**
    *   Click "Process" and then "Download PDF" as described in Method 1. The report will reflect the analysis of your RF data.

### The Science Behind the Analysis: First Derivative Concept

Biotic Wave 2 primarily employs the **first derivative concept** for field analysis. This method identifies the rate of change of intensity, which is effective for locating critical points like field edges and penumbra regions. While some robust methods use secondary derivatives, they can be highly sensitive to noise in weekly QA data. The first derivative approach is chosen for its balance of accuracy and robustness in typical clinical scenarios.

### Beyond Triple-Field Analysis: Other QA Capabilities

Biotic Wave 2 is not limited to triple-field analysis; it integrates other valuable QA modules powered by the Pyhe-RT library:

*   **Field Analysis:** General field analysis capabilities.
*   **Winston-Lutz QA:** For isocenter verification using ball bearing images.
*   **Picket Fence Analysis:** For checking multileaf collimator (MLC) alignment. It supports single or multiple images and various sheet types (e.g., M1, M2).
*   **CBCT QA (Catphan/Quantum):** Processes CBCT images from phantoms like Catphan or Quantum, allowing for analysis based on the phantom type.

### Accessing Biotic Wave 2

The underlying Pyhe-RT data library and its components are open-source and published on GitHub. Users can access the repository to explore the Python program or download the executable file directly from the releases section.

**Important Note:** It is strongly recommended that all users validate the data and analyses performed by the software with their institution's established protocols and clinical judgment before making any clinical decisions based on its output.

This comprehensive tool offers medical physicists a streamlined, robust, and accessible way to conduct critical QA tasks, ultimately contributing to safer and more effective radiotherapy treatments.

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
      <a href="https://kaptan-data-solutions.app/">💻 Test our ready-to-use QA dashboards online</a>
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
        
        <p><a href="https://www.kaptan-data-solutions.app/contact/">Submit your project brief and receive a proposal</a></p>
    </div>
</body>
</html>