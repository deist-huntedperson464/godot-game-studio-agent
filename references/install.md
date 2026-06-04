# Godot Installation And MCP Setup

Use this reference when setting up or repairing the Godot/Codex toolchain on a new machine or project. All commands are portable; pass explicit paths when auto-detection is not enough.

## Detect The Environment

Run:

```powershell
& "<skill-root>\scripts\check-godot-env.ps1" -ProjectPath "<project-root>"
```

Godot discovery order:

- `-GodotPath`
- `GODOT4_PATH`
- `GODOT_PATH`
- `godot` or `godot4` on `PATH`
- common Windows install folders and portable Godot folders

If the project is on a UNC path, prefer passing absolute paths to tools. If a tool launched through `cmd.exe` fails on UNC current directories, map or use an existing drive path before retrying.

## Initialize A Project

A valid Godot project has `project.godot` at the root. For a game-ready starter with docs and production folders:

```powershell
& "<skill-root>\scripts\start-game-project.ps1" -ProjectPath "<project-root>" -ProjectName "My Godot Game" -Genre "2D platformer" -TargetPlatform "desktop" -Perspective "2D"
```

This creates the Godot shell plus:

- `docs/game-brief.md`
- `docs/dev-plan.md`
- `docs/asset-list.md`
- `docs/polish-checklist.md`
- starter folders for scenes, scripts, resources, UI, assets, art, audio, tests, and exports

For only a minimal 2D project:

```powershell
& "<skill-root>\scripts\new-godot-project.ps1" -ProjectPath "<project-root>" -ProjectName "My Godot Game"
```

This creates:

- `project.godot` with `run/main_scene`
- `scenes/main.tscn`
- `scripts/main.gd`
- `assets/` for runtime assets
- `art/` for concepts and source art
- `audio/`, `ui/`, `resources/`, `docs/`, `tests/`, and `exports/`

## Install GodotIQ MCP

GodotIQ is the primary MCP because it documents Codex TOML setup directly.

Install or run through `uvx`:

```powershell
uvx godotiq --help
```

Codex config:

```toml
[mcp_servers.godotiq]
command = "uvx"
args = ["godotiq"]

[mcp_servers.godotiq.env]
GODOTIQ_PROJECT_ROOT = "<absolute-project-root>"
```

Configure it with:

```powershell
& "<skill-root>\scripts\setup-godot-mcp.ps1" -ProjectPath "<project-root>" -InstallGodotIQ -InstallAddon
```

After editing the Codex config file, restart Codex so the MCP server is loaded.

## Install The Godot Addon

If GodotIQ bridge tools require the editor addon, run the provider's addon installer from the project root:

```powershell
$env:PYTHONUTF8 = "1"
uvx godotiq install-addon "<project-root>"
```

Then open Godot and enable the addon if prompted. If the command fails, capture the error and continue with file-level Codex edits plus runtime checks until the bridge is repaired.

On Windows, keep `PYTHONUTF8=1` for this command. Without it, some Python environments may fail while reading GodotIQ's bundled rule files under a non-UTF-8 console code page.

## Fallback MCP

If GodotIQ is unavailable, use an open-source Godot MCP server:

- `bradypp/godot-mcp`: Node/TypeScript server for launching projects, scene operations, debug output, and project metadata.
- Godot 4.6 MCP variants with an editor addon can inspect and modify the live scene tree.

Fallback Codex shape:

```toml
[mcp_servers.godot]
command = "node"
args = ["<absolute-path-to-godot-mcp>/build/index.js"]

[mcp_servers.godot.env]
GODOT_PATH = "<absolute-path-to-godot-executable>"
READ_ONLY_MODE = "false"
```

Build fallback servers exactly as their README specifies before adding them to Codex.
