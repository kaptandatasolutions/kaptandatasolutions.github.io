---
layout: post
title: Surface Guided Radiotherapy A Game Changer in Breast Cancer Treatment
subtitle: Enhancing Precision and Patient Experience in Radiotherapy
cover-img: /assets/img/radiotherapy_surface_guided_precision_cover.png
thumbnail-img: /assets/img/radiotherapy_surface_guided_precision.png
share-img: /assets/img/radiotherapy_surface_guided_precision.png
tags: [Radiotherapy, Cancer Treatment, Medical Innovation, Patient Care, SGRT, Breast Cancer]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/radiotherapy_surface_guided_precision.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Radiotherapy is a critical treatment for many cancers, particularly breast cancer. The core challenge lies in delivering precise radiation to the tumor while meticulously sparing surrounding healthy tissues. This requires millimeter-level accuracy, consistently maintained across thousands of treatment sessions for each patient. Traditionally, achieving this precision involved creating small, permanent tattoos on the patient's skin, which served as reference points for aligning the treatment machine. While effective, this method carried two significant drawbacks: it left a permanent mark on the patient and could sometimes lead to suboptimal alignment.

### The Rise of Surface Guided Radiotherapy (SGRT)

A groundbreaking innovation is now transforming this landscape: Surface Guided Radiotherapy (SGRT). Imagine a powerful GPS for the human body. SGRT projects thousands of light points onto the patient's skin, creating a highly detailed, real-time 3D map of their surface. This system can detect even the slightest micromovements with incredible precision, all without physical contact or additional radiation exposure.

### A Large-Scale Case Study: Icon Cancer Centre

The Icon Cancer Centre network embraced SGRT with clear objectives:

1.  **Eliminate Tattoos:** Provide tattoo-free treatments, improving patient comfort and experience.
2.  **Enhance Accuracy for Breath-Hold Techniques:** Improve the monitoring of breath-hold techniques, vital for protecting organs like the heart during treatment.
3.  **Optimize Patient Setup Time:** Accelerate the patient setup process.
4.  **Standardize Procedures:** Ensure consistent treatment protocols across all facilities.

To validate the real-world efficacy of SGRT, Icon implemented the system in 22 of its radiotherapy centers across 23 different treatment machines. This extensive deployment provided a robust, large-scale validation under actual clinical conditions.

### How SGRT Works: Creating a Reference Map

The success of SGRT hinges on establishing a reliable "Region of Interest" (ROI) – a 3D surface map that serves as the system's guide. For optimal accuracy, this ROI must meet specific criteria:

*   **Distinct Relief:** Select an area with clearly defined anatomical features close to the target treatment site.
*   **Avoid Independent Movement:** Exclude body parts that can move independently, such as shoulders or the abdomen.

It's also important to note that the SGRT implementation can vary slightly depending on the type of treatment machine:

*   **TrueBeam Accelerators:** The process is relatively straightforward.
*   **Ethos Adaptive Therapy System (previously Halcyon):** These ring-shaped machines require a slightly different approach. Patients are initially aligned externally, and then a mechanism moves them inside the ring. This alters what the cameras can "see," necessitating an adaptation in the alignment strategy.

### The Impact: Results and Benefits

An analysis of over 580 treatment sessions revealed compelling results:

#### **1. Increased Efficiency:**

In a center where the team remained consistent before and after SGRT installation, the average session time decreased from approximately 18 minutes to under 14 minutes. This represents a significant gain in efficiency, streamlining operations for both staff and patients.

#### **2. Unprecedented Precision:**

The most impressive outcome was the achieved precision. The average difference between the position indicated by the surface guidance system and that verified by internal imaging was less than 0.05 cm – less than one millimeter. This exceptional level of accuracy was observed across both TrueBeam and Ethos/Halcyon machines and across all translational axes of movement. The data demonstrated an almost perfect correlation with internal anatomy, confirming that relying on the skin's surface accurately reflects internal positioning.

#### **3. High Staff Adoption and Confidence:**

A survey of over 50 staff members showed overwhelming support for SGRT, with nearly 90% in favor and no opposition. This high level of confidence and adoption among clinical teams underscores the system's practical benefits and ease of integration into daily workflows.

### Conclusion: A New Era in Radiotherapy

This extensive case study highlights several key advantages of SGRT:

*   **No Tattoos:** A significant improvement in patient comfort and psychological well-being.
*   **High Precision:** Millimeter-level accuracy ensures targeted radiation delivery and reduces damage to healthy tissues.
*   **Time Savings:** Reduced treatment setup times improve clinic workflow and patient throughput.
*   **Enhanced Real-Time Monitoring:** Clinical teams gain greater confidence in monitoring patients in real-time, detecting any movement instantly.

As one staff member aptly summarized, beyond the efficiency gains, the enhanced confidence derived from real-time monitoring of even the slightest patient movement is fundamental for safety. SGRT marks a pivotal step in radiotherapy, prioritizing both clinical excellence and the patient experience. The question now is, what will be the next innovation to further center patient comfort and experience in cancer treatment?

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