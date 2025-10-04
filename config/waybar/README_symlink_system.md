# Waybar Symbolic Link Theme System

## Overview
The waybar configuration uses symbolic links to manage themes. The system creates three symbolic links that point to the appropriate theme files based on the selected theme variation.

## How it works

### Files created:
- `style.css` - Symbolic link to the variation's style (themes/theme/variation/style.css)
- `base.css` - Symbolic link to the base theme's style (themes/theme/style.css)
- `config.jsonc` - Symbolic link to the theme's config (themes/theme/config)

### Scripts:
1. **launch.sh** - Creates symbolic links and launches waybar (legacy)
2. **theme_select.sh** - Simplified theme selector with variation support

### The Process:
1. When you select a theme variation using `theme_select.sh theme/variation`, the script:
   - Removes existing symbolic links (`style.css`, `base.css`, `config.jsonc`)
   - Creates new symbolic links:
     - `style.css` → variation style file
     - `base.css` → base theme style file  
     - `config.jsonc` → theme config file
   - Saves the variation name to `active_themes` file

2. Waybar uses the symbolic links to load the correct configuration and styles

## Benefits:
- Cleaner waybar command (no parameters needed)
- Easier to see which theme is currently active (via `ls -la`)
- Consistent with standard waybar usage patterns
- Maintains compatibility with existing theme structure

## Usage:
- **Set theme variation**: `./theme_select.sh theme/variation`
- **List available variations**: `./theme_select.sh` (no parameter)
- **Launch waybar**: `waybar` (uses symbolic links)
- **Legacy launch**: `./launch.sh` (compatibility with old system)

## Backup files:
- `launch.sh.backup` - Original launch script
- `theme_select.sh.backup` - Original theme selector

## Examples:
```bash
# Set ml4w-modern theme with dark variation
./theme_select.sh ml4w-modern/dark

# Set ml4w-blur theme with light variation
./theme_select.sh ml4w-blur/light

# Set default theme (no variation)
./theme_select.sh default

# List all available theme variations
./theme_select.sh

# Check current symbolic links
ls -la style.css base.css config.jsonc

# Launch waybar (uses symbolic links)
waybar
```
