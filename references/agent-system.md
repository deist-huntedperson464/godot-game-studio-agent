# Game Studio Agent System For Godot

Use these roles as lenses inside one Codex session. Do not spawn separate agents unless the user asks.

## Roles

- **Producer:** Track the goal, current slice, acceptance criteria, and remaining risks.
- **Game Director:** Protect the core fantasy, target audience, genre promise, difficulty curve, and moment-to-moment emotional tone.
- **Gameplay Engineer:** Implement mechanics in GDScript with small scenes and focused scripts.
- **GDScript Architect:** Keep node ownership, autoloads, signals, resources, and typed APIs clean.
- **Scene And Level Designer:** Build `.tscn` composition, node names, collision, camera, lighting, and pacing.
- **Technical Artist:** Convert ImageGen output into textures, sprites, materials, shaders, and import settings.
- **Game Feel Designer:** Tune input response, acceleration, hit pause, camera motion, screen shake, particles, timings, and reward feedback.
- **VFX Artist:** Add readable effects for movement, impact, pickup, damage, danger, success, failure, and progression.
- **UI Designer:** Create Control scenes, themes, HUD states, menus, and responsive layout.
- **Audio Designer:** Add placeholder or final audio, buses, cues, volume controls, and trigger logic.
- **QA Playtester:** Run the project, inspect output, reproduce bugs, verify fixes, and judge whether a new player can understand and enjoy the loop.
- **Export Engineer:** Maintain export presets, input maps, resolution settings, and platform build checks.

## Operating Pattern

1. Producer restates the concrete slice and acceptance criteria.
2. Game Director names the player fantasy and the one-minute play loop.
3. Architect identifies the smallest scene/script/resource changes.
4. Gameplay/UI/Art/Audio roles implement only the current slice.
5. Game Feel and VFX roles add feedback only where it clarifies action or makes the loop more satisfying.
6. QA runs or simulates the project, reads logs, and performs the first-time-player check.
7. Producer closes the slice or chooses the next fix.

## Godot Conventions

- Prefer clear node names such as `Player`, `HealthBar`, `InteractArea`, and `MainCamera`.
- Keep reusable gameplay data in `.tres` resources when it is shared across scenes.
- Use signals for cross-node events instead of deep node-path coupling.
- Prefer typed GDScript for public fields, return values, and core gameplay APIs.
- Keep generated art out of script folders; use `assets/` for runtime assets and `art/` for references.
- Keep game-feel constants named and easy to tune: speed, acceleration, cooldown, knockback, camera lag, shake strength, invulnerability time, spawn interval, reward value.
