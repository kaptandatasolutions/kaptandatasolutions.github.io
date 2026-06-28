---
layout: post
title: Fugu Ultra - The Multi-Agent Orchestra That Matches Frontier Models – But Is It Worth the Wait?
subtitle: A hands-on test of Sikana's Fugu Ultra reveals speed and cost trade-offs vs. Claude Opus 4.8
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/fugu_multi_agent_fish_illustration.png
share-img: /assets/img/fugu_multi_agent_fish_illustration.png
tags: ["AI", "multi-agent", "orchestration", "Fugu", "LLM", "cost", "speed"]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/fugu_multi_agent_fish_illustration.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

The AI landscape is buzzing with claims of ever‑smarter models. One of the most viral announcements in recent weeks came from a Japanese company called Sikana (meaning “fish”), which introduced **Fugu Ultra**. Their claim: Fugu matches the performance of top‑tier models like Fable and Mythos while avoiding export‑control restrictions—all by using a **multi‑agent orchestration** architecture.

Naturally, the hype demanded a real‑world test. I ran Fugu Ultra against Claude Opus 4.8 on 38 different tasks, from puzzles to heavy algorithms, and the results reveal a nuanced story. Here’s what you need to know about this new approach—and whether it’s ready for your workflow.

## What Is Fugu? It’s Not Another LLM

Fugu is not a single large language model. Instead, it’s a **smart orchestration API** that acts as a conductor. When you send a request, a small model inside Fugu (the “conductor”) breaks down your task, then delegates each subtask to the most suitable frontier model.

- **Claude** may be called for writing and reasoning.
- **GPT** for coding and bug fixes.
- **Gemini** for research and factual accuracy.
- Other models are used based on the complexity of the job.

After each specialist returns its response, another LLM combines the results into a cohesive answer. This is essentially the same pattern you might already use manually—spinning up multiple agents in Claude Code, each with a different model—but Fugu automates the delegation.

The idea is not new. OpenRouter’s **Fusion API** sends your prompt to three models simultaneously and merges their outputs. Fugu goes a step further by breaking the task into parts and assigning each part to the best model for that piece. In theory, this “mixture of experts” approach should deliver superior results at the cost of speed and money.

## Putting Fugu Ultra to the Test

I designed 38 tests across four categories: puzzles, traps, specs, and heavy algorithms. Both Fugu Ultra and Claude Opus 4.8 received the same prompts, and Claude Code (using Opus 4.8) graded the outputs for pass/fail objectivity.

### Quality: Nearly a Tie

In 36 out of 38 tasks, Fugu and Opus produced identical results. Fugu won on two occasions, but remember: Opus 4.8 is one of the models Fugu can call upon. Essentially, Fugu’s output is heavily influenced by the same Opus 4.8 that you could use directly.

### Speed: Fugu Was 4.5× Slower

- **Claude Opus 4.8**: completed all tasks in ~80 minutes total.
- **Fugu Ultra**: took ~357 minutes total.

Even simple six‑second tasks for Opus became multi‑minute waits for Fugu. The orchestration overhead—waiting for each specialist model to respond, then combining results—adds significant latency.

### Cost: Fugu Was 5× More Expensive

- **Claude Opus 4.8** cost roughly $10 for the whole test.
- **Fugu Ultra** cost approximately $50.

Because Fugu runs multiple models and spends more time processing, the bill adds up quickly. The promise of better quality didn’t materialise in my tests, making the extra cost hard to justify for many use cases.

## Where Fugu Might Shine (And Where It Doesn’t)

For **knowledge work, research, and writing**, Fugu feels solid—it’s essentially a blend of Opus 4.8 and GPT‑5.5. But for my daily workflows inside Claude Code, I didn’t notice an improvement that offset the slowdown and price tag.

However, if you are a **team building large software products** that demand multiple perspectives—say, one model for planning, another for code review, and a third for documentation—the automatic delegation could be valuable. You’d get the benefit of GPT’s code analysis alongside Claude’s reasoning without manually juggling APIs.

## The Takeaway: Orchestration Is the Future, but Fugu Isn’t There Yet (For Me)

The core idea—don’t lock yourself into one provider; optimise cost and quality per task—is undeniably powerful. Tools like OpenRouter’s Fusion and Fugu point toward a future where a single API call intelligently routes work to the cheapest or best model.

But current orchestration APIs still carry a premium in both time and money. For most individual developers and small teams, using a single capable model (like Claude Opus 4.8) and manually switching tools when needed remains more efficient.

That said, keep an eye on Sikana AI Labs. As models become more specialised and expensive, mastering orchestration will become a critical skill. Fugu is an early glimpse of that future—impressive in theory, but in practice it’s a case of “you get what you pay for”… plus a few extra minutes of waiting.

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
        
        <p><a href="https://www.kaptan-data-solutions.app/contact/">Submit your project brief and receive a proposal</a></p>
    </div>
</body>
</html>