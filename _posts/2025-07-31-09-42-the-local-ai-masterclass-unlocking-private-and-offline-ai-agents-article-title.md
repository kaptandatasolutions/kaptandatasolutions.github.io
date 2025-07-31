---
layout: post
title: The Local AI Masterclass Unlocking Private and Offline AI Agents
subtitle: A Comprehensive Guide to Self-Hosting LLMs and Infrastructure for Secure and Efficient AI Applications
cover-img: /assets/img/local_ai_master_class_docker_setup_cover.png
thumbnail-img: /assets/img/local_ai_master_class_docker_setup.png
share-img: /assets/img/local_ai_master_class_docker_setup.png
tags: [Local AI, Large Language Models, LLMs, Self-hosting, AI Agents, Docker, N8N, Python, Olama, Superbase, Open Web UI, CRXNG, Cloud Deployment, Digital Ocean, AI Automation, Privacy, Security, Open Source, Masterclass]  
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/local_ai_master_class_docker_setup.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

Welcome to the definitive guide on local AI – a masterclass designed to equip you with the knowledge and tools to run your own large language models (LLMs) and self-host your entire AI infrastructure. This comprehensive overview covers everything from understanding local AI to deploying secure, private, and offline AI agents, offering a truly hands-on experience.

### What is Local AI and Why Does it Matter?

Local AI refers to the practice of running your own large language models and supporting infrastructure (like databases and user interfaces) entirely on your local machine, completely offline. Unlike traditional cloud-based AI services where you rely on third-party APIs and servers, local AI puts you in complete control.

This is made possible through open-source LLMs and software. Instead of paying for APIs, you host everything on your own hardware. This offers several key advantages:

*   **Privacy and Security**: Your data never leaves your hardware, remaining 100% within your control. This is crucial for businesses in highly regulated industries (healthcare, finance) or those dealing with sensitive intellectual property.
*   **Cost-Effectiveness**: Eliminate recurring API costs. You only pay for your hardware and electricity.
*   **Model Fine-tuning**: Open-source models allow for additional training with your own data, creating domain-expert LLMs tailored to your specific needs. While fine-tuning is possible with some cloud models, it's often more limited and expensive.
*   **Speed**: With everything running on your local infrastructure, network delays are eliminated, leading to faster inference times.

However, local AI also has its considerations:

*   **Initial Setup Complexity**: It requires more effort to set up and configure compared to simply calling cloud APIs.
*   **Maintenance**: You are responsible for managing and updating your hardware and software.
*   **Model Power**: While the gap is narrowing, cloud AI still often offers more powerful, state-of-the-art models.
*   **Out-of-the-Box Features**: Cloud AI sometimes provides built-in features like memory or web search, which you might need to implement yourself with local AI.

The trend suggests that the advantages of local AI, particularly privacy and cost, will become increasingly prevalent, while the challenges like setup complexity and model power will diminish over time as the technology matures and open-source models improve.

### Hardware Requirements for Local LLMs

Running large language models locally is resource-intensive due to their massive number of "parameters" (billions or even trillions of numbers). These parameters are stored in your graphics card's VRAM (Video Random Access Memory). The more parameters an LLM has, the more VRAM it requires.

Here’s a general guide to VRAM requirements and token generation speeds based on LLM size (assuming Q4 quantization, which makes models smaller without significant performance loss):

*   **7-8 Billion Parameters**:
    *   VRAM: 4-5 GB
    *   Recommended GPUs: Nvidia 3060 Ti (8 GB VRAM)
    *   Speed: 25-35 tokens/second (a token is roughly a word)
    *   Use Case: Simple chat, basic questions. Limited for complex "tool calling" (agents interacting with external tools).
*   **14 Billion Parameters**:
    *   VRAM: 8-10 GB
    *   Recommended GPUs: Nvidia 4070 Ti (16 GB VRAM), Nvidia 3080 Ti (12 GB VRAM)
    *   Speed: 15-25 tokens/second
    *   Use Case: Basic tool calling, enabling more complex agentic tasks.
*   **30-34 Billion Parameters**:
    *   VRAM: 16-20 GB
    *   Recommended GPUs: Nvidia 3090 (24 GB VRAM), Mac M4 Pro with 24 GB unified memory
    *   Speed: 10-20 tokens/second
    *   Use Case: Impressive performance, approaching that of some cloud AI models, suitable for more complex agent tasks.
