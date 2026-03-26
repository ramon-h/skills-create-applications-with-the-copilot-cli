## Step 1: Install Copilot CLI and Use the Issue Template

Duck prefers working in the terminal and wants to use AI from there.
Duck is getting ready to develop a new Node.js CLI calculator app and plans to install the standalone Copilot CLI to build the application from the terminal.

### 📖 Theory: GitHub Copilot CLI - A Standalone Terminal Application

#### What is GitHub Copilot CLI?

GitHub Copilot CLI is a **standalone terminal application** that brings the power of GitHub Copilot directly to your command line. It is installed via npm and provides a rich interactive experience for developers.

<img width="60%" height="60%" alt="CopilotCLI" src="https://gitlab.com/GITLAB_PROJECT_PATH/-/raw/main/.gitlab/images/copilot-cli.png" />

#### Key capabilities and options to be aware of include:

- Providing intelligent command suggestions powered by the latest AI models from OpenAI and Google
- Generating code snippets and scripts directly in your terminal
- Assisting with Git operations and repository interactions
- Supporting image inputs via paste and drag-and-drop for visual context
- The `--enable-all-github-mcp-tools` flag enables all GitHub MCP (Model Context Protocol) tools
- Depending on your Copilot CLI configuration (for example, if you don't use the `--allow-all` option), you may be prompted to enable certain features during the session. Respond **yes** to these prompts as well.
- `/session`: Shows details about your current chat session.
- `/context`: Provides a visual overview of your current token usage
- `/usage`: Lets you view your session statistics, including:
  - The amount of premium requests used in the current session
  - The session duration
  - The total lines of code edited
  - A breakdown of token usage per model
- `/share [file|gist] [path]` - Share session to markdown file or GitHub gist
- Creating **custom agents** to encode specialized prompts and workflows
- Delegating tasks to **Copilot coding agent** using the `/delegate` command

#### Global shortcuts

```text
 @             mention files, include contents in context
 Esc           cancel the current operation
 !             execute command in your local shell (bypass Copilot)
 ctrl+c        cancel operation / clear input / exit
 ctrl+d        shutdown
 ctrl+l        clear the screen
 shift+tab     switch between plan mode and regular interactive mode
```

#### Installation Requirements

To install Copilot CLI, you need:

- Node.js version 22 or later
- npm version 10 or later
- An active GitHub Copilot subscription (Pro, Pro+, Business, or Enterprise)

#### GitLab Issue Templates

Issue templates help maintain consistency when team members create issues. This repository has a `feature_request.md` template in `.gitlab/issue_templates/` that you'll use to create your calculator app issue. Templates ensure:

- All necessary information is captured upfront
- Issues follow a standard format
- The team can triage and respond to issues more efficiently

#### References

- [Installing GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli)
- [Using GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/use-copilot-cli)
- [GitHub Copilot CLI 101](https://github.blog/ai-and-ml/github-copilot-cli-101-how-to-use-github-copilot-from-the-command-line/)

> [!IMPORTANT]
> If you have restarted your terminal session you may need to run `copilot --allow-all` and authenticate again. Run `!glab auth login` from within your Copilot CLI session, or `glab auth login` from the terminal.

### :keyboard: Activity 1: Getting to know your development environment

1. Clone the repository locally if you haven't already:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)

   > ```bash
   > git clone https://gitlab.com/{{full_repo_name}}.git
   > cd $(basename {{full_repo_name}})
   > ```

1. Make sure you have Node.js 22+ installed:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)

   > ```bash
   > node --version   # Should be v22.x.x or higher
   > npm --version    # Should be v10.x.x or higher
   > ```

   > [!TIP]
   > Alternatively, you can use the **GitLab Web IDE** by navigating to your project on GitLab and pressing `.` (period) key to open a browser-based editor with a terminal.

> [!IMPORTANT]
> This exercise focuses on using Copilot CLI in the terminal. You'll primarily be working with terminal commands rather than a full IDE.

### ⌨️ Activity 2: Install the Standalone Copilot CLI

1. Install the standalone GitHub Copilot CLI:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)

   > ```bash
   > npm install -g @github/copilot
   > ```

