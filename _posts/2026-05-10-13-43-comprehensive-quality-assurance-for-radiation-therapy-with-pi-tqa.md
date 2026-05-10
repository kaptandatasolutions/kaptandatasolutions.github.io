---
layout: post
title:  Comprehensive Quality Assurance for Radiation Therapy with Pi-TQA
subtitle: A Guide to Triple Picket Fence, Field Analysis, and More Using Epip-D and RF Data
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/pi_tqa_analysis_medical_software.png
share-img: /assets/img/pi_tqa_analysis_medical_software.png
tags: ["Medical Physics", "Quality Assurance", "Radiotherapy", "DICOM", "EPID", "Python", "Data Analysis"]  
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/pi_tqa_analysis_medical_software.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Ensuring the highest standards of quality assurance (QA) in radiation therapy is paramount for patient safety and treatment efficacy. Tools like Pi-TQA, developed by Samba Sivasilli and backed by PyLINAC, offer a robust solution for comprehensive QA analysis, adhering to strict protocols like those set by the American Association of Physicists in Medicine (AAPM). This article delves into the functionalities of Pi-TQA, particularly its capabilities in triple picket fence analysis, field analysis, and other crucial QA procedures, utilizing both EPID DICOM images and RF data.

## Introduction to Pi-TQA

Pi-TQA is a user-friendly software designed to streamline various QA processes in radiation therapy. Its core strength lies in its ability to analyze diverse data inputs, including EPID DICOM images and RF data, to perform analyses compliant with AAPM guidelines, such as the triple picket fence test. The software provides detailed reports, enabling medical physicists to efficiently review and document their QA results.

## Key Features and Analysis Modalities

Pi-TQA offers several powerful analysis options, making it a versatile tool for medical physicists:

1.  **Triple Picket Fence Analysis:** This forms the cornerstone of Pi-TQA's capabilities. It allows for the detailed analysis of beam alignments and consistency as per AAPM guidelines.
2.  **Field Analysis:** Beyond picket fence, the software can perform general field analysis, providing insights into beam characteristics.
3.  **Ball Bearing Data Analysis:** It supports the analysis of ball bearing images for specific QA checks.
4.  **Decoupling Analysis:** With options for single or multiple images, this feature allows for the assessment of linear accelerator (linac) performance and potential issues.
5.  **Starshot Method Analysis:** For precise geometric QA, Pi-TQA can process images from starshot tests.
6.  **CatPhan Phantom Analysis:** It enables the analysis of City images from CatPhan phantoms, crucial for imaging quality control.

## Step-by-Step Guide to Triple Picket Fence Analysis with Pi-TQA

Pi-TQA simplifies the triple picket fence analysis, whether you are using EPID DICOM images or RF data. Here’s a detailed breakdown of the process:

### 1. Initial Setup and Data Input

*   **Launch Pi-TQA:** Open the application, which will present you with the main page.
*   **Enter Institution Details:** Begin by inputting all necessary institution-specific details, such as department, linac ID, and event ID. These will be included in the final report.
*   **Select QA Type:** From the dropdown menu or the analysis menu, select `Triple Picket Fence` as your QA type.

### 2. Analyzing with EPID DICOM Image Data

If your linac exports EPID DICOM images (e.g., from an Elekta or Varian machine), follow these steps:

*   **Choose Input Type:** Select the option `ePID image data`.
*   **Upload File:** Click to upload your DICOM image file. Pi-TQA supports various formats, including standard DICOM images and RF images (if exported).
*   **Specify Vendor:** **Crucially**, select the correct linac vendor (e.g., Elekta or Varian). The processing algorithms for images from different vendors can vary significantly, impacting accuracy.
*   **Process Data:** Once the file is uploaded and vendor selected, initiate the processing. The software uses a first-derivative concept for beam profile analysis, helping detect sharp dose fall-offs.
*   **Generate Report:** After processing is complete, select `all of PDF` to generate a comprehensive report. Save the PDF with a descriptive name (e.g., `Elekta 6X Total 1`).
*   **Review Report:** The generated PDF will include the processed image, inflection points (X90, X75, X16), and other parameters critical for AAPM guidelines.

### 3. Analyzing with RF Data (Excel Format)

For users who prefer to work with RF data exported from their linac, Pi-TQA supports analysis via Excel spreadsheets:

*   **Export RF Data:** Measure the beam flatness for 20x20 cm and PDD at 10cm depth with 100cm SSD as per AAPM guidelines.
*   **Prepare Excel File:** Export your RF data in ASCII format and convert it into an Excel spreadsheet. Ensure the Excel file contains two sheets:
    *   **Sheet 1 Name:** `Crossline_Percentage`
    *   **Sheet 2 Name:** `Inline_Percentage`
    *   **Column Headers:** The columns in each sheet must be clearly labeled as `Crossline MM` (or `CM` if data is in centimeters) and `Dose Percentage`, respectively. The software is sensitive to these exact naming conventions.
    *   **Normalization:** The software will normalize your data to 100% as part of the analysis.
*   **Choose Input Type:** Select the option for RF data.
*   **Upload Excel File:** Upload your prepared Excel spreadsheet.
*   **Process Data:** Initiate the processing.
*   **Generate and Review Report:** Similar to image analysis, a PDF report will be generated showing the processed RF data and relevant parameters.

### 4. Why First Derivative for Analysis?

Pi-TQA primarily utilizes the first derivative concept for its picket fence analysis. While the second derivative is often considered more robust in some contexts, it can be highly sensitive to noise in input data. The first derivative, by representing the rate of change of intensity, effectively identifies minimum intensity regions and steep dose fall-offs, ensuring reliable and accurate analysis for QA purposes.

## Availability and Recommendations

Pi-TQA is an open-source project, with its full Python program published on GitHub. Medical physicists can easily download the executable file (e.g., a `.zip` file from the releases section) and use it directly.

**Important Recommendation:** As with any clinical tool, it is strongly advised that users validate all data processed by Pi-TQA before relying on its results for clinical decisions. This ensures the accuracy and reliability of your QA process.

Pi-TQA provides a free and powerful solution for comprehensive radiation therapy QA. Its ease of use, adherence to stringent protocols, and versatility in handling different data inputs make it an invaluable asset for medical physics departments.

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