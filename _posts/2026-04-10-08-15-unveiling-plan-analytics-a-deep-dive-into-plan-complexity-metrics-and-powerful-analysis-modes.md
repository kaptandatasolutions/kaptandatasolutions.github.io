---
layout: post
title: Unveiling Plan Analytics A Deep Dive into Plan Complexity Metrics and Powerful Analysis Modes
subtitle: Explore over 30 plan complexity metrics, advanced analysis modes and how to leverage this open-source tool for robust plan evaluation.
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/advanced_plan_complexity_matrix_analysis.png
share-img: /assets/img/advanced_plan_complexity_matrix_analysis.png
tags: [Plan Analytics, Plan Complexity, Medical Physics, Quality Assurance, Open Source, Data Analysis, Treatment Planning, Dosimetry]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/advanced_plan_complexity_matrix_analysis.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

In the realm of medical physics and radiation therapy, understanding and evaluating the complexity of treatment plans is paramount for ensuring accurate and safe patient care. While previous tools offered a glimpse into plan complexity, a new open-source application, Plan Analytics, provides an unprecedented level of detail, boasting nearly 30 plan complexity metrics and various analysis modes. This blog post will guide you through its features, helping you leverage this powerful tool for comprehensive plan evaluation.

## Introduction to Plan Analytics

Plan Analytics is an advanced tool that expands upon previous iterations, offering a robust suite of metrics and analysis capabilities. It allows users to go beyond basic plan assessment, delving into granular details that impact treatment quality and deliverability. The application is available as an open-source tool on GitHub under the name "Plan Complexity Leads," with local modifications for enhanced visualization and analysis.

## Understanding the Nearly 30 Plan Complexity Metrics

The core of Plan Analytics lies in its extensive collection of metrics, categorized into four key areas:

1.  **Primary Complexity Metrics**
    These metrics assess the fundamental complexity of a treatment plan.
    *   **Modulation Complexity Score (MCS):** A key indicator of overall plan modulation.
    *   **Leaf Sequence Variability:** Measures the inconsistency in leaf movements.
    *   **Aperture Area Variability:** Quantifies the variation in MLC aperture sizes.
    *   **Mean Field Area:** The average area of the MLC apertures during delivery.

2.  **Secondary Complexity Metrics (Aperture-Based)**
    These metrics focus specifically on the intricacies of the MLC aperture.
    *   **Leaf Travel:** The total distance traveled by the MLC leaves.
    *   **Plan Aperture Modulation:** The degree of modulation within the MLC apertures.
    *   **Plan Beam Aperture Modulation:** Similar to the above, but applied to the beam as a whole.

3.  **Accuracy Metrics**
    These metrics are crucial for evaluating the dosimetric accuracy of a plan.
    *   **Mean Asymmetric Systems:** Reflects the asymmetry in the beam or MLCs.
    *   **Tongue and Groove Index:** Measures the effect of tongue-and-groove leakage between MLC leaves.

4.  **Deliverability Metrics**
    These metrics provide insights into the characteristics of treatment delivery.
    *   **MU per Control Arc:** The monitor units required for each control point in an arc.
    *   **Leaf Travel per MU:** The distance traveled by leaves normalized by monitor units.
    *   **Leaf Speed:** The speed at which MLC leaves move during delivery.
    *   **Beam-On Dose State:** Metrics related to the dose delivery state during treatment.
    *   **Mean Dose Evaluation:** The average dose delivered.
    *   **Jaw Area:** The area covered by the jaws.
    *   **Average Dose Rate:** The average rate of dose delivery.
    *   **Average Speed:** The average speed of the gantry or other moving components during treatment.

For a deeper understanding of each metric, the tool provides comprehensive technical refinements and references to relevant publications within its documentation section. This allows users to understand the coordinate systems and underlying principles of each calculation.

## Analysis Modes: A Workflow for Comprehensive Evaluation

Plan Analytics offers four distinct analysis modes, each designed for specific evaluation needs:

### 1. Single Plan Analysis

