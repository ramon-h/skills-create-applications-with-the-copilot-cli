## Step 2: Set Up Your Development Environment with Vconfig CLI

With Copilot CLI installed, Duck is ready to set up the full Vista development environment. Vista's `vconfig` CLI automates this entire process — installing Skills, MCP servers, and everything else needed to be productive from day one.

### 📖 Theory: Vista's Unified Development Environment

#### What is Vconfig?

`vconfig` is Vista's single source of truth for development environment setup. It ensures every developer runs the same optimized stack tailored to Vista's needs, eliminating tedious manual configuration.

> _"`vconfig` aims to serve as the nexus for Vista's evolving development ecosystem, integrating development tooling and emerging AI capabilities into a unified experience."_

Key things `vconfig` manages for you:

- **Vista Skills** — Vista-specific Copilot instructions and context, installed into `~/copilot` for use by Copilot CLI and VS Code
- **MCP Servers** — Model Context Protocol servers that extend what AI tools can do (like the GitLab MCP, which lets Copilot CLI interact with GitLab on your behalf)
- **Updates** — `vconfig` keeps itself and your tooling fresh automatically

#### Why does this matter?

Once you install the **GitLab MCP** via `vconfig`, Copilot CLI can interact with GitLab directly — creating issues, managing projects, creating access tokens — all without leaving the terminal. You'll use this in Activity 5 to set up the `GITLAB_TOKEN` CI/CD variable needed for the automated exercise feedback.

#### Key Commands

| Command | Purpose |
|---------|---------|
| `vconfig init` | Configuration wizard — **run this first** |
| `vconfig version` | Show installed version |
| `vconfig update` | Update vconfig itself |
| `vconfig devenv skills install` | Install Vista Skills into `~/copilot` |
| `vconfig devenv skills update` | Update Vista Skills |
| `vconfig devenv mcp install` | Install MCP servers (including GitLab MCP) |

> [!NOTE]
> Every command supports a `--plain` flag for a simple terminal experience instead of the interactive TUI.
> All commands have a `--help` flag for detailed documentation.

#### References

