## Step 4: Create, Review, and Merge Your Merge Request

Duck is ready to finalize the development work by creating a merge request, linking it to both issues, getting a review from Copilot, and merging the changes—all from the command line with Copilot CLI.

### 📖 Theory: Merge Requests and Code Review with Copilot CLI

#### Understanding Merge Requests (MRs)

Merge requests are the standard way to propose changes in collaborative development on GitLab:

- They allow team members to review code before merging
- They maintain a history of changes and decisions
- They can be linked to issues for better project tracking
- They enable automated testing and validation through GitLab CI/CD

#### Connecting MRs to Issues

Linking merge requests to issues helps with project management:

- GitLab closes issues automatically when the MR is merged (using `Closes #N` in the MR description)
- Provides traceability between work items and code changes
- Helps track progress through the development lifecycle
- Improves team communication about what's being built

#### Code Review with AI Assistance

GitHub Copilot can act as a reviewer to:

- Suggest improvements to code quality
- Identify potential bugs or edge cases
- Recommend best practices and design patterns
- Provide constructive feedback on implementation

The Copilot CLI enables you to:

- Create merge requests directly from the terminal using `glab`
- Request reviews from team members
- Merge changes without leaving the CLI
- Automate the entire workflow for faster iteration

#### References

- [Creating Merge Requests with glab CLI](https://gitlab.com/gitlab-org/cli/-/blob/main/docs/source/mr/create.md)
- [Linking Issues and MRs in GitLab](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [GitHub Copilot as a Code Reviewer](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/request-a-code-review/use-code-review)

> [!IMPORTANT]
> If you have restarted your terminal you may need to run `copilot --allow-all` and then authenticate with GitLab again by running `!glab auth login` from within the Copilot CLI session.

### ⌨️ Activity: Complete Your Merge Request Workflow

1. Start an interactive Copilot CLI session (if not already in a session):

   > ![Static Badge](https://img.shields.io/badge/Terminal-text?logo=gnometerminal&labelColor=0969da&color=ddf4ff)
   >
   > ```bash
   > copilot --allow-all --enable-all-github-mcp-tools
   > ```

2. Create a merge request for your changes:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > Create a GitLab merge request from the current branch with the title
   > "Add calculator enhancements" and a description that includes the main changes:
   > basic calculator operations and expanded functionality with modulo, power, and square root.
   > Use glab to create the merge request targeting the main branch.
   > List the MR link when it is completely created.
   > ```

3. Attach the merge request to both issues you created earlier so they close automatically when merged:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > Update the merge request description to include "Closes #N" references for both
   > the "Create a calculator" and "Add more operations" issues so they close automatically when merged.
   > Use glab to update the MR description.
   > ```

4. Merge the merge request:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > Merge the merge request and confirm the attached issues are closed.
   > Use glab mr merge to complete the merge.
   > ```

> [!NOTE]
> When you merge an MR that contains "Closes #N" in its description,
> GitLab automatically closes those issues. Using squash commits keeps your
> main branch history clean.

5. Verify that both issues are now closed:

   > ![Static Badge](https://img.shields.io/badge/CLI-Prompt-text?style=flat-square&logo=github-copilot&labelColor=8250df&color=fbefff)
   >
   > ```prompt
   > List the closed issues in the repository to confirm both the "Create a calculator" 
   > and "Add more operations" issues are now closed.
   > Use glab issue list --closed to verify.
   > ```

6. The GitLab CI pipeline will run automatically on the merge to main. Watch **CI/CD → Pipelines** for the Step 4 pipeline to complete, then check the exercise issue comments for your final review and completion message.

> [!TIP]
> Use `/share gist` in your Copilot CLI session to save your exercise session
> as a gist for documentation and future reference!

<details>
<summary>Having trouble? 🤷</summary><br/>

- Make sure you've committed and pushed all your changes before creating the MR
- Verify your GitLab authentication with `!glab auth status` in Copilot CLI
- If the MR creation fails, check that you're on a branch different from main
- To manually link an issue, edit the MR description to include `Closes #<issue-number>`
- You can view MR details with `!glab mr view` or `!glab mr list` to see your MRs
- For issues that don't close automatically, link them manually via the GitLab web UI
- Use `!glab mr merge --squash` to merge with a clean history

</details>
