# AI Workspace Structure

This directory contains a centralized environment for managing AI/ML-related resources on this system. It organizes models, data, and Python environments in a consistent and modular way to support a wide range of tools, from LLMs to image generation and audio processing.

---

## 📁 Directory Layout

### `~/AI/models/`
Stores all downloaded model files, grouped by domain.

Subdirectories:
- `llm/` – Large language models (e.g. Mistral, LLaMA, GPTQ)
- `diffusion/` – Image generation models (e.g. Stable Diffusion, SDXL)
- `whisper/` – Speech-to-text models (e.g. Whisper base, large)
- `embeddings/` – Sentence and document embedding models (e.g. MiniLM)

> 🔄 Tip: Use symlinks to point project-specific folders to these shared models.

---

### `~/AI/venvs/`
Holds Python virtual environments for different tools or projects.

Examples:
- `llama-cpp/`
- `textgen-webui/`
- `stable-diffusion/`
- `whisper/`

Activate manually or through `direnv`:
```bash
source ~/AI/venvs/llama-cpp/bin/activate
```

---

### `~/AI/data/`
Stores input/output data for processing and experiments.

Subdirectories:
- `input/` – Raw or user-supplied data
- `output/` – Results, generated text, images, audio, etc.

---

## 🗃️ Projects Location

Although models and environments are stored in `~/AI`, the actual **project source code** is stored in your home directory:

```
~/Projects/
├── llama-cpp/
├── text-generation-webui/
├── stable-diffusion-webui/
├── langchain-agent/
```

Each project typically:
- Has its own `.envrc` to auto-activate the right virtualenv
- References shared models via `AI_MODELS` environment variable

---

## 🧩 Environment Variables

To make projects portable and paths consistent, define the following in your `.envrc` or shell:

```bash
export AI_ROOT=~/AI
export AI_MODELS=$AI_ROOT/models
export AI_VENVS=$AI_ROOT/venvs
export AI_DATA=$AI_ROOT/data
export AI_PROJECTS=~/Projects
```

You can use these in shell scripts or Python code:
```python
import os
model_path = os.path.join(os.environ["AI_MODELS"], "llm/mistral/mistral-7b.Q4_K_M.gguf")
```

---

## 🛠 Setup Tips

- Use `python3 -m venv $AI_VENVS/<tool>` to create environments
- Use `direnv` to auto-load `.envrc` per project
- Use symlinks to make models visible in project folders, if needed
- Keep `.envrc` and `.env.example` files in projects for reproducibility

---

## ✅ Example Workflow

```bash
cd ~/Projects/llama-cpp
# Automatically activates the venv via .envrc
python3 -m llama_cpp.server --model $AI_MODELS/llm/mistral/mistral-7b.Q4_K_M.gguf
```

---

## 🔐 Git Best Practices

- Do NOT commit the `venvs/`, `models/`, or `data/` folders to Git
- You can safely version-control:
  - Code in `~/Projects/`
  - `.envrc`, `requirements.txt`, `README.md`, etc.

---

## 🧠 Goal

This structure provides a clean, repeatable, and scalable layout for managing AI projects, making it easy to work across multiple tools while sharing common resources.
