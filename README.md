# [Chronicler](https://github.com/nytimes/Chronicler) Action

This Github action will run Chronicler whenever a PR is merged.  Chronicler will add a `- PR title (#PR_Number)` bullet for each merged PR in either an existing release draft or a new release draft.

For more information, checkout the [Chronicler repo](https://github.com/nytimes/Chronicler) or [blog post](https://open.nytimes.com/open-source-automating-release-notes-in-github-dd08f964465c).

## Usage

```
workflow "Add PR to release notes" {
  on = "pull_request"
  resolves = ["Chronicler"]
}

action "Run Chronicler" {
  uses = "crosscompile/chronicler-action@master"
  secrets = ["GITHUB_TOKEN"]
}
```