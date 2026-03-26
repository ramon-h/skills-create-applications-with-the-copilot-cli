# Create applications with the Copilot CLI

<img src="https://octodex.github.com/images/Professortocat_v2.png" align="right" height="200px" />

Welcome! This is a hands-on exercise for learning GitHub Copilot CLI, adapted for use with **GitLab** at Vista.

In this exercise you'll use the standalone Copilot CLI and Vista's `vconfig` tool to manage GitLab issues and build a Node.js calculator app — all from the terminal. 🚀

---

## Prerequisites

Before starting, you need just two things:

1. **A GitHub Copilot subscription** (Pro, Pro+, Business, or Enterprise) — required for Copilot CLI
2. **VS Code 1.108+** — required for `vconfig`

> [!NOTE]
> You will also need a **GitLab Personal Access Token** (minimum `read_api` scope) to install `vconfig` in Step 2. The exercise's CI/CD token (`GITLAB_TOKEN`) is created automatically in Step 2 using Copilot CLI + the GitLab MCP — no browser setup required.

### Configure Copilot CLI instructions

So Copilot CLI picks up Vista's prompt guidance from this repository, add this to your shell profile (`~/.bashrc` or `~/.zshrc`):

```bash
export COPILOT_CUSTOM_INSTRUCTIONS_DIRS=.gitlab/instructions
```

---

## Starting the Exercise

1. **Fork** this repository to your GitLab account
2. **Clone** your fork locally:
   ```bash
   git clone https://gitlab.com/<your-username>/<repo-name>.git
   cd <repo-name>
   ```
3. **Push a commit to `main`** (or trigger a pipeline manually) to kick off Step 0 — this creates your exercise issue automatically
4. **Open the exercise issue** that appears in your project and follow the step-by-step instructions

---

## How the exercise works

| Step | Trigger | What's validated |
|------|---------|-----------------|
| **Step 0** | Push to `main` | Creates the exercise issue with Step 1 instructions |
| **Step 1** | Manual pipeline run (`glab ci run --branch main`) | Your feature request issue has "Calculator" in the title and a description |
| **Step 2** | Manual pipeline run after Vconfig setup | `GITLAB_TOKEN` CI/CD variable is set and functional (created via Copilot CLI + GitLab MCP) |
| **Step 3** | Push `src/*.js` to `create-calc-app` branch | `calculator.js` contains comments for all four operations |
| **Step 4** | Push `src/tests/*.js` to `create-calc-app` branch | Test file includes modulo, power, and square root tests |
| **Step 5** | Merge your MR to `main` | At least 3 issues exist; exercise is complete |

After each step passes, the pipeline posts feedback and the next set of instructions as a comment on your exercise issue.

---

&copy; 2025 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [MIT License](https://gh.io/mit)
