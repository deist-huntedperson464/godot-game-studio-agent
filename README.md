# Godot Game Studio Agent

Portable Codex skill for building Godot 4.x games with a studio-style workflow.

This skill helps Codex initialize Godot projects, configure GodotIQ MCP, generate first-playable game plans, use genre templates, manage ImageGen asset workflows, improve game feel, run playtest QA, and prepare projects for export.

## Features

- Godot 4.x project bootstrap.
- GodotIQ MCP setup for Codex.
- First-playable production workflow.
- Genre templates for common 2D game types.
- Game brief, development plan, asset list, and polish checklist generation.
- Game-feel guidance for controls, camera, feedback, UI, audio, and VFX.
- ImageGen-friendly art and asset pipeline.
- Playtest QA checklist for readable, satisfying prototypes.
- Portable PowerShell scripts for Windows users.

## Install

Clone this repository, then run:

```powershell
.\scripts\install-skill.ps1 -Force
```

By default, the installer copies the skill to:

- `CODEX_HOME\skills` when `CODEX_HOME` is set.
- `$HOME\.codex\skills` otherwise.

Restart Codex after installing or updating the skill.

## Start A New Game Project

```powershell
.\scripts\start-game-project.ps1 `
  -ProjectPath "<project-root>" `
  -ProjectName "My Godot Game" `
  -Genre "2D platformer" `
  -TargetPlatform "desktop" `
  -Perspective "2D"
```

This creates a Godot project shell plus starter production documents:

- `docs/game-brief.md`
- `docs/dev-plan.md`
- `docs/asset-list.md`
- `docs/polish-checklist.md`

## Configure GodotIQ MCP

From a Godot project root:

```powershell
.\scripts\setup-godot-mcp.ps1 -ProjectPath "<project-root>" -InstallGodotIQ -InstallAddon
```

Restart Codex after changing MCP configuration.

## Use In Codex

Example prompts:

```text
Use $godot-game-studio-agent to start a roguelike survival prototype and reach a first playable version.
```

```text
Use $godot-game-studio-agent to improve the prototype's game feel, feedback, camera, UI, and audio.
```

```text
Use $godot-game-studio-agent to generate an asset list and create placeholder art with ImageGen.
```

## Repository Layout

```text
SKILL.md
agents/
references/
scripts/
```

## Requirements

- Codex with local skill support.
- Godot 4.x.
- PowerShell on Windows.
- `uvx` for GodotIQ MCP setup.
- Optional: Node.js and Git for fallback MCP tooling.

## Safety

The repository is intended to contain only portable skill source files, public documentation, and setup scripts. Do not commit local project files, generated images, credentials, local logs, or machine-specific configuration.
