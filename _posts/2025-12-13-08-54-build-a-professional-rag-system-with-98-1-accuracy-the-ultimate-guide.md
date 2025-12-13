---
layout: post
title: Build a Professional RAG System with 98.1% Accuracy The Ultimate Guide
subtitle: Transform your knowledge base into an intelligent AI assistant using n8n with advanced RAG techniques contextual embeddings and reranking
cover-img: /assets/img/crag_chatbot_local_spc_agent_cover1.png
thumbnail-img: /assets/img/rag_advanced_ai_agent_workflow.png
share-img: /assets/img/rag_advanced_ai_agent_workflow.png
tags: [AI, Automation, RAG, n8n, LLM, Supabase, Vector Database, Data Science, Prompt Engineering]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---

[![](/assets/img/rag_advanced_ai_agent_workflow.png)](https://www.youtube.com/channel/UCWkX7E-ImVbf0O3ocAW51wg)

This detailed guide outlines how to build a highly accurate Retrieval-Augmented Generation (RAG) system using n8n, designed to transform your knowledge base into an intelligent AI assistant. This guide covers everything from setting up your vector database to implementing advanced RAG techniques like contextual embeddings and reranking, aiming for an impressive 98.1% response accuracy.

## Understanding RAG: The Long-Term Memory for Your AI Agent

A RAG system acts as the long-term, deep memory for your AI agent. Unlike short-term memory (which handles immediate conversational context), RAG allows an AI to access and synthesize information from a vast knowledge base.

**The RAG Process:**

1.  **User Query:** A user sends a message to the AI agent.
2.  **Embedding:** An *embedding model* (not a typical LLM) converts the user's text query into a numerical vector (a list of numbers).
3.  **Retrieval:** This vector is sent to a *vector database*, which finds the most relevant text "chunks" from its stored knowledge base by comparing numerical similarity.
4.  **Augmentation:** The retrieved chunks are combined with the original user query and the AI agent's prompt.
5.  **Generation:** A traditional Large Language Model (LLM) processes this augmented information to generate a precise response, which is then returned to the user.

**RAG has two main components:**

1.  **Feeding the RAG (Ingestion):**
    *   Documents are broken down into small "chunks."
    *   These chunks are transformed into numerical vectors using an embedding model.
    *   The vectors are stored in a vector database. The database groups semantically similar chunks together in the vector space, meaning chunks with similar meanings are represented by vectors that are numerically "close" to each other.

2.  **Utilizing the RAG (Retrieval and Generation):** This is the process described above, involving retrieval, augmentation, and generation.

## Step-by-Step Implementation in n8n

This guide leverages n8n for workflow automation, Supabase for the vector database, and OpenAI for embedding and language models.

### Step 1: Setting up Your Vector Database (Supabase)

Supabase offers a PostgreSQL database with a `pgvector` extension, effectively turning it into a vector database.

**How to set it up:**

1.  **Create a Supabase Project:**
    *   Go to Supabase and sign up for a free account.
    *   Create a new project. Give it a name (e.g., "RAG_n8n"), generate a strong password, and select a region (e.g., Europe).
    *   Wait for the project to be provisioned.

2.  **Prepare the Database Schema:**
    *   In your Supabase dashboard, navigate to the `SQL Editor`.
    *   Execute the following SQL script (provided in n8n documentation) to create the `documents` table, which will store your RAG data:

    ```sql
    create extension if not exists vector;
    create table documents (
        id uuid primary key default uuid_generate_v4(),
        content text,
        metadata jsonb,
        embedding vector(1536)
    );
    -- This table is for document metadata (for advanced usage)
    create table file_metadata (
        id text primary key,
        title text,
        url text
    );
    ```

3.  **Configure n8n Connection to Supabase:**
    *   In n8n, add a new credential for Supabase.
    *   You'll need `Host`, `Service Role Secret`, and `Allowed HTTP Request Domains`.
    *   **Host:** Find this in your Supabase project settings under `Data API` (it's the `URL`).
    *   **Service Role Secret:** Find this in `API Settings` under `Project Settings` (called `Service Role (secret)`).
    *   **Allowed HTTP Request Domains:** Leave this as `All`.
    *   Name your credential (e.g., `RAGN8N`).

4.  **Configure n8n Connection to PostgreSQL (for Memory):**
    *   Add a new credential for PostgreSQL.
    *   From Supabase, go to `Connect` -> `Transaction Pooler`.
    *   Copy the `Host`, `Database name`, `User`, and `Password` (the one you generated when creating the project).
    *   The `Port` should be `6543`.
    *   Supabase will automatically create the chat history table for n8n when first accessed.

5.  **Configure n8n Connection to OpenAI:**
    *   Go to your OpenAI API dashboard, create a new secret key, and copy it.
    *   In n8n, create a new credential for OpenAI and paste your API key.
    *   Important: Ensure your OpenAI account has sufficient credit, as API calls incur costs.

### Step 2: Ingesting Documents into RAG (Feeding the RAG)

This process involves fetching documents, processing them, and storing them in your Supabase vector database.

**Workflow Overview:**

1.  **Triggers (Google Drive):**
    *   Use two Google Drive triggers: one for `File created` and another for `File updated` in a specific folder (e.g., "RAG").
    *   Configure your Google Drive connection. (There are n8n shorts and tutorials available for this.)

2.  **Loop & Conditional Processing:**
    *   Use a `Loop` node to process files one by one.
    *   An `IF` node checks the `MIME type` to ensure only Google Docs (or your desired document types) are processed. For multiple types, use a `Switch` node.

3.  **Extract File ID:**
    *   A `Set` node extracts the unique Google Doc ID from the file's URL. This ID is crucial for managing updates.

4.  **Handle Document Updates (Deletion of Old Chunks):**
    *   When a document is updated, the system first deletes older versions of its chunks from the vector database.
    *   A Supabase node with the `Delete` operation is used, filtering by the `file_id` stored in the `metadata` column.
    *   Set `Always Output Data` to `true` to ensure the workflow proceeds even if no data is deleted.
    *   Limit the output to 1 item to prevent processing old chunks multiple times.

5.  **Download and Transform Document:**
    *   An `HTTP Request` node downloads the Google Doc as HTML.
    *   A `Text Transform` node converts the HTML to Markdown, a format easily understood by LLMs.

6.  **Chunking and Embedding:**
    *   A `Supabase Vector Store` node is used to add documents.
    *   **Embedding Model:** Select an OpenAI embedding model like `text-embedding-3-small`. Crucially, use the *same* embedding model consistently throughout your system.
    *   **Metadata:** Use a `Default Data Loader` to include `ID_fichier` (file ID), `Titre_fichier` (file title), and `URL_fichier` as metadata. This allows the AI to reference the source document.
    *   **Text Splitter:** Use a `Recursive Character Text Splitter` to break the Markdown into chunks. Initially, a 1000-character chunk size is used. This can be improved in later steps.

### Step 3: Initial RAG Agent and Testing

With the initial RAG setup, your agent will be able to answer questions based on the ingested documents.

**Prompt for the Agent:**

"You are a personal assistant who helps answer questions using a document database. You must systematically consult the RAG knowledge base for any question, even if you think you know the answer. Never rely on your internal memory to provide information. Exclusively use documents from the database to answer user questions."

**Testing:**

1.  Load some Google Docs (e.g., HR procedures, financial procedures) into your RAG folder.
2.  Start a chat with your n8n agent.
3.  Ask a question: "What is the name of my company?" (assuming this info is in your documents).
4.  The agent should correctly retrieve the information from the RAG and respond.

### Step 4: Advanced RAG Part 1 - Contextual Embeddings

The basic chunking (every 1000 characters) can lead to incoherent chunks. Contextual embeddings significantly improve accuracy.

**Method:**

1.  **Intelligent Chunking:** Instead of fixed character chunks, use a Python script (or similar logic) within n8n to chunk documents by sections (e.g., titles) to maintain semantic coherence. This often results in chunks between 400 and 1000 characters (or similar ranges).
2.  **Generate Context:** For each chunk, send both the chunk and the full document to an LLM. Ask the LLM to generate a concise contextual summary of that chunk in relation to the entire document.
    *   **Prompt Example:** "Here is the fragment we wish to place in the context of the complete document: [FRAGMENT]. Here is the complete document: [DOCUMENT]. Please provide a short, concise context to situate this fragment within the global document to improve its retrieval during searches. Answer only with the concise context, nothing else."
3.  **Augment & Store:** Concatenate the original chunk content with its generated context. Store this augmented content in the vector database.
4.  **Adjust Chunk Size:** Since context is added, increase the `chunk_size` in your `Recursive Character Text Splitter` (e.g., from 1000 to 1400 characters) to accommodate the additional context.

**Benefit:** This method reduces the error rate from approximately 5.7% to 3.7%.

### Step 5: Advanced RAG Part 2 - RAG with Tools (RAGentic)

Traditional RAG agents have a limited view; they only see the chunks retrieved from the vector database. RAGentic agents empower the LLM with additional tools to broaden its understanding.

**Method:**

1.  **New Supabase Table for File Metadata:**
    *   Create a new table in Supabase (`file_metadata`) to store document names and URLs:

    ```sql
    create table file_metadata (
        id text primary key,
        title text,
        url text
    );
    ```

2.  **Tools for the LLM:**
    *   **Tool 1: List Documents:** An n8n node that queries the `file_metadata` table to provide the LLM with a list of all available documents. This uses a standard PostgreSQL query.
    *   **Tool 2: Read Document:** An n8n node that reads the full content of a specific document (by combining all its chunks) from the RAG based on the document ID. This allows the LLM to access the complete document if needed.
    *   **Tool 3: Source Citation:** When feeding the RAG, also store the `title` and `URL` of the document as metadata for each chunk. This allows the LLM to cite sources in its responses by providing the document name and a direct link.

3.  **Update Document Ingestion for Metadata:**
    *   After deleting old chunks and before chunking, use a Supabase node to `Insert or Update` the `file_metadata` table with the `ID_fichier`, `Titre_fichier`, and `URL_fichier` for the current document.

**Benefit:** This allows the AI agent to:
    *   Identify the exact source document for its answers.
    *   Provide links to original documents.
    *   Access full documents for complex questions that might require broader context than individual chunks.

### Step 6: Advanced RAG Part 3 - Reranking

Reranking drastically improves accuracy by reordering retrieved chunks based on their relevance to the user's query.

**Method:**

1.  **Increase Retrieval Limit:** In your `Supabase Vector Store` node (within the RAG agent's retrieval part), increase the number of retrieved chunks (e.g., to 20 instead of the initial 4).
2.  **Add a Reranker Node:**
    *   In n8n, activate the `Rerank Results` option in your `Vector Store` node.
    *   Configure a reranker model. Co-here's `Rerank v3.5` is a popular choice for this.
    *   **Co-here Connection:** Sign up for an account on Co.here, generate an API key (a trial key is available for testing), and create an n8n credential for it.
    *   Set the `Top K` value (e.g., 4) in the reranker to specify how many of the top-ranked chunks should be passed to the LLM.

**Benefit:** By retrieving a larger set of potentially relevant chunks and then intelligently reranking them, the LLM receives the most pertinent information. This reduces the error rate from 3.7% to an impressive 1.9%.

## Conclusion

By meticulously following these steps, you can build a robust and highly accurate RAG system in n8n. Starting with a basic setup and progressively adding contextual embeddings, tools for broader document access, and reranking, you empower your AI agent with a sophisticated understanding of your knowledge base, leading to expert-level responses and significantly reduced error rates. While this guide focuses on Google Docs, the principles can be extended to other document types like PDFs, CSVs, or Confluence pages. For even more advanced RAG (like graph-based RAG), further technical expertise and dedicated server setups are required, often moving beyond low-code solutions.

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