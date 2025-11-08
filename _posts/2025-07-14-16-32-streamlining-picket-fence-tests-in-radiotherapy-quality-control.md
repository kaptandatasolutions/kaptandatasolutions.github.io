---
layout: post
title: Streamlining Picket Fence Tests in Radiotherapy Quality Control
subtitle: A Step-by-Step Guide to Analyzing Multi-Leaf Collimator Alignment with Interactive Tools
cover-img: /assets/img/demo_web_application_picket_fence.png
thumbnail-img: /assets/img/demo_web_application_picket_fence.png
share-img: /assets/img/demo_web_application_picket_fence.png
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
tags: [Radiotherapy, Quality Control, Streamlit, Data Analysis, Python, Medical Physics]
---

In the field of radiotherapy, ensuring the precision of equipment like multi-leaf collimators (MLCs) is crucial for patient safety and treatment efficacy. One essential quality control procedure is the picket fence test, which verifies the alignment and positioning accuracy of MLC leaves. Traditionally, this test involves capturing images from electronic portal imaging devices (EPIDs) and manually analyzing them, a process that can be time-consuming and prone to human error.

Fortunately, advancements in data science and web development have led to the creation of interactive tools that automate and simplify this analysis. In this article, we'll explore how an interactive web application built with Streamlit can revolutionize picket fence test evaluations. I'll walk you through the underlying concepts and provide a step-by-step guide on how to use such a tool to process your EPID images efficiently. This approach not only saves time but also enhances accuracy by leveraging automated algorithms for peak detection and error calculation.

### Understanding the Picket Fence Test

The picket fence test is a standard quality assurance method used in linear accelerators (linacs) to check MLC leaf positioning. It involves irradiating a pattern that resembles a picket fence—narrow strips of radiation separated by gaps. The resulting EPID image shows these strips, and any misalignment in the MLC leaves appears as deviations in the strip positions.

Key metrics evaluated in this test include:
- **Leaf positioning errors**: Deviations from expected positions, typically required to be within 1 mm.
- **Peak detection**: Identifying the centers of the irradiated strips.
- **Gap uniformity**: Ensuring consistent spacing between leaves.

Manual analysis often requires software like image processing tools, but an automated web app streamlines this by handling image upload, processing, and result visualization in one interface.

### Benefits of Using an Interactive Web App for Analysis

Interactive web applications offer several advantages over traditional methods:
- **Accessibility**: Run directly in a web browser without needing specialized software installations.
- **Automation**: Algorithms automatically detect peaks, calculate errors, and generate reports.
- **Visualization**: Real-time plots and overlays help users quickly spot issues.
- **Customization**: Options to adjust parameters like threshold levels or region of interest (ROI).
- **Efficiency**: Process multiple images in batches, ideal for routine quality checks.

These tools are particularly valuable for medical physicists and technicians who perform regular QA tasks, reducing workload and improving consistency.

### Step-by-Step Guide: Analyzing Picket Fence Images with the Web App

Here's a detailed, step-by-step procedure to perform a picket fence analysis using an interactive Streamlit-based web application. This guide assumes you have access to the app (typically hosted online) and have your EPID images ready in a supported format like DICOM or TIFF.

#### Step 1: Access the Application
Open your web browser and navigate to the app's URL. The interface should load with a clean dashboard featuring upload buttons and parameter settings. No login is required for basic use, making it quick to start.

#### Step 2: Upload Your EPID Image
- Locate the file upload section on the main page.
- Select your picket fence image file from your local drive. The app supports common formats used in radiotherapy imaging.
- Once uploaded, the app will display a preview of the image to confirm it's the correct one.

#### Step 3: Set Analysis Parameters
- Adjust the region of interest (ROI) if needed. This might involve dragging a bounding box over the area containing the picket fence pattern to focus the analysis.
- Configure detection settings, such as:
  - Minimum peak distance: To ensure proper spacing between detected strips.
  - Prominence threshold: To filter out noise and identify true peaks.
  - Smoothing factors: For applying filters to the image data and reducing artifacts.
- These parameters can often be left at defaults for standard tests, but tweaking them helps in noisy images.

#### Step 4: Run the Analysis
- Click the "Analyze" button to initiate processing.
- The app will perform the following automated steps behind the scenes:
  - Image preprocessing: Convert to grayscale, apply Gaussian filtering for noise reduction.
  - Profile extraction: Generate horizontal or vertical profiles across the image.
  - Peak detection: Use algorithms like SciPy's find_peaks to locate strip centers.
  - Error calculation: Compare detected positions against ideal grid positions and compute deviations.
- Processing typically takes seconds, depending on image size.

#### Step 5: Review the Results
- The app displays interactive visualizations, including:
  - Overlaid plots showing detected peaks on the image.
  - Error histograms or tables listing deviations for each leaf pair.
  - Pass/fail indicators based on tolerance levels (e.g., green for <1 mm error, red for failures).
- Zoom in on plots or export data as CSV for further review.

#### Step 6: Generate and Download Reports
- If the analysis meets QA criteria, generate a PDF report summarizing findings, including images, metrics, and timestamps.
- Download the report for documentation or sharing with your team.
- For batch processing, upload multiple files and repeat the steps to get consolidated results.

#### Step 7: Troubleshoot and Iterate
- If results seem off (e.g., missed peaks), adjust parameters and re-run the analysis.
- Common issues include overexposed images or misaligned ROIs— the app often provides tips or error messages to guide corrections.

By following these steps, you can complete a full picket fence analysis in minutes, compared to hours with manual methods. This not only ensures compliance with standards like those from AAPM (American Association of Physicists in Medicine) but also frees up time for other critical tasks.

### Tips for Optimal Results
- Always calibrate your EPID device before capturing images to minimize baseline errors.
- Use high-resolution images for better peak detection accuracy.
- Regularly update the app if it's cloud-hosted, as improvements in algorithms can enhance performance.
- Integrate this tool into your workflow by automating image transfers from your linac system.

### Conclusion

Adopting interactive web apps for picket fence tests represents a significant leap forward in radiotherapy quality control. By automating complex analyses, these tools empower medical professionals to maintain high standards of precision with less effort. Whether you're a seasoned physicist or new to QA procedures, this step-by-step approach makes the process accessible and reliable. Experiment with the app on your next test, and experience the difference in efficiency and insight.

If you're interested in customizing such tools for your specific needs or integrating them with other QA processes, exploring advanced data solutions can further optimize your operations.



<html lang="fr">
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
    </div>
</body>
</html>