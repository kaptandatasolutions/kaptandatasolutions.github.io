---
layout: post
title: Building a Full-Stack Bookkeeping Application Zero to Production with AI and Claw Code
subtitle: Learn to develop an automated bookkeeping application with OCR, transaction matching, and cloud deployment, leveraging AI agents and powerful MPC servers
cover-img: /assets/img/full_stack_bookkeeping_app_with_claw_code_cover.png
thumbnail-img: /assets/img/full_stack_bookkeeping_app_with_claw_code.png
share-img: /assets/img/full_stack_bookkeeping_app_with_claw_code.png
tags: [AI, FullStack, WebDevelopment, Bookkeeping, OCR, ClawCode, Supabase, Vercel, NestJS, TypeScript, Automation]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

---

[![](/assets/img/full_stack_bookkeeping_app_with_claw_code.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

This guide details the process of building a full-stack bookkeeping application from the ground up, utilizing AI agents, specifically Claw Code, and several powerful MPC (Multi-agent Programming) servers. The application aims to automate expense tracking by processing bank statements and receipts with OCR, matching transactions, and providing a production-ready solution.

## Project Overview: The Automated Bookkeeping Application

The core idea is to create an automated expense tracking application capable of extracting data from receipts and bank statements using Google OCR (Gemini 2.0 Flash) and then intelligently matching these transactions. The system architecture includes:

*   **Bank Statement Management:** Users upload bank statements (PDF, CSV), which are broken down into individual transactions and stored in a `bank_transactions` table. The original files are stored in a storage bucket.
*   **Receipt Management:** Users upload receipts (images, PDFs). The OCR system extracts crucial data like purchase date, amount, vendor, and payment method, saving it to a `receipts` table.
*   **User Authentication:** Secure user sign-up and sign-in functionality using Supabase authentication.
*   **Transaction Matching:** The most critical feature, automatically matching transactions from bank statements with corresponding receipts for comprehensive bookkeeping.

The application leverages AI for planning, coding, verification, and refinement, employing a process of prompt generation, MPC server integration, implementation, and testing.

## Step-by-Step Development Process

### 1. Generating the Initial Prompt with AI

The process begins by crafting a detailed prompt using an AI assistant. This prompt, typically 200-300 words, outlines the application's purpose, features, and desired technologies. Key elements include:

*   **Application Goal:** Automated expense tracking.
*   **Features:** Receipt and invoice management (JPEG, PNG), Google Gemini 2.0 Flash for OCR, Supabase for storage, user CRUD operations for receipts, bank statement management, transaction matching, and user authentication.
*   **Extraction Details:** Specific fields to extract from receipts (e.g., last four digits of card, vendor, amount, taxes, purchase date) and bank statements (e.g., date, description, amount).
*   **Data Models:** Description of database tables and their relationships.
*   **User Flow:** How users interact with the application.

### 2. Installing and Configuring MPC Servers

Once the prompt is ready, the next step involves setting up several MPC servers. These servers empower AI agents to automate various development tasks.

#### a. Supabase MPC Server (Database and Storage)

Supabase serves as the application's database and storage backend.

1.  **Create Supabase Project:** Sign up for Supabase and create a new project (e.g., "bookkeeper-AI").
2.  **Connect to Claw Code:** In the Supabase project, navigate to the "Connect" section, select "MPC server," and choose "Claw Code" as the client. Follow the provided `npm install` command to add the Supabase MPC server to your Claw Code project.
3.  **Restart Claw Code & Authenticate:** Restart your Claw Code MPC server. Run the `/mcp` command in the terminal, select Supabase, and follow the authentication prompts to connect your Claw Code instance to your Supabase project.

#### b. Chassian MPC Server (UI Development)

Chassian is a UI library, and its MPC server helps in building beautiful and functional UI components.

1.  **Install Chassian:** Install the latest version of Chassian in your project.
2.  **Initialize Chassian MPC Server:** Configure the Chassian MPC server in your Claw Code setup (`npm install` and configuration).
3.  **Verify Integration:** Restart Claw Code and run `/mcp` to confirm that Chassian is now listed among the connected MPC servers.

#### c. SpecKit MPC Server (Planning and Development)

SpecKit (from GitHub) is a specification-driven development kit that helps plan the entire application before implementation.

1.  **Install SpecKit:** Install the SpecKit MPC server using the provided `npm install` command.
2.  **Initialize Project:** Run `specify init` in your project directory. Select Claw Code as the AI agent.
3.  **Define Constitution:** Create a `constitution` file to establish project principles (code quality, testing standards, user experience).
4.  **Generate Specification:** Use the `specify` command in Claw Code (e.g., `/specify <your_initial_AI_prompt>`). Answer any clarifying questions posed by the AI to refine the project's "what" and "why."
5.  **Create Implementation Plan:** Instruct the AI to create a comprehensive implementation plan, including a tech stack (e.g., NestJS 14 monorepo). This plan will break down the project into phases (e.g., database setup, authentication, receipts, bank statements, matching, dashboard, deployment) with estimated timelines.
6.  **Generate Tasks:** Use `spec kit tasks` to break the implementation plan into actionable, executable tasks. Each phase will have a list of tasks.

### 3. Implementation with Claw Code

With the tasks generated by SpecKit, Claw Code can now proceed with implementation.

1.  **Branching:** Create a new feature branch for each phase or set of tasks.
2.  **Execute Tasks:** Use the `/implementation` command in Claw Code, specifying the range of tasks to complete (e.g., `/implementation task 1 to 9`). Claw Code will follow the task list, writing code, configuring dependencies, and setting up directories.
3.  **Supabase Integration:** Claw Code, integrated with the Supabase MPC server, automatically creates database tables (e.g., `receipts`, `bank_transactions`) and configures schemas, relieving manual setup.
4.  **Credential Setup:** Ensure all necessary API keys and credentials (e.g., Supabase service role key, Google API key) are configured in environment variables (e.g., `.env.local` file).
5.  **Commit Changes:** After each phase or significant task completion, commit changes to the GitHub repository.
6.  **Iterate:** Repeat the implementation process for all subsequent phases until all 137 tasks are marked as complete.

### 4. Testing and Verification with Playwright

Once implementation is complete, the Playwright MPC server is used for automated testing.

1.  **Playwright MPC Server:** Playwright opens a browser and executes test plans, validating UI components, user flows, and core functionalities.
2.  **Report Generation:** After testing, Playwright generates a report detailing successful and failed tests, enabling refinement of the application.

### 5. Deployment with Vercel

The final step is to deploy the application to a production environment.

1.  **Vercel MPC Server:** Integrate the Vercel MPC server with Claw Code.
2.  **Deploy Application:** Instruct Claw Code (using the Vercel MPC server) to deploy the application. Claw Code understands the application's structure and dependencies, automating the CI/CD pipeline and deployment to Vercel.
3.  **Verify Deployment:** Access the deployed application through the provided Vercel URL to confirm it's live and functional.

## Key Features of the Completed Application

The resulting full-stack bookkeeping application includes:

*   **Dashboard:** Displays an overview of expenses, total taxes paid, top vendors, recent activities, and data health (match percentages). It uses charts to visualize monthly spending.
*   **Receipts Tab:** Shows all uploaded receipts with extracted data (vendor, category, amount, payment method) using Google OCR. Files are linked to the Supabase storage bucket.
*   **Transactions Tab:** Displays bank statement transactions, sortable by date and amount. Original CSV files are linked for viewing. Includes a status indicator for matched/unmatched transactions.
*   **Transaction Matching:** Automatically matches bank transactions with receipts, showing confidence scores. Users can view matched documents side-by-side.
*   **Data Export:** Allows users to export matched records as a CSV file, providing full control and ownership of their financial data.
*   **User Authentication:** Secure sign-in/sign-out functionality.
*   **Database:** Supabase hosts `bank_transactions` and `receipts` tables, storing all extracted and processed data.
*   **Storage:** Supabase buckets store original receipt images and bank statement files.

This comprehensive approach, leveraging AI agents and specialized MPC servers, significantly streamlines the development process, from initial planning to production deployment, for complex full-stack applications.
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