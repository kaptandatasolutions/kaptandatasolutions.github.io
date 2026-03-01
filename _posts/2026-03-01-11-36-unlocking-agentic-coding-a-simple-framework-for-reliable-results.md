---
layout: post
title: Unlocking Agentic Coding A Simple Framework for Reliable Results
subtitle:  Mastering AI-driven development with a practical, repeatable framework for new projects
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/simple_framework_for_agentic_coding.png
share-img: /assets/img/simple_framework_for_agentic_coding.png
tags: [AI, Coding, Development, Framework, Automation, Agents, Productivity]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/simple_framework_for_agentic_coding.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

In the rapidly evolving world of AI and software development, leveraging coding agents can significantly accelerate your workflow, especially for greenfield projects. This article outlines a straightforward, yet powerful, framework for working with AI coding assistants, ensuring reliable and repeatable results without over-engineering.

### The Problem with Over-Engineered Frameworks

Many existing frameworks for AI coding agents are complex and difficult to adapt to individual needs. The goal here is to provide a "dead simple" framework that focuses on getting the job done efficiently, allowing developers to concentrate on building their ideas rather than managing an overly intricate system. This approach is universally applicable, regardless of the specific coding agent you use.

### The Two Pillars of Agentic Coding

This framework is divided into two main parts: initial planning and iterative development.

#### Part 1: Initial Planning – The AI Layer

The "AI layer" refers to all assets in your codebase designed to be context for your coding agent. This crucial initial step sets the stage for a smooth development process.

**Step 1: Define the Minimum Viable Product (MVP) with a PRD**

The first step is to create a Product Requirements Document (PRD), which outlines the initial scope of work for your application's MVP.

1.  **Brain Dump**: Start with an unstructured conversation with your AI assistant. Explain your project idea, desired tech stack (e.g., Next.js, Neon for database, Neon authentication), and architectural preferences. For example, building a self-hosted "Linktree-like" page builder with custom links, analytics, and theming.
2.  **Utilize Sub-Agents for Research**: Instruct your AI to spin off specialized sub-agents for web research on best practices (e.g., for link tree applications or authentication solutions). This isolates heavy research tasks and keeps the main agent's context clean.
3.  **Minimize Assumptions with Questions**: Crucially, ask your AI to return with a list of clarifying questions after its initial research. This dramatically reduces assumptions the agent might make, preventing misalignments that lead to significant code rework later. Tools allowing multiple-choice or free-text answers for these questions are highly effective.
4.  **Structure the PRD**: Once questions are answered and clarifications made, use a "create PRD" command (more on commands later) to generate a structured PRD. This document will detail the MVP scope, out-of-scope items, directory structure, and, importantly, phases of work for granular implementation.

**Step 2: Establish Global Rules and On-Demand Context**

Next, set up the rules that dictate *how* your AI agent should build things.

1.  **Global Rules (`agents.md`)**: Create a file (e.g., `agents.md`) for universal constraints and conventions. This includes commands to run the application, testing strategies, logging strategies, project structure, and coding patterns. These rules are loaded into the agent's context for every conversation, so keep them concise.
2.  **On-Demand Context (Reference Folder)**: For more specific guidance that isn't always needed, use a "reference" folder with files like `frontend-guide.md` or `api-endpoints.md`. The AI loads these only when working on specific parts of the application, ensuring context remains focused and precious tokens aren't wasted.
3.  **Commandify Rule Creation**: Use a "create rules" command to automate the generation of initial global rules. This command can prompt the AI to explore the PRD, tech stack, and architecture, perform web research on relevant strategies, and integrate this information into your rule template.

#### Part 2: Iterative Development – The PIV Loop

With the AI layer established, you move into iterative development using the PIV (Plan, Implement, Validate) loop. This process breaks down the PRD phases into manageable, focused work units.

**Step 1: Prime the Agent**

Before starting a new PIV loop, run a "prime" command. This command guides the AI through exploring the codebase, understanding its current state, previous changes (using Git logs as long-term memory), and identifying the next feature to implement based on the PRD's phases of work. The prime command generates an output report, allowing you to validate the agent's understanding.

**Step 2: Plan the Feature (Vibe Planning)**

Each PIV loop begins with detailed task-specific planning.

1.  **Unstructured Conversation**: Engage in "vibe planning" – an unstructured conversation with your AI about the specific feature (e.g., "Foundation" phase from the PRD). Discuss general ideas, architectural specifics for this feature, and potential sub-agents for code analysis.
2.  **Structured Plan**: Use a "plan feature" command to transform this conversation into a structured document. This plan includes:
    *   **Problem Statement**: What problem does this feature solve?
    *   **Goal and Success Criteria**: Clear objectives for the feature.
    *   **Context/Reference**: Links to relevant documentation (internal or external).
    *   **Task List**: Detailed list of tasks, down to individual file creation/updates.
    *   **Validation Strategy**: Crucially, define how the feature will be validated *before* writing any code. This includes unit testing, integration testing, and highly specific end-to-end testing user journeys (e.g., using browser automation tools).

**Step 3: Implement the Feature**

Once the plan is robust and you're confident in the validation strategy, delegate coding to the AI agent.

1.  **Context Reset**: The most critical step here is to *reset the context*. After the planning conversation, start a *fresh* conversation with your AI. The *only* input should be the structured plan you just created. This ensures the AI's focus remains solely on the plan, preventing context bloat and hallucinations.
2.  **Execute the Plan**: Use an "execute" command, pointing it to your structured plan. The AI will then perform the coding, run tests (unit, integration, and end-to-end), and database migrations, ideally with full browser automation.
3.  **Human Validation**: Even after the AI reports success, perform your own code review and manual testing. Verify the application functions as expected from a user's perspective.

**Step 4: Commit and Regression Testing**

After successful implementation and validation:

1.  **Standardized Commit Messages**: Use a "commit" command to generate a standardized Git commit message. This ensures your commit history acts as a consistent long-term memory for the AI during future "prime" operations.
2.  **Regression Testing Framework**: Establish a framework for regression testing. This involves converting the end-to-end tests from your PIV loop into a re-runnable command or integrating with external AI testing platforms. Regression tests ensure that as you add new features, existing functionalities remain unbroken. Platforms like QAtech offer AI testing agents that adapt and evolve test cases with your codebase.

### The Four Golden Rules

Throughout this entire process, keep these four golden rules in mind:

1.  **Context Management**: Your AI agent's context is your most precious resource. Keep it concise, focused, and purposeful. Reset context between planning and implementation phases.
2.  **Commandify Everything**: If you perform a task more than twice, turn it into a reusable command (or "skill" in some AI agent terminology). This streamlines workflows and promotes repeatability.
3.  **System Evolution Mindset**: Whenever you encounter a bug or misalignment, don't just fix the code. Think about how to evolve your AI layer (PRD, rules, commands) to prevent similar issues in the future.
4.  **Commit History as Long-Term Memory**: Standardize your commit messages to provide a rich, consistent history that your AI agent can leverage during "prime" operations.

### Conclusion

By following this simple, practical framework, you can harness the power of AI coding agents to build new projects reliably and efficiently. The emphasis on robust planning, granular iteration via PIV loops, and continuous AI layer evolution creates a powerful, self-improving development cycle. This approach allows you to focus on your creative ideas, letting the agents handle the heavy lifting of code generation and validation.

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