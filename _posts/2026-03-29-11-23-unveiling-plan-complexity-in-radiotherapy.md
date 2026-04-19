https://kaptan-data-solutions.app/kaptan-data-solutions.apphttps://kaptan-data-solutions.app/---
layout: post
title: Unveiling Plan Complexity in Radiotherapy
subtitle: A How-To Guide to Quantifying Treatment Plan Complexity Before QA
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/plan_complexity_matrix_analysis.png
share-img: /assets/img/plan_complexity_matrix_analysis.png
tags: [Radiotherapy, Medical Physics, Treatment Planning, Quality Assurance, Plan Complexity, VMAT, IMRT, SBRT, Open Source, Scripting]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/plan_complexity_matrix_analysis.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

In modern radiotherapy, advanced delivery techniques like Intensity-Modulated Radiotherapy (IMRT), Volumetric Modulated Arc Therapy (VMAT), and Stereotactic Body Radiotherapy (SBRT) enable highly conformal dose distributions. These techniques significantly improve target coverage and spare surrounding healthy tissues. However, this increased precision often comes at the cost of enhanced plan complexity.

Highly complex treatment plans, while delivering superior dose distribution, can be challenging to deliver accurately in a clinical setting. Such plans may even risk failing patient-specific quality assurance (PSQA) checks. This challenge led to a crucial question posed by medical physics researchers: "Can we quantify plan complexity *before* performing QA?"

This question sparked the development of plan complexity matrices, a concept that has been evolving for over a decade. These matrices provide a method to objectively assess the intricacy of a treatment plan, offering insights into its deliverability and potential for errors. Originally, these matrices were classified into two main categories: frequency-based and aperture-based. This guide will focus on utilizing an open-source script that employs aperture-based matrices.

### Understanding Plan Complexity Matrices

Plan complexity metrics help in predicting how accurately a radiotherapy plan can be delivered. By analyzing factors related to the modulated beam apertures, these metrics can flag plans that might pose challenges during treatment, allowing for adjustments before the patient even enters the treatment room. This proactive approach helps ensure both treatment quality and patient safety.

While initially, about seven core metrics were identified, the field has evolved, and now there are nearly 30 such metrics, including specialized ones like "small aperture scores" (e.g., 2mm and 5mm), which are particularly useful for SBRT plans with their highly fractionated and complex dose distributions.

### How to Evaluate Plan Complexity Using an Open-Source Script

This section provides a step-by-step guide to using an open-source script for evaluating plan complexity.

#### Step 1: Download the Open-Source Script Package

The complexity evaluation script is available as an open-source package. It’s important to note that this tool is intended *solely for non-clinical and research purposes*.

1.  **Access the Repository**: Locate the open-source repository that hosts the "medical affairs applied solution" package. This resource typically provides clear instructions and references to relevant publications.
2.  **Navigate to Releases**: Look for the "Releases" section within the repository. Here, you'll find different versions of the package compatible with various radiotherapy planning system versions (e.g., specific Eclipse versions).
3.  **Select and Download**: Choose the appropriate package for your system. Click on the corresponding zip file to download it. Source code is usually also provided, allowing for modifications and improvements by advanced users.
4.  **Extract the Files**: Once downloaded, extract the contents of the zip file to a location on your computer that is easily accessible. A recommended practice is to store it in a designated directory on your D: drive.

#### Step 2: Integrate and Run the Script

Once the script package is downloaded and extracted, follow these steps to integrate and run it within your planning system environment:

1.  **Open Your Planning System**: Launch your radiotherapy treatment planning system.
2.  **Select a Plan**: Load a treatment plan you wish to analyze. For demonstration, you might compare a simple conformal arc plan (low modulation) with a VMAT plan (higher modulation).
3.  **Access Scripting Tools**: Navigate to the "Tools" menu within your planning system.
4.  **Locate and Change Folder**: Select the option to "Change Folder" or "Browse" for a script location. This is where you will point the system to the extracted script package.
5.  **Navigate to the Script Location**: Browse to the folder where you extracted the plan complexity script.
6.  **Select and Run the Script**: Once the folder is accessed, select the main script file (e.g., a `.cs` or `.py` file, depending on the system's scripting language) and choose to run it.
7.  **Review Disclaimer**: A disclaimer will pop up, reiterating that the tool is for "non-clinical and research only" and is "a tool in evolution." Confirm your understanding by clicking "I agree."
8.  **Analyze the Metrics**: The script will then process the selected plan and display seven key complexity metrics:
    *   Average Area
    *   Average Leaf Positioning Opening
    *   Beam Regularity
    *   Beam Aperture
    *   Beam Weighted Aperture
    *   Emulated Beam Aperture
    *   Beam Modulation

#### Step 3: Interpret the Results

The output of the script provides quantitative data on your plan's complexity.

*   **Beam Modulation**: Pay close attention to the "Beam Modulation" value. For a simple conformal arc, this value will be close to zero, indicating minimal or no modulation. For VMAT plans, you will observe a significantly higher beam modulation value, reflecting the increased complexity.
*   **Correlation**: By comparing these metrics across different plan types (e.g., conformal vs. VMAT plans with varying controller settings), you can correlate specific values with the perceived complexity of the plan. This helps in understanding how factors like aperture area and modulation contribute to the overall plan complexity.

### Conclusion

Quantifying plan complexity before PSQA and treatment delivery is a critical step in modern radiotherapy. It provides medical physicists with a deeper understanding of plan quality and helps build confidence in the accurate delivery of highly modulated treatments. By leveraging open-source tools and the evolving suite of complexity metrics, we can proactively assess and mitigate potential delivery challenges, ultimately enhancing patient safety and treatment efficacy. This ongoing evolution in plan complexity assessment continues to transform how we evaluate and optimize radiotherapy treatment plans.


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