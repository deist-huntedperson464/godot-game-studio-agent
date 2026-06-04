# Godot Development Loop

Use this loop for every Godot implementation or debugging task.

## Observe

- Locate `project.godot`, main scene, relevant `.tscn`, `.gd`, `.tres`, and assets.
- Use MCP tools when available to inspect project state, scene tree, runtime state, and logs.
- If MCP is unavailable, read files directly and run Godot from the console executable.

## Plan

- Define the smallest playable or verifiable slice.
- For game work, define the player verb, goal, feedback, fail state, and success state before editing.
- Decide whether the change belongs in a scene, script, resource, asset, project setting, or export preset.
- Name the expected verification command or runtime behavior before editing.

## Edit

- Keep scene and GDScript edits scoped.
- Use ImageGen for bitmap assets when visual quality matters; save final files under `assets/` or `art/`.
- Do not reference generated images from their default ImageGen storage path.

## Run

Run the project or a specific scene:

```powershell
$godot = & "<skill-root>\scripts\check-godot-env.ps1" -ProjectPath "<project-root>" -ShowGodotPathOnly
& $godot --path "<project-root>" --quit-after 3
```

For editor import checks, open the editor once after adding new art assets.

## Inspect Logs

- Read console output, editor output, and MCP debug output.
- Fix parse errors, missing node paths, missing resources, and signal connection failures before continuing.
- If Godot starts but behavior is wrong, instrument with focused `print()` statements and remove them once stable unless they are useful diagnostics.

## Verify

- Rerun after each fix.
- Confirm the acceptance criteria in plain language.
- Confirm the first-time-player path: what the player sees, does, understands, receives as feedback, and how the loop ends or repeats.
- Apply the relevant checks from `references/game-feel.md` and `references/playtest-qa.md` before calling a playable slice done.
- For export tasks, run the export command or validate export presets before calling the task done.
