---
layout: post
title: Comparing Understand Anything and Graphify for Codebase Exploration
subtitle: Which Saves More Tokens and Offers Better Visualizations for AI Assisted Research
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/comparing_understand_anything_and_graphify_for_codebase_exploration.png
share-img: /assets/img/comparing_understand_anything_and_graphify_for_codebase_exploration.png
tags: [AI, Codebase, Knowledge Graph, Graphify, Understand Anything, Token Savings, Software Engineering]  
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/comparing_understand_anything_and_graphify_for_codebase_exploration.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

If you use AI to research your codebase, you definitely need to check out two powerful tools: **Understand Anything** and **Graphify**. Both turn your entire codebase into an interactive knowledge base that you can explore with natural language questions – and both help you save AI tokens during research. In this article, we’ll walk through how to set up each tool, compare their token consumption, visualizations, AI query responses, onboarding workflows, stale data handling, and support for local models. By the end, you’ll know which tool fits your project best.

## Setting Up Both Tools

### Installing Graphify
Graphify relies on Python and the `uv` package manager (similar to `npm` for Python). First, install Graphify using `uv`:

```bash
uv install graphify
uv install graphify-skills
```

Then add it to your project’s terminal – typically by cloning the repository and adding the plugin through the marketplace.

### Installing Understand Anything
Understand Anything is installed via the plugin marketplace. Copy the plugin installation command, clone the repository, add it to the marketplace, then install it at the project level:

```bash
# Add plugin to marketplace
# Then run installation command
# Choose option 'project level' when prompted
```

Once both are installed, you can run initial analysis commands.

## Token Consumption: Initial Codebase Analysis

We tested both tools on the same codebase (approx. 2000 candidate files, filtered to 1500 using ignore rules). The results:

- **Understand Anything** consumed **200,000 tokens** to generate a full knowledge graph.
- **Graphify** consumed about **half that** (100,000 tokens) for the same codebase.

If token budget is your primary concern, Graphify is the clear winner.

## Visualizations: Graph Dashboard Comparison

### Understand Anything Dashboard
After running `/understand dashboard`, you get an interactive web UI. It shows:
- Project overview with layers and connection counts.
- Click any layer (e.g., Feature Components) to see all components.
- Each component reveals its full parent-child tree.
- Hovering over nodes shows summaries and usage locations.

This makes it easy to trace dead files, understand dependencies, and refactor confidently.

### Graphify Dashboard
Graphify produces an HTML graph file (open with `open graph.graph.html`). It shows all files as nodes connected by edges, but:
- Nodes are labeled only as “neighbors” – no parent/child distinction.
- Clicking a node shows its connections, but not the hierarchy.
- Less intuitive for humans to navigate.

**Winner for visual understanding: Understand Anything.**

## AI Queries: Using Both Tools for Research

We asked both tools the same question: “Explain the receipt-transaction matching algorithm.”

### Graphify Response
- Outputs a table and a list of files with raw text.
- Provides a brief textual explanation but no step-by-step flow.
- Token usage: ~20,000 per query.

### Understand Anything Response
- Shows the file origin (e.g., the `anim` workflow converted to an app).
- Displays a step-by-step table (Step 1, Step 2, Step 3) with files involved.
- Includes a flowchart-like visualization (textual) of how uploading receipts works.
- Token usage: similar to Graphify (~20,000).

**Winner for clarity and completeness: Understand Anything.**

## Onboarding: Converting Codebase into Documentation

### Graphify Onboarding
Generates a wiki folder containing 77 articles (one per file or module). Each article is added to your local directory. Great if you prefer having a full wiki you can browse offline.

### Understand Anything Onboarding
Summarizes the entire codebase into a single Markdown file. The summary includes:
- Project overview
- Architecture layers
- Key components and their roles

**Both are competitive: choose wiki style (Graphify) or summarised overview (Understand Anything).**

## Stale Data: Automatic Updates When Code Changes

Both tools support automatic graph updates via Git hooks:

- **Graphify**: On every commit or branch switch, run `/graphify update` to refresh the graph.
- **Understand Anything**: Run `/understand all updates` – it detects changes and updates the knowledge base accordingly.

Both are equally effective; no clear winner.

## Privacy and Local Model Support

- **Graphify** supports running entirely locally with models like Llama or AWS Bedrock. Set the backend model via environment variables, then start your local model with `ollama serve` and point Graphify to it.
- **Understand Anything** does **not** support a local model by default. It uses whatever provider your IDE is configured to (e.g., OpenAI, Anthropic). For teams requiring full privacy offline, Graphify wins.

## Final Recommendation

Use both tools in tandem for the best results:

- **Understand Anything** for superior visual dashboards and clearer AI explanations.
- **Graphify** when you need lower token costs and local model support.

For onboarding, pick Graphify if you want a full wiki, or Understand Anything if you prefer a concise summary. Both handle stale data updates equally well.

To get the full cheat sheet and detailed setup guide for both tools, check out the comprehensive resources in our community.


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