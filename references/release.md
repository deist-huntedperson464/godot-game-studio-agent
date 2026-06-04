# Release Packaging

Use this reference when distributing `godot-game-studio-agent` to another Codex installation.

## What Ships

- `SKILL.md`: trigger rules and Godot workflow.
- `agents/openai.yaml`: Codex-facing display metadata.
- `references/`: install, engine detection, engine workflows, studio roles, role routing, quality gates, game brief, genre templates, first playable, asset pipeline, game feel, playtest QA, dev loop, and release notes.
- `scripts/check-godot-env.ps1`: read-only environment check.
- `scripts/check-engine-env.ps1`: read-only Godot/Unity/Unreal environment check.
- `scripts/detect-game-engine.ps1`: engine marker detection.
- `scripts/new-godot-project.ps1`: minimal Godot project initializer.
- `scripts/create-game-docs.ps1`: starter game brief, dev plan, asset list, and polish checklist generator.
- `scripts/start-game-project.ps1`: one-command project and docs bootstrap.
- `scripts/setup-godot-mcp.ps1`: GodotIQ MCP setup for Codex.
- `scripts/install-skill.ps1`: copies the skill into a Codex skills folder.
- `scripts/package-release.ps1`: builds a zip package.

## Build A Zip

From the installed skill folder:

```powershell
& ".\scripts\package-release.ps1"
```

The zip is written to `dist/`. It excludes `dist/` itself so repeated packaging does not nest old builds.

## Install From A Package

Unzip the package, then run:

```powershell
& ".\scripts\install-skill.ps1" -Force
```

The default target is:

- `CODEX_HOME\skills` when `CODEX_HOME` is set.
- `$HOME\.codex\skills` otherwise.

Restart Codex after installing a new skill or changing MCP configuration.

## First Project Smoke Test

```powershell
& ".\scripts\new-godot-project.ps1" -ProjectPath "<project-root>" -ProjectName "Smoke Test"
& ".\scripts\create-game-docs.ps1" -ProjectPath "<project-root>" -ProjectName "Smoke Test" -Genre "2D platformer"
& ".\scripts\check-godot-env.ps1" -ProjectPath "<project-root>"
& ".\scripts\setup-godot-mcp.ps1" -ProjectPath "<project-root>" -InstallGodotIQ -InstallAddon
```

For the normal user-facing bootstrap, prefer:

```powershell
& ".\scripts\start-game-project.ps1" -Engine godot -ProjectPath "<project-root>" -ProjectName "Smoke Test" -Genre "2D platformer"
```

After restarting Codex, ask:

```text
Use $godot-game-studio-agent to create a small playable 2D prototype in this Godot project.
```

## Release Rules

- Do not ship local project files, generated local images, logs, credentials, or machine-specific config.
- Keep paths parameterized; examples may use placeholders only.
- Keep engine version guidance broad unless a project explicitly requires a specific version.
- Validate with `quick_validate.py` before publishing.
