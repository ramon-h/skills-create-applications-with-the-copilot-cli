# Create applications with the Copilot CLI

<img src="https://octodex.github.com/images/Professortocat_v2.png" align="right" height="200px" />

Welcome! This is a hands-on exercise for learning GitHub Copilot CLI, adapted for use with **GitLab**.

In this exercise you'll use the standalone Copilot CLI to manage GitLab issues and build a Node.js calculator app — all from the terminal. 🚀

---

## Prerequisites

Before starting the exercise, complete this **one-time setup** in your forked GitLab project (~5 minutes):

### 1. Create a Project Access Token

The CI pipeline posts automated feedback to your exercise issue. It needs a token with API access:

1. Go to **Project → Settings → Access Tokens**
2. Click **"Add new token"**
   - **Name:** `exercise-bot`
   - **Expiry:** set a date at least a few weeks out
   - **Role:** `Reporter`
   - **Scope:** check ✅ `api`
3. Click **"Create project access token"** and **copy the token** (it is shown only once)

### 2. Add it as a CI/CD Variable

1. Go to **Project → Settings → CI/CD → Variables**
2. Click **"Add variable"**
   - **Key:** `GITLAB_TOKEN`
   - **Value:** paste the token you copied
   - **Type:** Variable
   - **Masked:** ✅ Yes
   - **Protected:** ❌ No
3. Click **"Add variable"**

### 3. Configure Copilot CLI instructions

So Copilot CLI picks up the project's prompt guidance stored in `.gitlab/instructions/`, add this to your shell profile (`~/.bashrc` or `~/.zshrc`):

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
3. **Complete the prerequisites** above (Project Access Token + CI variable)
4. **Push a commit to `main`** (or trigger a pipeline manually) to kick off Step 0 — this creates your exercise issue automatically
5. **Open the exercise issue** that appears in your project and follow the step-by-step instructions

---

## How the exercise works

| Step | Trigger | What's validated |
|------|---------|-----------------|
| **Step 0** | Push to `main` | Creates the exercise issue with Step 1 instructions |
| **Step 1** | Manual pipeline run (`glab ci run --branch main`) | Your feature request issue has "Calculator" in the title and a description |
| **Step 2** | Push `src/*.js` to `create-calc-app` branch | `calculator.js` contains comments for all four operations |
| **Step 3** | Push `src/tests/*.js` to `create-calc-app` branch | Test file includes modulo, power, and square root tests |
| **Step 4** | Merge your MR to `main` | At least 3 issues exist; exercise is complete |

After each step passes, the pipeline posts feedback and the next set of instructions as a comment on your exercise issue.

---

&copy; 2025 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [MIT License](https://gh.io/mit)