*   **70 Billion Parameters**:
    *   VRAM: 35-40 GB
    *   Recommended GPUs: Requires multiple GPUs (e.g., two 3090s or two 4090s) or enterprise-grade GPUs (e.g., Nvidia H100).
    *   Speed: 8-12 tokens/second (slower due to splitting models across GPUs)
    *   Use Case: Most complex agents, aiming to match cloud AI performance.

For optimal performance, aim to fit the entire LLM within your GPU's VRAM. **Offloading** occurs when parts of the LLM are moved to your CPU and RAM if VRAM is insufficient, significantly slowing down performance.

### Essential Local AI Concepts

*   **Quantization**: This process reduces the precision of an LLM's parameters (numbers), making the model much smaller and enabling it to fit on GPUs with less VRAM, without severely impacting performance. For example, reducing a 16-bit parameter to 4-bit (Q4 quantization) makes the model a quarter of its original size. Q4 is generally considered the best balance between size and quality.
*   **Olama**: A user-friendly, open-source platform for downloading and running local large language models. You can easily pull and run models directly from your terminal.
*   **OpenAI API Compatibility**: Many local LLM solutions, including Olama, are designed to be compatible with the OpenAI API standard. This means you can often switch from using an OpenAI model to a local one by simply changing a base URL and removing the need for an API key, without altering your existing code or workflows. This makes integrating local AI into ongoing projects seamless.

### Step-by-Step Guide to Setting Up the Local AI Package

To streamline the setup of your local AI infrastructure, a curated "Local AI Package" has been developed. This package combines various open-source services essential for building fully offline and private AI agents.

**Key Components of the Local AI Package:**

*   **Olama**: For running your LLMs.
*   **N8N**: A low-code/no-code workflow automation platform.
*   **Superbase**: An open-source database solution (using PostgreSQL).
*   **Open Web UI**: A ChatGPT-like interface for interacting with your LLMs and agents.
*   **CRXNG**: For local and private web search.
*   **Caddy**: A reverse proxy for managing secure access and subdomains (especially for cloud deployments).
*   **Langfuse**: For agent observability and monitoring.

**Prerequisites:**

1.  **Python**: Required to run the start script.
2.  **Git or GitHub Desktop**: To clone the repository.
3.  **Docker or Docker Desktop**: All services run as individual Docker containers managed by Docker Compose.

**Installation Steps:**

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/your-repo/local-ai-package.git
    cd local-ai-package
    ```
2.  **Configure Environment Variables**:
    *   Copy `.env.example` to `.env`: `cp .env.example .env`
    *   Open `.env` in a text editor (e.g., `nano .env` or `code .env`).
    *   **N8N Credentials**: Generate `N8N_ENCRYPTION_KEY` and `N8N_JWT_SECRET` using `openssl rand -hex 16` (Linux/Mac) or a Python script provided in the documentation.
    *   **Superbase Secrets**: Set `POSTGRES_PASSWORD`, `SUPERBASE_DB_JWT_SECRET`, `SUPERBASE_ANON_KEY`, `SUPERBASE_SERVICE_ROLE_KEY`, `SUPERBASE_DASHBOARD_USERNAME`, `SUPERBASE_DASHBOARD_PASSWORD`, and `POOLER_TENANT_ID`. Refer to the Superbase documentation for generating JWT keys.
    *   **Neo4j/Langfuse**: Set passwords and encryption keys as needed. For initial local setup, you can often keep default values for non-critical components.
    *   **Crucial Olama Environment Variables**:
        *   `OLLAMA_FLASH_ATTENTION=1`: Improves attention calculation efficiency.
        *   `OLLAMA_KV_ATTENTION_QUANT=8`: Quantizes context memory for better VRAM utilization.
        *   `OLLAMA_MAX_TOKENS=8000`: Increases the context window beyond the default 2000 tokens. Adjust based on your LLM's capacity.
        *   `OLLAMA_MAX_MODELS=1`: Limits the number of LLMs loaded into memory simultaneously.
3.  **Start the Local AI Package**:
    *   The command varies based on your GPU:
        *   **Nvidia GPU (Windows/Linux)**:
            ```bash
            python start_services.py --profile gpu-nvidia
            ```
        *   **AMD GPU (Linux)**:
            ```bash
            python start_services.py --profile gpu-amd
            ```
        *   **No GPU (CPU only or Mac/AMD on Windows needing external Olama)**:
            ```bash
            python start_services.py --profile none
            ```
    *   **Important**: If you are on Mac or AMD on Windows, and cannot run Olama within Docker, install Olama directly on your host machine. The `none` profile will prevent the Olama container from starting, allowing your services in the package to connect to your host-managed Olama instance.
    *   The first run will download Docker images, which can take time.
4.  **Verify Setup (Docker Desktop)**: Ensure all services show a green dot in Docker Desktop, with the exception of `olama-pull` and `n8n-import` which run once and then exit.
5.  **Access Services in your Browser**:
    *   **N8N**: `http://localhost:5678`
    *   **Open Web UI**: `http://localhost:8080`
    *   **Superbase Dashboard**: `http://localhost:8000`
    *   Other services will have varying ports (check Docker Compose or Docker Desktop for details).