This mode allows for a detailed examination of an individual treatment plan.

**How to Use:**
1.  **Select "Single Plan Analysis".**
2.  **Drag and drop your DICOM RT plan file** (e.g., RT Plan.dcm) or click to browse and select it.
3.  The application will automatically load the plan, displaying details such as the number of beams and beam parameters.
4.  **Visualize the Plan:** Scroll down to see a visual and graphical representation of the plan, including jaw tracking, jaw area, and MLC aperture movement.
5.  **Review Complexity Metrics:** The most crucial section displays the overall plan metrics, categorized by primary complexity, dosimetric accuracy, secondary metrics, and deliverability characteristics. Beam-specific metrics are also available.
6.  **Export Results:** You can export the complexity matrix as a CSV, Excel, or PDF file for further analysis or reporting.

### 2. Batch Analysis

This mode is ideal for analyzing multiple plans simultaneously, allowing for efficient comparison and data extraction.

**How to Use:**
1.  **Select "Batch Analysis".**
2.  **Upload multiple plan files.**
3.  The application will process all selected plans, displaying their complexity and beam characteristics.
4.  **Export Results:** Similar to single plan analysis, batch results can be exported in Excel, JSON, and PDF formats. Notably, the batch analysis also allows for changing preset machine parameters (e.g., Varian, TrueBeam, Elekta) for tailored evaluation.

### 3. Plan Comparison

This powerful mode enables a side-by-side comparison of two treatment plans, highlighting differences in complexity and delivery characteristics.

**How to Use:**
1.  **Select "Plan Comparison".**
2.  **Designate a "Reference Plan" (Plan A) and a "Comparison Plan" (Plan B).** Drag and drop or browse to load them.
3.  **Visual Comparison:** The tool provides a visual representation of how Plan A and Plan B differ, showcasing aspects like MLC aperture shapes and control point settings at specific gantry angles. For instance, comparing a VMAT plan with tight aperture modulation to a simpler static field plan will visually demonstrate the differences.
4.  **Metric Comparison:** A dedicated section displays the percentage change in various metrics between Plan A and Plan B. This includes changes in total MU, plan aperture area, modulation complexity, and aperture area variability.
5.  **Delivery Comparison:** You can compare how Plan A and Plan B utilize the MLCs across control angles, providing insights into their modulation distribution.
6.  **Export Results:** Plan comparison results can be exported as a PDF file.

### 4. Statistical Analysis

For a deeper understanding of plan trends and correlations across a larger dataset, the statistical analysis mode is invaluable. This mode is particularly useful when you have 50-100 or more plans to analyze.

**How to Use:**
1.  **Select "Statistical Analysis".**
2.  **Upload multiple plans** (preferably from the same category or disease site).
3.  The application generates various statistical visualizations:
    *   **Scatter Plots:** To visualize correlations between different metrics.
    *   **Correlation Matrices:** To quantify the relationships between all selected metrics.
    *   **Violin Plots:** To display the distribution of individual metrics across the dataset.
4.  **Customize Metrics:** You can select and change the metrics displayed in the plots to focus on specific areas of interest.
5.  **Detailed Statistics:** A table provides detailed statistical information for each metric, including range, mean, and standard deviation. This helps in identifying outliers and understanding the overall spread of complexity within your dataset.
6.  **Geometrical Value Analysis:** The tool also allows for geometrical value analysis, providing statistics related to the spatial characteristics of the plans.

## Conclusion

Plan Analytics offers a groundbreaking approach to treatment plan evaluation. Its extensive suite of metrics, coupled with intuitive analysis modes, empowers medical physicists to gain a deeper understanding of plan complexity, enhance quality assurance processes, and ultimately improve patient safety. By leveraging this open-source tool, clinics can streamline their plan review workflows, identify potential issues early, and make data-driven decisions to optimize radiation therapy delivery.

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
        
        <p><a href="https://kaptandatasolutions.github.io/submit-project/">Submit your project brief and receive a proposal</a></p>
    </div>
</body>
</html>