- [Vconfig CLI Documentation](https://vistaprint.atlassian.net/wiki/spaces/NTEO/pages/5420745611/Vconfig+CLI)
- [Getting Started with GitHub Copilot at Vista](https://vistaprint.atlassian.net/wiki/spaces/NTEO/pages/3529016399)
- [Vconfig Releases (Slack)](https://vistaprint.slack.com/archives/C0ADGRGPMHA)

---

### Prerequisites

Before installing `vconfig`, you need a **GitLab Personal Access Token** with at minimum `read_api` scope. This is needed only for the initial install.

1. Go to [GitLab Personal Access Tokens](https://gitlab.com/-/user_settings/personal_access_tokens)
2. Create a token with the scope: `read_api` (and optionally `read_repository`, `read_registry`, `read_user`)
3. Copy the token — you'll use it in Activity 1

> [!NOTE]
> This is a **personal token** used once for the vconfig install. In Activity 5, you'll use Copilot CLI + the GitLab MCP to create a separate **project access token** (`GITLAB_TOKEN`) for the CI/CD pipeline — no browser required for that step.

---

### ⌨️ Activity 1: Install Vconfig

1. Set your GitLab token and run the autoinstaller:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > export VCONFIG_GITLAB_TOKEN="your-token-here"
   > curl -fsSL -H "PRIVATE-TOKEN: $VCONFIG_GITLAB_TOKEN" \
   >   "https://gitlab.com/api/v4/projects/76843552/repository/files/scripts%2Finstall.sh/raw?ref=main" | bash
   > ```

2. Verify the installation:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > vconfig version
   > ```

> [!TIP]
> Once installed, vconfig keeps itself up to date. Run `vconfig update` at any time to check for new releases.

---

### ⌨️ Activity 2: Run the Configuration Wizard

`vconfig init` must be run before any other commands. It sets up your GitLab token and saves configuration to `~/.vista/vconfig/settings.yaml`.

1. Launch the configuration wizard:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > vconfig init
   > ```

2. Follow the prompts to enter your GitLab Personal Access Token and complete the setup.

> [!NOTE]
> After `vconfig init`, your token is securely saved. You won't need to set `VCONFIG_GITLAB_TOKEN` as an environment variable for future commands.

> [!TIP]
> If any subsequent `vconfig` command fails with `❌ Configuration Not Found` or `GitLab token not configured`, re-run `vconfig init`.

---

### ⌨️ Activity 3: Install Vista Skills

Vista Skills are Copilot instructions and context files tailored to Vista's engineering practices. Installing them makes Copilot CLI (and VS Code) aware of Vista-specific patterns and conventions.

1. Install Vista Skills:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > vconfig devenv skills install
   > ```

   This installs skills into `~/copilot`, where both Copilot CLI and VS Code can use them.

2. To update skills in the future:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > vconfig devenv skills update
   > ```

> [!NOTE]
> Skills are installed at the **user level** in `~/copilot`. They apply across all your projects.

---

### ⌨️ Activity 4: Install MCP Servers

MCP (Model Context Protocol) servers extend what AI tools can do by giving them access to external systems. `vconfig devenv mcp install` installs MCP servers from Vista's registry, including the **GitLab MCP** which enables Copilot CLI to interact with GitLab directly.

1. Install MCP servers:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > vconfig devenv mcp install
   > ```

   Follow any prompts for authentication or activation. `vconfig` auto-detects your tools (VS Code, Copilot CLI, etc.) and installs MCPs accordingly.

> [!NOTE]
> Some MCPs may require additional authentication during or after installation. Follow the prompts as they appear.

> [!TIP]
> After MCP installation, **restart Copilot CLI** to pick up the newly installed MCP servers.

---

### ⌨️ Activity 5: Create GITLAB_TOKEN Using Copilot CLI + GitLab MCP

Now that the GitLab MCP is installed, Copilot CLI can interact with GitLab on your behalf. Use it to create the project access token needed for the exercise pipeline — no browser required.

1. Start a new Copilot CLI session with all tools enabled:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > copilot --allow-all --enable-all-github-mcp-tools
   > ```

2. Ask Copilot CLI to create a project access token and set it as a CI/CD variable:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > Using the GitLab MCP tools, do the following for the current project on GitLab:
   > 1. Create a project access token named 'exercise-bot' with Reporter role and 'api' scope,
   >    set to expire in 90 days.
   > 2. Add the token as a CI/CD variable named GITLAB_TOKEN with these settings:
   >    - masked: true (so it doesn't appear in logs)
   >    - protected: false (so it works on all branches)
   > Confirm when both steps are complete and show the variable name.
   > ```

3. Once Copilot confirms the `GITLAB_TOKEN` variable is set, trigger the Step 2 validation pipeline:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > Trigger the GitLab CI pipeline manually for the main branch so Step 2 validation runs.
   > Use glab to run the pipeline on the main branch.
   > ```

   Or run it directly:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > glab ci run --branch main
   > ```

4. Watch **CI/CD → Pipelines** in your GitLab project for the Step 2 pipeline to complete. Check your exercise issue for feedback and the next step instructions.

> [!NOTE]
> Copilot CLI may ask for permission to use the GitLab MCP tools. Respond **yes** (or **"Yes, and approve for the rest of the session"**) to allow the operation.

<details>
<summary>Having trouble? 🤷</summary><br/>

- If `vconfig init` fails, make sure your GitLab PAT has `read_api` scope
- If `vconfig devenv mcp install` fails, check that VS Code is installed and accessible via `code` in your terminal (on Mac this is a manual setup step — open VS Code, press `Cmd+Shift+P`, type "shell command", and select "Install 'code' command in PATH")
- If Copilot CLI doesn't have GitLab MCP tools after install, restart Copilot CLI
- If the `GITLAB_TOKEN` CI variable creation fails via Copilot CLI, you can create it manually: Project → Settings → Access Tokens → create token with Reporter role + `api` scope, then Project → Settings → CI/CD → Variables → add `GITLAB_TOKEN`
- Use `vconfig --help` or `vconfig <command> --help` for detailed command documentation

</details>