1. Verify the installation:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)

   > ```bash
   > copilot --version
   > ```

1. Set the custom instructions directory so Copilot CLI picks up the project's prompt guidance:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)

   > ```bash
   > export COPILOT_CUSTOM_INSTRUCTIONS_DIRS=.gitlab/instructions
   > ```
   > Add this to your `~/.bashrc` or `~/.zshrc` to persist it across sessions.

> [!TIP]
> After installation, you can use the `copilot` command anywhere in your terminal to start an interactive session!

### ⌨️ Activity 3: Create an Issue Using Copilot CLI

1. Start an interactive Copilot CLI session:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > copilot --enable-all-github-mcp-tools
   > ```

> [!NOTE]
> When starting Copilot CLI, you may be prompted to add this folder to the trusted folder list and to key bindings. Respond **yes** to both prompts to continue.

<img width="60%" height="60%" alt="CopilotCLIAddDir" src="https://gitlab.com/GITLAB_PROJECT_PATH/-/raw/main/.gitlab/images/copilot-cli-add-directory.png" />
<br />
<img width="60%" height="60%" alt="CopilotCLITerminalBindings" src="https://gitlab.com/GITLAB_PROJECT_PATH/-/raw/main/.gitlab/images/copilot-cli-terminal-bindings.png" />

2. Authenticate with GitLab (if not already done) using the `glab` CLI from within Copilot CLI:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > !glab auth login
   > ```

> [!NOTE]
> You will be guided through the GitLab authentication flow. Choose HTTPS and follow the prompts to complete login.

3. Explore useful slash commands in Copilot CLI:
   - View your current session information:

     > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
     >
     > ```prompt
     > /session
     > ```

   - View your current context information:

     > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
     >
     > ```prompt
     > /context
     > ```

   - View your current usage information:

     > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
     >
     > ```prompt
     > /usage
     > ```

4. Ask Copilot CLI to help you create a feature request issue for the calculator app using `glab`:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > Create a GitLab issue for a Node.js CLI calculator app using the following template
   > .gitlab/issue_templates/feature_request.md as the markdown format and make sure
   > the issue contains "calculator" in the title and follows the format of the template.
   > I want to request a feature for basic arithmetic operations including
   > - addition
   > - subtraction
   > - multiplication
   > - division
   > The calculator should be implemented in calculator.js
   > Create the issue directly in the current owner and repository on gitlab.com
   > using the `glab` CLI commands.
   > List the issue link when complete
   > ```

5. After creating the issue, trigger the Step 1 validation pipeline to check your work:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > Trigger the GitLab CI pipeline manually for the main branch so Step 1 validation runs.
   > Use glab to run the pipeline on the main branch.
   > ```

   Or run it directly from the terminal:

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > glab ci run --branch main
   > ```

   Then visit **CI/CD → Pipelines** in your GitLab project to watch the pipeline run and check the results in your issue comments.

> [!NOTE]
> Copilot CLI may ask to confirm creating the issue and using `glab issue` commands.
> Respond **yes** to these prompts to allow the operation.

<img width="60%" height="60%" alt="CopilotCLIPerms" src="https://gitlab.com/GITLAB_PROJECT_PATH/-/raw/main/.gitlab/images/copilot-cli-permissions.png" />

<details>
<summary>Having trouble? 🤷</summary><br/>

- Make sure you have Node.js 22+ installed: `node --version`
- If npm install fails, try: `sudo npm install -g @github/copilot`
- Make sure you have GitHub Copilot access enabled for your account
- Install `glab` if not present: https://gitlab.com/gitlab-org/cli#installation
- If authentication fails, run `glab auth login` and follow the prompts
- You can also create the issue through the GitLab web UI if needed

</details>
