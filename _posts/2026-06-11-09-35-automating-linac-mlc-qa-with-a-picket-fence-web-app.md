---
layout: post
title:  Automating Linac MLC QA with a Picket Fence Web App
subtitle:  A step‑by‑step walkthrough of a demo application for Picket Fence analysis, from image upload to AI‑driven reporting
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/picket_fence_data_analysis_app_demo.png
share-img: /assets/img/picket_fence_data_analysis_app_demo.png
tags: [Medical Physics, Quality Assurance, Linac, Picket Fence, Python, PyLinac, Automation, Data Science]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/picket_fence_data_analysis_app_demo.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Picket Fence tests are an essential part of routine quality assurance for linear accelerators (linacs). They verify the alignment and reproducibility of multi‑leaf collimator (MLC) positions, ensuring that radiation fields are delivered accurately. Traditionally, this analysis is done manually or with offline software, but modern web‑based applications can streamline the process and add intelligent features.

In this article, we walk through a demo Picket Fence web application that is built with Python and the [PyLinac](https://pylinac.github.io/) library. The app is designed for medical physicists who want a fast, interactive, and reproducible workflow for MLC QA. It also includes an optional AI‑driven expert report and a PDF generator.

## How the Application Works

The app is hosted online and can be accessed from any modern browser. It follows a clear, logical flow that guides you from data import to final reporting.

### Step 1: Upload the Picket Fence Images

You start by loading the DICOM or standard images taken during the test. The application supports up to five images – the typical number required for a complete NSM (National Standards of Measurement) analysis. For demonstration, you can load a single image, though using all five gives a more comprehensive evaluation.

After uploading, a preview of the image appears, and basic import information is displayed. The interface is clean and responsive.

### Step 2: Run the Analysis

Once the images are loaded, simply click on the “Analyse Result” button. The analysis engine, powered by PyLinac, processes each image. Because the computation is light (especially for a single image), the results appear almost instantly.

The app displays a series of interactive panels that open and close as you explore the data.

### Step 3: Review the Results

The analysis summary appears first, showing a clear pass/fail status. In the demo, all measurements are within the tolerance of 0.6 mm (as defined by the NSM 2023 standard). You can adjust the tolerance settings in the top‑most tab to match your own departmental limits.

The application provides several visualization and data views:

- **Leaf‑by‑leaf deviation chart** – Each leaf’s position error is plotted, so you can immediately identify the worst‑performing leaves. A table lists the top five worst and best leaves, making it easy to spot trends.

- **Visual overlay** – This helps with the weekly visual inspection. You can see a graphical representation of the MLC positions relative to the expected pattern.

- **Spacing deviation table** – For every 15 mm interval, the app calculates the actual vs. expected position. For example, a leaf expected at 60 mm might measure at 59.5 mm – a small deviation that still stays within the 0.6 mm tolerance.

- **Histograms** – Provided by PyLinac, these show the distribution of leaf errors. You can click on any leaf in the chart (e.g., leaf 11 of the first picket) to see its performance highlighted in other panels.

### Step 4: Generate an AI Expert Report

One of the most useful features is the AI‑driven report. By clicking “Generate de NSMS Expert IA Analysis”, the app creates a detailed document that interprets the results according to the NSM standard. It includes recommendations and contextual explanations – not just raw numbers. This is invaluable for physicists who need to produce regulatory documentation or explain findings to non‑technical stakeholders.

### Step 5: Produce the Final PDF Report

When you are satisfied with the analysis, you can generate a PDF report. You can optionally include the AI expert analysis by checking a box. Simply enter your name and click “Download”. The PDF opens with all the graphs, tables, and the AI commentary neatly formatted.

The output includes:

- Analysis summary  
- Leaf deviation charts  
- Worst/best leaf tables  
- Visual overlay  
- Spacing deviations  
- Histograms  
- AI expert remarks (if selected)

Everything is ready for archiving or submission to the hospital’s QA system.

## Why This Approach Matters

Using a web‑based Picket Fence app brings several practical benefits:

- **Accessibility** – No need to install software; any device with a browser can run it.  
- **Consistency** – The analysis logic is identical every time, reducing human error.  
- **Speed** – Results are produced in seconds, freeing physicist time for other tasks.  
- **Traceability** – The PDF report provides a complete audit trail.  
- **Intelligence** – The AI expert report adds insight beyond simple pass/fail, helping to identify subtle trends before they become problems.

Medical physicists can adapt the tolerance settings and analysis parameters to align with local protocols, making the tool flexible for different facilities.

## Conclusion

This demo Picket Fence web application shows how Python, PyLinac, and a thoughtful user interface can transform routine MLC QA into a smooth, semi‑automated process. From uploading images to generating a professional PDF with AI analysis, the workflow is designed to save time and improve quality.

While the demo uses a single image, the full version handles all five required NSM images. Whether you are performing weekly checks or deep‑dive annual evaluations, such a tool can become a central part of your linac QA program.

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
      <a href="https://kaptandatasolutions.github.io/">🌐 Explorez tous nos services et actualités tech</a><br>
      <a href="https://kaptan-data-solutions.app/">💻 Testez nos dashboards QA en ligne</a><br>
      <a href="https://www.kaptan-data-solutions.app/upcoming_saas/">Notre SaaS de physique médicale arrive bientôt — conçu pour la radiothérapie, l'imagerie et la médecine nucléaire.</a>
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