**Connecting Services from Within Docker Containers**:

When configuring connections between services *within* the Docker environment (e.g., Open Web UI connecting to Olama, or N8N connecting to Superbase), use the *service name* defined in the Docker Compose file as the hostname, not `localhost`. This is because `localhost` refers to the container itself, not other containers in the network. For example, to connect Open Web UI to the Olama container, the Olama API URL should be `http://olama:11434`.

### Building Local AI Agents with N8N and Python

The Local AI Package provides the foundation for building AI agents. Here's how you can leverage it:

**1. Using Open Web UI as a Chat Interface**:
*   In Open Web UI, go to **Admin Panel > Settings > Connections**.
*   Configure the **Ollama API** to `http://olama:11434` (if Olama is running in a Docker container) or `http://host.docker.internal:11434` (if Olama is on your host machine).
*   Now you can chat directly with your local LLMs through Open Web UI.

**2. Building Agents with N8N:**
*   N8N can connect to your local AI services using their Docker service names.
*   **Olama Connection**: Create new credentials in N8N. Set the base URL to `http://olama:11434`.
*   **Superbase Memory (PostgreSQL)**: Use `db` as the hostname for the PostgreSQL connection (as `db` is the service name for the underlying Superbase database in the Docker Compose). Username and database are typically `postgres`.
*   **CRXNG (Web Search) Tool**: Create an HTTP Request node in N8N to call the CRXNG API. The base URL would be `http://crxng:8080` (or `http://crxng:8081` depending on specific setup).
*   **Integrating with Open Web UI**: Use a custom `N8N pipe` function for Open Web UI. This function acts as a connector, allowing Open Web UI to send chat inputs to your N8N webhook and display the N8N agent's responses. You'll specify your N8N workflow's webhook URL and authentication token within the Open Web UI function settings.

**3. Building Agents with Python:**
*   You can create a Python Flask or FastAPI application to act as your AI agent.
*   **OpenAI API Compatibility**: Leveraging this, you initialize your OpenAI client, but set the `base_url` to your local Olama instance (`http://olama:11434/v1`).
*   **Superbase Client**: Configure your Superbase client to connect to your local Superbase instance (e.g., `http://kong:8000` for the API gateway, `http://db:5432` for direct PostgreSQL connection).
*   **CRXNG Integration**: Make HTTP requests to the CRXNG service (`http://crxng:8080`) to perform web searches.
*   **Containerization**: For seamless integration within the Docker network, containerize your Python agent. Add a new service entry in your Docker Compose file (or a separate `docker-compose.override.yml`) for your Python agent. This allows it to communicate with other services (Olama, Superbase, CRXNG) using their service names directly, avoiding `localhost` or `host.docker.internal`.

### Deploying to the Cloud

Once your local AI package and agents are running smoothly on your machine, you can deploy them to a private server in the cloud for 24/7 availability and wider access. This is still considered "local AI" as you maintain full control over your infrastructure.

**Cloud Provider Options:**

