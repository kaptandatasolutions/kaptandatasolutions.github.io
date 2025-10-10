---
layout: post
title: GPT5 Unveiled A Comprehensive Review and Real-World Comparison with GPT4
subtitle: Exploring the speed, intelligence, and new capabilities of OpenAI's latest AI model
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/gpt5_vs_gpt4_performance_comparison.png
share-img: /assets/img/gpt5_vs_gpt4_performance_comparison.png
tags: [AI, GPT5, GPT4, OpenAI, Large Language Models, LLM, Tech Review, Coding, Image Generation, Content Creation, Performance Comparison]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/gpt5_vs_gpt4_performance_comparison.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

The highly anticipated GPT5 has arrived, and for many users, it's now the default chatbot. This post will delve into a direct, hands-on comparison with its predecessor, GPT4, to uncover its true capabilities and whether it lives up to the hype.

### Initial Impressions Speed and Conciseness

GPT5's speed is immediately noticeable. When pitted against GPT4 in simple queries, GPT5 consistently delivers answers significantly faster. While GPT4 is no slouch, GPT5 often completes tasks 30% quicker, sometimes even demonstrating a monumental lead, especially for straightforward questions. This enhanced speed could translate into a more fluid and efficient user experience for everyday tasks.

Beyond speed, GPT5 also tends to be more concise in its responses, offering direct answers without unnecessary verbosity.

### The Game-Changer Unified AI Model Selection

One of the most significant advancements in GPT5 is the elimination of the confusing multitude of models (like GPT4, GPT4 mini, GPT4 mini high, etc.). Previously, users had to choose between various distinct AI models, each excelling in different areas, making it a cumbersome process even for advanced users.

**How it Works:**
With GPT5, this decision-making process is automated. The new model intelligently selects the best underlying AI model for the task at hand. If a query requires minimal thought, it uses a lightweight model for speed. For complex tasks like coding or in-depth reasoning, it automatically switches to a more powerful reasoning model (such as the "O" series). This "thinking" process might take a few seconds, but it ensures optimal performance without user intervention.

This unification simplifies the user experience dramatically, making advanced AI capabilities accessible to everyone without needing to understand the nuances of different models.

### Step-by-Step Practical Testing

To truly assess GPT5's capabilities, we conducted a series of tests across different domains.

#### Test 1 Coding a Tetris Game

**Objective:** Generate a playable Tetris game directly within a web canvas.

**1. GPT4 Performance:**
   - **Request:** "Create a playable Tetris game on a canvas."
   - **Process:** GPT4 started coding immediately, interpreting "canvas" as a direct interface implementation. It took approximately 1 minute and 30 seconds to generate 245 lines of code.
   - **Result:** The game was functional but basic. Movement was a bit slow, but pieces could be rotated and accelerated. It was a decent output for a single-phrase prompt.

**2. GPT5 Performance:**
   - **Request:** Exactly the same prompt as for GPT4.
   - **Process:** GPT5 engaged its "reasoning" mode for about 9 seconds before starting to code. It meticulously worked on the CSS for a more refined design and generated a significantly larger codebase.
   - **Result:** While taking a similar amount of time, GPT5 produced a vastly superior game. It included advanced features like sound effects, pause/restart controls (P for pause, R for restart), a score tracker, and even displayed upcoming pieces. The overall design and playability were professional-grade. This demonstrated GPT5's ability to go much further in terms of quality and features for similar prompts.

#### Test 2 Advanced Coding Pokémon Chess

**Objective:** Create a playable chess game on a canvas, where pieces are represented by Pokémon sprites.

**1. GPT4 Performance:**
   - **Request:** "Create a chess game in Pokémon style, playable on canvas, using Pokémon sprites (pixelated look)."
   - **Process:** GPT4 initially struggled with sprite generation. After a re-prompt ("Develop the entire game"), it generated only 124 lines of code, significantly less than the Tetris game.
   - **Result:** The game was visually appealing with Pokémon sprites, but functionally flawed. Users could move pieces anywhere, including capturing their own pieces, indicating a lack of proper chess rules implementation. It was a disappointment compared to its Tetris output.

**2. GPT5 Performance:**
   - **Request:** Exactly the same prompt as for GPT4.
   - **Process:** GPT5 again engaged its reasoning model. It took roughly 1 minute, generating 426 lines of code.
   - **Result:** GPT5 delivered a fully functional and polished chess game. It featured a sleek design, new game options, the ability to flip the board, and, crucially, adhered to actual chess rules (e.g., alternating turns for white and black).
   - **Added Value:** GPT5 even included legal disclaimers, crediting the owners of the Pokémon sprites, showcasing a surprising level of contextual awareness and professionalism. This was a clear win for GPT5, demonstrating its advanced reasoning and coding capabilities.

**Conclusion on Coding:**
GPT5 elevates the coding experience. It acts less like an assistant and more like a highly skilled colleague, capable of turning simple requests into robust, well-designed, and feature-rich applications.

