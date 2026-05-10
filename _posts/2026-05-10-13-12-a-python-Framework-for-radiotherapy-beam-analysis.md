---
layout: post
title: Towards Transparent Quality Assurance - A Python Framework for Radiotherapy Beam Analysis
subtitle: Optimizing Triple-Field and FFF Protocols via Open-Source Scientific Libraries
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/myrtqa_biotic_wave_quality_analysis.png
share-img: /assets/img/myrtqa_biotic_wave_quality_analysis.png
tags: [Radiotherapy, Quality Assurance, Medical Physics, Python, QA Automation, Data Analysis]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/myrtqa_biotic_wave_quality_analysis.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Ensuring the highest quality and safety in radiotherapy treatments is a non-negotiable standard. While proprietary software often dominates the field, this article explores how a **custom Python-based framework**—leveraging industry-standard libraries—can streamline and enhance quality assurance (QA) protocols, particularly for triple-field analysis as per **AERB guidelines**.

By moving away from "black-box" solutions, medical physicists can gain full transparency over their calculations using a robust, scriptable environment.

---

## Technical Core: The Python QA Stack

The provided solution is built on a foundation of scientific computing and medical imaging libraries:

* **PyDicom:** For parsing and extracting raw pixel data from DICOM images.
* **NumPy:** For high-performance matrix operations and signal processing.
* **Matplotlib:** For generating high-fidelity beam profiles and visual overlays.
* **ReportLab:** For automating the generation of professional, clinical PDF reports.
* **Decimal:** To ensure fixed-point arithmetic precision, critical for medical calculations.

---

## Step-by-Step Guide: Performing Triple-Field Analysis

This framework supports two primary data workflows: 2D image analysis (EPID) and numerical data analysis (RF/Excel).

### Method 1: Using 2D Image Data (EPID DICOM)

1. **Data Acquisition & Loading:**
The script uses `pydicom` to read the pixel array. It handles vendor-specific variations—for instance, automatically inverting profiles for certain imaging systems to ensure that high-intensity regions correctly map to high-dose values.
2. **Profile Extraction:**
The tool extracts **Inline** (middle row) and **Crossline** (middle column) profiles. It centers the data and normalizes the intensity to 100% at the central axis.
3. **Processing & Inflection Point Detection:**
The algorithm utilizes a **first derivative concept**. By calculating the rate of change between adjacent points, it identifies the steepest slopes which represent the field edges and penumbra regions.
4. **Reporting:**
A PDF is generated containing:
* The original image with Inline/Crossline axes overlaid.
* Calculated metrics: **Penumbra**, **Field Size**, and **Inflection Points**.
* Specific dose widths at $X_{90\%}$, $X_{75\%}$, and $X_{60\%}$.



### Method 2: Using RF Data (Excel)

For users performing water tank measurements or exporting from a TPS:

1. **File Preparation:**
Input data is formatted into an Excel workbook with two sheets: `In-Line` and `Cross-Line`.
2. **Normalization:**
The script reads the distance (mm/cm) and dose values, then automatically normalizes the profile to 100% at the central axis (e.g., at the 0 cm position).
3. **Uniform Analysis:**
Once loaded, the data passes through the same mathematical engine as the DICOM method, ensuring consistency across different measurement tools.

---

## The Science: The First Derivative Concept

For **Flattening Filter Free (FFF)** beams, traditional "flat-top" analysis doesn't apply. This tool focuses on the **first derivative** to locate critical points. While secondary derivatives can be sensitive to "noise" in weekly QA data, the first derivative offers a balance of precision and robustness.

### Key Analysis Parameters

| Parameter | Calculation Logic | Clinical Significance |
| --- | --- | --- |
| **RDV** | Relative Dose Value at inflection points | Reference for field width |
| **Penumbra** | Distance between $0.4 \times RDV$ and $1.6 \times RDV$ | Evaluates beam sharpness |
| **Field Size** | Distance between left and right inflection points | Verifies MLC/Jaws calibration |
| **X90, X75, X60** | Beam width at specific dose percentages | Characterizes the FFF "peak" shape |

---

## Beyond Triple-Field: Modular QA Capabilities

Because the underlying engine is modular, the framework can be extended to include:

* **Winston-Lutz QA:** For isocenter verification using ball-bearing (BB) images.
* **Picket Fence Analysis:** To check Multileaf Collimator (MLC) alignment and transmission.
* **CBCT QA:** Automated processing of Catphan or Quantum phantoms to monitor imaging quality.

---

> ### ⚠️ Clinical Validation Note
> 
> 
> It is strongly recommended that all users validate the scripts and analyses against their institution's established protocols and gold-standard measurements. Python tools provide the math, but clinical judgment remains the final authority.

By leveraging the **open-source Python ecosystem**, medical physics departments can create transparent, reproducible, and highly efficient QA workflows that adapt to the evolving needs of modern radiotherapy.

---

## Global Standards and Regulatory Compliance

While this tool is optimized for the AERB's first-derivative inflection point method, it is designed with the flexibility to meet various international standards. In the United States, quality assurance protocols are primarily guided by the AAPM (American Association of Physicists in Medicine), specifically the TG-142 report, which emphasizes longitudinal consistency and task-group-specific tolerances. In Europe, clinical practice aligns with the ESTRO and EFOMP guidelines, often following the IAEA TRS-398 protocol for dosimetry.

>Regardless of the specific regulatory body—be it the ASN in France or the NRC in the USA—the core objective remains universal: ensuring the mechanical and dosimetric integrity of the linear accelerator. By automating the extraction of key parameters like penumbra and field size, this Python framework provides a transparent, reproducible bridge between these diverse international standards and daily clinical practice.

---

## Technical Validation and Algorithmic Precision

The core of this Python framework is designed to deliver the specific metrics required by international QA protocols, particularly for Flattening Filter Free (FFF) beams. By implementing a first-derivative analysis, the script identifies the steepest slope of the beam profile to locate the exact inflection points. This method is superior to traditional thresholding for FFF beams, as it provides a mathematically rigorous definition of the field edges.

>The tool outputs critical parameters including Field Size, Penumbra (Left/Right) calculated via the RDV-weighted method, and beam width indices at X90%, X75%, and X60%. These results allow for a comprehensive characterization of the beam's peak and energy stability. Furthermore, the inclusion of vendor-specific image processing (handling Elekta and Varian pixel inversions) ensures that the calculated results remain clinically accurate regardless of the acquisition hardware. By transforming raw DICOM or RF data into these standardized metrics, the script provides a direct, validated path to regulatory compliance and machine consistency.

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
        
        <p><a href="https://www.kaptan-data-solutions.app/contact/">Submit your project brief and receive a proposal</a></p>
    </div>
</body>
</html>