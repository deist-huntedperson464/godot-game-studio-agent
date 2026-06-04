---
name: godot-game-studio-agent
description: Set up and operate a Codex-driven Godot game studio workflow with Godot 4.x, GodotIQ or open-source Godot MCP bridges, ImageGen asset generation, game brief intake, genre templates, first-playable production, game-feel polish, GDScript, scenes, resources, run/debug loops, playtest QA, and export preparation. Use when the user asks to create, configure, automate, debug, polish, or iterate on a Godot game through Codex, MCP tools, generated art assets, or a multi-role Game Studio agent process.
---

# Godot Game Studio Agent

## Overview

Use this skill to turn Codex into a practical Godot game studio operator for any Godot 4.x project. It is designed as a portable release package: detect the local Godot executable, initialize a project when needed, configure GodotIQ as the primary MCP bridge, and fall back to an open-source Godot MCP route when GodotIQ is unavailable or too limited.

The production target is not merely "runs without errors." The default target is a small, playable, readable, and satisfying first version with clear player intent, responsive controls, visible feedback, coherent art direction, useful UI, and a repeatable playtest path.

## Quick Start

1. Inspect the project with `scripts/check-godot-env.ps1`.
2. If starting fresh, use `scripts/start-game-project.ps1` to create the project structure and starter design docs.
3. If no `project.godot` exists and only a minimal shell is needed, create it with `scripts/new-godot-project.ps1`.
4. Configure Codex MCP with `scripts/setup-godot-mcp.ps1`; use GodotIQ first.
5. Restart Codex after changing the Codex config file so new MCP tools can load.
6. Use the loop in `references/dev-loop.md` for every implementation task.

## Workflow

- **Install or repair tooling:** Read `references/install.md`, run the check script, configure GodotIQ, then verify MCP tools are visible after restart.
- **Start a game:** Read `references/game-brief.md`, choose a shape from `references/genre-templates.md`, then generate `docs/game-brief.md`, `docs/dev-plan.md`, `docs/asset-list.md`, and `docs/polish-checklist.md`.
- **Build a first playable:** Read `references/agent-system.md`, `references/first-playable.md`, and `references/dev-loop.md`. Deliver a complete minute-one experience before expanding scope.
- **Improve game effect:** Use `references/game-feel.md` for controls, feedback, camera, animation, hit effects, UI clarity, pacing, sound, and juice.
- **Create visual assets:** Invoke the `imagegen` skill for concept art, textures, sprites, UI mockups, icons, or placeholders. Use `references/asset-pipeline.md`, save project-bound images under `assets/` or `art/`, then import or bind them through Godot scenes/resources.
- **Debug and playtest:** Prefer real editor/runtime feedback over guessing. Read scene state, run the project, inspect logs, use `references/playtest-qa.md`, make one focused fix, and rerun.
- **Prepare release:** Use `references/release.md` when packaging this skill for another Codex installation.

## Common Prompts

```text
Use $godot-game-studio-agent to start a 2D platformer project and reach a playable first version quickly.
```

```text
Use $godot-game-studio-agent to improve this prototype's feel: movement, attack feedback, camera, audio, and UI.
```

```text
Use $godot-game-studio-agent to build the first playable from the roguelike survival template: movement, enemy spawns, leveling, failure, and restart.
```

## Defaults

- Godot executable: auto-detect from `-GodotPath`, `GODOT4_PATH`, `GODOT_PATH`, `PATH`, then common install folders.
- Project root: current folder containing `project.godot`, or a user-provided absolute path.
- Primary MCP: `godotiq` via `uvx godotiq`
- Codex MCP config: `-CodexConfig`, then `CODEX_HOME\config.toml`, then `$HOME\.codex\config.toml`
- Generated art: `art/` for concepts, `assets/` for imported runtime assets

## Guardrails

- Do not introduce terminology or workflows from earlier non-Godot plans into Godot instructions.
- Keep GDScript and scene edits small, run the project often, and inspect logs before broad rewrites.
- Do not overwrite existing art or resources unless the user explicitly asks for replacement.
- Keep generated assets inside the Godot project before referencing them from scenes or scripts.
- Keep release package files portable: avoid user-specific paths, machine-specific versions, project-specific names, credentials, or local-only assumptions.
- Do not call a game slice complete until a player can understand the goal, perform the core action, see feedback, and complete or fail a short loop.
