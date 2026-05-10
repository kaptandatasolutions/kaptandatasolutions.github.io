---
layout: post
title: Mastering QA in Radiotherapy with Pi-RTQA
subtitle: A comprehensive guide to advanced field analysis and automation for medical physicists
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/pi_tqa_medical_analysis_software.png
share-img: /assets/img/pi_tqa_medical_analysis_software.png
tags: [Medical Physics, Radiotherapy, Quality Assurance, Pi-RTQA, Field Analysis, EPID, DICOM, Automation, Python]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/pi_tqa_medical_analysis_software.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

In the field of medical physics, robust Quality Assurance (QA) is paramount to ensuring the accuracy and safety of radiotherapy treatments. Pi-RTQA, a powerful tool developed in collaboration with PileyNack, offers a comprehensive solution for various QA analyses, particularly excelling in triple-field analysis as per ARB protocols. This article will guide you through the functionalities of Pi-RTQA, demonstrating its utility for medical physicists in streamlining their QA workflows.

## Understanding Pi-RTQA: A Robust QA Solution

Pi-RTQA stands out due to its ability to handle diverse data inputs, including RF data and EPID DICOM images, and its user-friendly interface. It's designed to simplify complex analyses, providing a unified platform for meticulous quality checks.
One of its core strengths lies in performing triple-field analysis, an essential component of modern radiotherapy QA, aligning with ARB guidelines. This ensures that the beam profiles meet stringent specifications, crucial for precise dose delivery.

## Key Features of Pi-RTQA

*   **Triple-Field Analysis:** Conforms to ARB guidelines, analyzing beam profiles comprehensively.
*   **Multiple Data Input Options:** Supports both RF data (Ascii format converted to Excel) and EPID DICOM images (from Elekta, Varian, and other systems).
*   **Automated Processing:** Efficiently processes data and generates detailed PDF reports.
*   **Intuitive Interface:** Designed for ease of use, with clear instructions for data upload and analysis.
*   **Vendor-Specific Processing:** Adapts analysis algorithms based on the linear accelerator vendor (e.g., Elekta, Varian) for accurate results.
*   **First Derivative Concept:** Utilizes the first derivative for field analysis, effectively identifying dose fall-off points while being robust against noise.
*   **Additional Analysis Modules:** Includes field analysis, standard field size checks, ball bearing image analysis, and cat phantom analysis.
*   **Open-Source Availability:** Published on GitHub, allowing medical physicists to inspect, use, and even contribute to the tool's development.

## Step-by-Step Guide to Using Pi-RTQA

This section details how to conduct triple-field analysis using both EPID images and RF data with Pi-RTQA.

### Part 1: Triple-Field Analysis using EPID Images

1.  **Launch Pi-RTQA and Enter Settings:**
    *   Open the Pi-RTQA application.
    *   Fill in all necessary institution details in the designated fields.
    *   From the dropdown menu or the analysis menu, select `Triple QA`.

2.  **Select Data Input Type:**
    *   Choose the option `2D Image Data` for EPID image analysis.

3.  **Upload EPID Images:**
    *   Click on `Upload File`.
    *   Navigate to your EPID image files. Pi-RTQA supports DICOM format and proprietary RF image formats from various machines.
    *   Select the appropriate vendor (e.g., Elekta, Varian) from the vendor selection drop-down. This step is crucial as processing algorithms differ between vendors.

4.  **Process and Generate Report:**
    *   Once the files are uploaded and the vendor is selected, click `Process`.
    *   The software will perform field analysis using the first derivative concept, identifying inflection points (X90, X75, X60) according to ARB guidelines.
    *   After processing is complete, a "Process Complete" notification will appear.
    *   Click `Generate PDF` to create a detailed report.
    *   Save the PDF report to your desired location.

5.  **Review the Report:**
    *   The generated PDF report will include:
        *   Institution and machine details.
        *   Processed images with marked analysis points.
        *   Key parameters such as field size, flatness, symmetry, and inflection points (X90, X75, X60) for both inline and crossline profiles.
        *   Profile graphs showcasing the processed data.

### Part 2: Triple-Field Analysis using RF Data (Excel Format)

1.  **Prepare RF Data in Excel:**
    *   Measure beam profiles for 20x20 cm and 9x9 cm fields, ensuring the 9x9 cm field is normalized to 100%.
    *   Export your RF data (e.g., from an ASCII format) into an Excel spreadsheet.
    *   **Crucially, format the Excel file as follows:**
        *   Create two sheets named `Inline` and `Crossline`.
        *   On each sheet, ensure the columns are named `Inline (mm)` or `Inline (cm)` and `Percentage`. If your data is in millimeters, ensure the column name reflects `(mm)`.
        *   The software is case-sensitive and relies on these specific sheet and column names.
    *   Refer to the `Help` menu in Pi-RTQA for detailed instructions and examples of the required Excel format.

2.  **Select Data Input Type:**
    *   In Pi-RTQA, select `RF Data`.

3.  **Upload Excel File:**
    *   Click `Upload File` and select your prepared Excel spreadsheet containing the inline and crossline RF data.

4.  **Process and Generate Report:**
    *   Click `Process`. Pi-RTQA will read the Excel data and perform the triple-field analysis.
    *   Generate a PDF report as described in Part 1.

5.  **Review the Report:**
    *   The PDF report will present the analysis results derived from your RF data, including profiles and calculated parameters.

### Important Considerations

*   **Vendor Selection:** Always select the correct linear accelerator vendor when analyzing EPID images, as processing algorithms are optimized for specific machine characteristics.
*   **Data Validation:** As an indispensable step in medical physics, always validate the results from Pi-RTQA against your institution's protocols and clinical judgment before making any clinical decisions.
*   **Open-Source Access:** Pi-RTQA is available on GitHub. You can download the executable file from the releases section to get started immediately. Contributions and feedback are welcome.

## Conclusion

Pi-RTQA provides medical physicists with a powerful and accessible tool for performing essential QA analyses, particularly triple-field analysis, in radiotherapy. Its support for various data inputs, automated reporting, and adherence to established guidelines make it an invaluable asset in maintaining the highest standards of radiation treatment quality and patient safety. By following the steps outlined above, you can effectively integrate Pi-RTQA into your QA practices.

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