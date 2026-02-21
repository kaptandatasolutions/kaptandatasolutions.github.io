---
layout: post
title: The Next Generation Radiotherapy QA Platform Revolutionizing Medical Physics
subtitle: Unifying Automated Analysis, ANSM Compliance, and Python Intelligence for Medical Physicists
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/radiotherapy_quality_control_saas_platform.png
share-img: /assets/img/radiotherapy_quality_control_saas_platform.png
tags: [Radiotherapy, Medical Physics, Quality Assurance, SaaS, Automation, Python, DICOM, ANSM, Healthcare Tech]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/radiotherapy_quality_control_saas_platform.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

The landscape of medical physics and radiotherapy quality control is undergoing a significant transformation. A new specialized SaaS platform is poised to redefine how medical physicists manage their daily QA tasks, ensuring compliance, enhancing efficiency, and fostering innovation. This platform aims to address critical gaps in existing solutions by offering a unified ecosystem that integrates automated analyses, regulatory compliance (specifically ANSM 2023), and an open Python environment.

### The Vision A Unified Ecosystem for Radiotherapy QA

Current challenges in radiotherapy QA often stem from a fragmented approach, where medical physicists rely on multiple disconnected tools, leading to data silos, cumbersome workflows, and difficulties in maintaining regulatory compliance. This platform is designed to overcome these hurdles by offering a cohesive solution with three core innovations:

1.  **Open Python Analysis Hub:** Unlike proprietary "black box" systems, this platform provides an open environment where physicists can deploy their own Python analysis modules via a REST API. The results from these custom scripts are directly fed into the ANSM compliance dashboard, integrating specialized analyses seamlessly into the regulatory framework. This is a game-changer, allowing for unparalleled customization and research integration.
2.  **Regulation-as-Architecture:** The platform is built with the ANSM 2023 Decision (UC1–UC8, S1–S3) as its foundational architecture, not an afterthought. Navigation, data models, and reports are inherently structured around these control units, simplifying compliance management and reporting.
3.  **Data Silo Unification:** Recognizing that centers often use 3 to 7 disconnected tools, the platform features a robust import engine. It can ingest data from various sources (CSV, DICOM, proprietary formats like those from water phantoms, MatriXX, and PTW) to create a unified audit trail linked to each machine and control unit.

### Key Features For Comprehensive Quality Assurance

The platform brings together a comprehensive suite of features, finally housing everything a medical physicist needs in one place, from routine checklists to advanced analytics and reporting.

*   **Compliance Dashboard:** Offers a real-time, at-a-glance view of compliance status per machine and control unit (UC). It highlights compliance rates, generates overrun alerts, and flags urgent actions.
*   **Automated Analyses (powered by pylinac):** Upload DICOM images and get annotated results for critical QA tests like Picket Fence, Winston-Lutz, Starshot, VMAT QA, and Field Analysis in under 60 seconds.
*   **Digital ANSM Checklists:** A tablet-optimized interface with large 'OK/NOK' buttons, digital signatures, and live global results for UC1, UC5, UC6, UC7, and UC8.
*   **External Data Import:** Allows importing results from existing QA tools with configurable column mapping and the ability to attach PDFs or images for complete documentation.
*   **Scheduling & Alerts:** Automatically applies ANSM periodicities and sends email alerts at D-7, D-3, D-1, Day 0, and for overruns, ensuring no control is missed.
*   **1-Click Audit Report:** Generates structured PDF/Excel reports, including a cover page, machine inventory, UC-by-UC summaries, and all evidence with signatures and timestamps.
*   **Multi-site & Multi-machine Management:** Provides department heads with oversight across multiple sites and supports various linac types, including Varian & Elekta (Millennium MLC, HD MLC, Agility, Halcyon).
*   **Security & Data Integrity:** Ensures immutable validated results, an append-only audit trail, 8-hour session limits for shared workstations, AES-256 encryption at rest, and TLS 1.2+ in transit.

### Designed for You Real-World Scenarios

The platform is designed to cater to the diverse needs of a medical physics department, with specific functionalities benefiting different roles:

*   **Clinical Medical Physicists (e.g., Dr. Sophie Morel):** Start the day with a tablet, quickly check machine status, complete pending QA tasks like Picket Fence, and have an ANSM-ready audit file generated instantly.
*   **Physicist-Developers (e.g., Dr. Karim Benali):** Integrate custom Python scripts for advanced drift detection into the ANSM dashboard via the REST API, making personal innovations accessible and actionable for the entire team.
*   **Heads of Physics Departments (e.g., Dr. Laurent Dubois):** Oversee multiple sites and linacs from a single dashboard, easily identify overdue controls, reassign tasks, and ensure consistent quality across the department.

### Why This Solution Stands Apart

Existing solutions often fall short by lacking open integration, native regulatory compliance, or comprehensive data unification. This new platform distinguishes itself by:

*   Offering an **Open Python backend** with REST API and modules.
*   Providing a **Native ANSM 2023 structure**, covering 100% of UC1–UC8.
*   Enabling **Third-party data import** from diverse sources like CSV, DICOM, and proprietary formats.
*   Allowing **Custom module deployment** in 'Physicist-Dev mode'.
*   Presenting a **Multi-source compliance view** that integrates automated checks, checklists, and imported data.
*   Generating **1-click audit reports** in structured PDF/Excel formats.
*   Offering **Affordable SaaS pricing**, making advanced QA accessible.

### Roadmap Towards the Future

The development roadmap is ambitious, with clear phases toward becoming a leading reference in medical physics:

*   **MVP (Closed Beta):** Establishing foundations with the compliance dashboard, core pylinac analyses (Picket Fence, Winston-Lutz), digital checklists (UC1/UC5/UC6/UC7), CSV import, and PDF/Excel report generation.
*   **Phase 2 (+3-6 months):** Expanding with the Physicist-Developer mode, documented REST API, additional analyses (VMAT QA, Field Analysis), proprietary format import (PTW, IBA), trend visualization, and external auditor roles.
*   **Phase 3 (+12-18 months):** Broadening scope to include CBCT/CatPhan (UC4C), planar imaging (UC4B), inter-center module sharing, advanced multi-site dashboards, and initial international expansion to francophone centers.
*   **Vision (24 months+):** Integrating predictive intelligence via ML for drift detection, supporting legal ANSM registry, multi-regulation (IEC, AAPM TG-142), a community marketplace, and support for S2 Cyberknife / S3 Tomotherapy.

This platform is compliant with the ANSM Decision 28/02/2023, functions as a Quality Control Support Tool, and is exempt from IEC 62304 as a non-medical device.

### Join the Beta Program

Medical physicists are invited to join the beta program to help shape this transformative tool. Early adopters will gain direct influence on features, secure lifetime preferential pricing, receive dedicated support, and be among the first to have an ANSM audit-ready solution. The platform emphasizes data security with AES-256 encryption, full export capabilities, and 5-year ANSM data retention, all while being designed in France for French regulation with an open Python philosophy.

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