*   **Digital Ocean**: A highly recommended platform, offering both affordable CPU instances (droplets) and powerful GPU droplets. Great for hosting the entire local AI package, including LLMs on GPUs, or a hybrid approach where only the infrastructure is hosted (using a cheaper CPU droplet) and LLMs are accessed via external APIs.
*   **TensorDo**: Another good option for cost-effective GPU instances.
*   **Hostinger**: Excellent for very affordable CPU-only instances, ideal if you want to self-host everything except the LLMs for minimal cost (e.g., $7/month for an 8GB RAM instance).
*   **Avoid Platforms that only provide Container Access**: Platforms like RunPod or Lambda Labs, if they only give you SSH access to a pre-defined container, cannot run the Local AI Package, as it involves running multiple Docker containers. You need access to the underlying virtual machine.

**Deployment Process (General Steps for Ubuntu VM):**

1.  **Create a Cloud Instance**:
    *   Choose an Ubuntu distribution (e.g., AI/ML ready image on Digital Ocean for pre-installed GPU drivers).
    *   Select appropriate hardware (8GB RAM minimum for the package, more for GPUs).
    *   Add your SSH Key for secure access.
2.  **Connect to Your Instance**: Use SSH or the web console provided by your cloud provider.
3.  **Configure Firewall**:
    *   Enable firewall: `sudo ufw enable`
    *   Allow HTTP (port 80) and HTTPS (port 443): `sudo ufw allow 80/tcp`, `sudo ufw allow 443/tcp`
    *   Reload firewall: `sudo ufw reload`
    *   These ports are essential for Caddy (the reverse proxy) to expose your services to the internet.
4.  **Clone the Local AI Package Repository**:
    ```bash
    git clone https://github.com/your-repo/local-ai-package.git
    cd local-ai-package
    ```
5.  **Configure Environment Variables for Cloud**:
    *   Copy `.env.example` to `.env`.
    *   Set all your secrets and passwords (ideally new, strong ones).
    *   **Caddy Configuration**: Uncomment and set hostnames for services you want public access to (e.g., N8N, Open Web UI, Superbase Dashboard). For example:
        ```
        N8N_HOSTNAME=n8n.yourdomain.com
        OPEN_WEB_UI_HOSTNAME=webui.yourdomain.com
        SUPERBASE_HOSTNAME=supabase.yourdomain.com
        LETSENCRYPT_EMAIL=your@email.com
        ```
    *   **Do NOT** uncomment Olama or CRXNG hostnames; they should remain internal to the server.
6.  **Set Up DNS Records**:
    *   Go to your domain's DNS provider (e.g., Namecheap, Cloudflare).
    *   Create **A records** for each subdomain you defined in the `.env` file, pointing them to your cloud instance's **public IPv4 address**.
        *   `n8n.yourdomain.com` -> `[your_VM_IPv4]`
        *   `webui.yourdomain.com` -> `[your_VM_IPv4]`
        *   `supabase.yourdomain.com` -> `[your_VM_IPv4]`
7.  **Install Docker Compose (if not pre-installed)**: Some cloud images might not have `docker-compose` as a recognized command. Follow instructions to install it if needed.
8.  **Start the Local AI Package in Public Mode**:
    ```bash
    python start_services.py --profile gpu-nvidia --env public
    ```
    (Adjust profile as necessary for your CPU/GPU setup). The `--env public` flag enhances security by closing off more ports and routing all external access through Caddy.
9.  **Deploy Your AI Agent (Python/N8N)**:
    *   Clone your agent repository onto the cloud instance alongside the Local AI Package.
    *   Configure your agent&#39;s environment variables to reference the Docker service names within the cloud Docker network (e.g., `OLLAMA_BASE_URL=http://olama:11434/v1`, `SUPABASE_URL=http://kong:8000`).
    *   Containerize your Python agent and add it to the Docker Compose stack (either by updating the Local AI Package's `docker-compose.yml` or using a `docker-compose.override.yml`).
    *   For N8N agents, import the workflow JSON into your N8N instance hosted in the cloud. Update credentials to use the local service names (e.g., `olama`, `db`, `crxng`).

By following these steps, you will have a fully functional, secure, and private AI infrastructure operating in the cloud, accessible via your custom domains. The performance will be exceptional due to the absence of network delays and the power of dedicated cloud hardware.

This masterclass has provided the fundamental knowledge and practical steps to embark on your local AI journey. The possibilities for building powerful, private, and efficient AI agents are now at your fingertips.

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