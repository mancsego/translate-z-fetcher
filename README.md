# Translate-Z Tiny Fetcher 🌍📦

A lightweight, Alpine-based Docker utility designed to seamlessly pull and sync localization files from the Translate-Z API directly into your local workspaces, applications, or CI/CD automated pipelines.

## Features
- **Ultra-lightweight:** Built on Alpine Linux (`< 15MB` image size).
- **Zero-Config Host Sync:** Automatically dumps the pulled translation file into your current working directory.
- **CI/CD Ready:** Perfect for GitHub Actions, GitLab CI, or Bitbucket Pipelines to automate asset updates.

---

## Usage

You can instantly run the fetcher without compiling anything yourself using Docker. Pass your configuration details as runtime arguments.

```bash
docker run --rm \
  -v "$(pwd)":/app \
  ghcr.io/mancsego/translate-z-tiny-fetcher:latest \
  "YOUR_API_KEY" \
  "YOUR_PROJECT_ID" \
  "YOUR_LANGUAGE_ID" \
  "YOUR_FORMAT"