#### Test 3 AI Hallucinations Accuracy of Responses

**Objective:** Test GPT5's tendency for "hallucinations" – generating confidently incorrect information – a common issue with LLMs.

**1. Test Question:** "Give me 10 technological products created by food brands." This type of question often triggers creative but false responses from AIs.

**2. GPT4 & GPT5 Performance:**
   - **GPT4:** Generated fantastical products like "AI ketchup" or "Coca-Cola Y3000 AI-created soda" that clearly do not exist.
   - **GPT5:** Also struggled with hallucinations, offering plausible but still non-existent products like "Oreo VR immersive glasses" and "Nivea headphones." While some of GPT5's suggestions were slightly more grounded in reality (e.g., Pringles LED tube lamps, which might exist as novelty items), the core problem of generating false information persisted.

**Conclusion on Hallucinations:**
Despite advancements, GPT5 still exhibits issues with hallucinations. This suggests that while Generative AI models are evolving, perfectly accurate factual recall from unconventional prompts remains a challenge that hasn't been fully resolved across generations.

#### Test 4 Image Generation

**Objective:** Generate a YouTube thumbnail using a provided image, optimized for click-through rate.

**1. GPT4 Performance:**
   - **Request:** "Create a perfect and optimized YouTube thumbnail for my video testing the new GPT5 from OpenAI, using this image." (User provided an image of their face).
   - **Process:** GPT4 generated a square image and often failed to incorporate the user's face, instead using a generic face or repeating text elements. It struggled with the landscape orientation required for YouTube thumbnails.
   - **Result:** Subpar images that didn't meet the brief, lacking correct aspect ratio and failing to use the provided face.

**2. GPT5 Performance:**
   - **Request:** Exactly the same prompt as for GPT4.
   - **Process:** GPT5's image generation was not noticeably better. It produced similar issues, struggling with the aspect ratio and often failing to include the user's face from the uploaded image.
   - **Hypothesis:** It's suggested that GPT's internal image generation creates a prompt that is then sent to a separate image generator (GPT Image 1, not DALL-E). GPT5 doesn't seem to have improved this internal prompt optimization for image generation.

**Conclusion on Image Generation:**
No significant improvement in image generation was observed with GPT5. This area remains a weakness for both models, especially when trying to integrate specific visual elements like a user's face or adhering to specific aspect ratios.

#### Test 5 Content Creation Scriptwriting

**Objective:** Generate a YouTube video hook (introduction script) for a video reviewing GPT5.

**1. Test Setup:**
   - **Request (via voice input):** "You are a copywriting expert and YouTube video scriptwriter. Write the hook for my YouTube video introducing the new GPT5 model by OpenAI, comparing it to GPT4O to see if there's a major technological leap." The voice-to-text functionality of the AI models worked flawlessly.

**2. GPT4 Performance:**
   - **Hook:** "Forget everything you thought you knew about AI. GPT5 has just been released, and what you're about to see will literally change the game. Faster, smarter, and truly more powerful than GPT4, today we're going to test everything, compare everything, and most importantly, discover if this new version is a revolution or just a marketing ploy. Spoiler: You're not ready for what GPT5 can do."
   - **Impression:** A well-written, engaging, and dynamic hook, typical of high-quality copywriting.

**3. GPT5 Performance:**
   - **Hook:** "It has just been released, and it could bury GPT4. Today, we're going to test together the new GPT5, freshly unveiled by OpenAI. Are we talking about a revolution or just a publicity stunt? The answer right now with a real-world test."
   - **Impression:** More direct and concise, but perhaps less dramatic or "cinematic" than GPT4's output.

**Conclusion on Content Creation:**
While GPT5 delivered a good hook, GPT4's version was arguably more engaging and impactful for a YouTube introduction. This suggests that in certain creative writing tasks, GPT4 still holds its own, or at least has a different stylistic approach that some might prefer.

### Overall Verdict and Reflections

GPT5 brings significant improvements in **speed** and, most importantly, in **intelligent model selection**, making the user experience far more streamlined and powerful – especially in **coding and complex reasoning tasks**. It truly feels like having an expert colleague across various fields, capable of delivering comprehensive and high-quality outputs from simple prompts.

However, areas like **hallucinations (factual accuracy)** and **image generation** still present challenges, indicating that while impressive, AI is not yet perfect.

Despite some remaining limitations, the fact that GPT5 functionality is available for the same subscription price (€20) and even accessible to free users (albeit with potential usage caps for subscribers) is remarkable. The strategic approach of OpenAI, making such advanced technology widely available, is commendable.

As the AI landscape continues to evolve, it will be fascinating to see how the community uncovers even more innovative use cases for GPT5. This initial dive suggests that while not a complete "Terminator-level apocalypse" as some might dramatically predict, GPT5 represents a substantial leap forward in usability and capability for many practical applications.

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