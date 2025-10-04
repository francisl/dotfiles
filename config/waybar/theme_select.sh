#!/bin/bash
# Interactive theme selector for waybar
# Creates symbolic links for theme variations
# Usage: 
#   ./theme_select.sh                    # Interactive rofi menu
#   ./theme_select.sh [variation_path]   # Direct selection
# Examples: 
#   ./theme_select.sh                    # Show rofi menu
#   ./theme_select.sh ml4w-blur/dark     # Direct selection

themes_path="$HOME/.config/waybar/themes"
waybar_config="$HOME/.config/waybar"

# -----------------------------------------------------
# Function to create theme symbolic links
# -----------------------------------------------------
create_theme_links() {
    local variation_path="$1"
    
    if [ -z "$variation_path" ]; then
        echo "No theme variation specified."
        return 1
    fi
    
    echo ":: Setting up theme variation: $variation_path"
    
    # Extract base theme name (everything before first /)
    base_theme=$(echo "$variation_path" | cut -d'/' -f1)
    
    # Build paths
    variation_style_path="$themes_path/$variation_path/style.css"
    base_style_path="$themes_path/$base_theme/base.css"
    config_path="$themes_path/$base_theme/config"
    
    echo ":: Base theme: $base_theme"
    echo ":: Variation path: $variation_path"
    echo ":: Variation style: $variation_style_path"
    echo ":: Base style: $base_style_path"
    echo ":: Config: $config_path"
    
    # Remove existing symlinks
    rm -f "$waybar_config/style.css" "$waybar_config/base.css" "$waybar_config/config.jsonc"
    
    # Create symbolic links
    if [ -f "$variation_style_path" ]; then
        ln -s "$variation_style_path" "$waybar_config/style.css"
        echo ":: ✓ Created symlink: style.css -> $variation_style_path"
    else
        echo ":: ✗ Warning: Variation style not found at $variation_style_path"
    fi
    
    if [ -f "$base_style_path" ]; then
        ln -s "$base_style_path" "$waybar_config/base.css"
        echo ":: ✓ Created symlink: base.css -> $base_style_path"
    else
        echo ":: ✗ Warning: Base style not found at $base_style_path"
    fi
    
    if [ -f "$config_path" ]; then
        ln -s "$config_path" "$waybar_config/config.jsonc"
        echo ":: ✓ Created symlink: config.jsonc -> $config_path"
    else
        echo ":: ✗ Warning: Config not found at $config_path"
    fi
    
    # Save the variation to active_themes
    echo "$variation_path" > "$waybar_config/active_themes"
    echo ":: Saved active theme: $variation_path"
}

# -----------------------------------------------------
# Function to list all available theme variations
# -----------------------------------------------------
list_variations() {
    echo "Available theme variations:"
    echo ""
    
    for theme_dir in "$themes_path"/*/; do
        if [ ! -d "$theme_dir" ]; then continue; fi
        
        theme_name=$(basename "$theme_dir")
        
        # Skip assets or non-theme directories
        if [ "$theme_name" = "assets" ]; then continue; fi
        
        echo "📁 $theme_name"
        
        # Check for variation subdirectories
        found_variations=false
        for variation_dir in "$theme_dir"/*/; do
            if [ ! -d "$variation_dir" ]; then continue; fi
            
            variation_name=$(basename "$variation_dir")
            variation_style="$variation_dir/style.css"
            
            if [ -f "$variation_style" ]; then
                echo "  → $theme_name/$variation_name"
                found_variations=true
            fi
        done
        
        # If no variations found, check if base theme has style.css
        if [ "$found_variations" = false ]; then
            base_style="$theme_dir/style.css"
            if [ -f "$base_style" ]; then
                echo "  → $theme_name (base only)"
            fi
        fi
        
        echo ""
    done
}

# -----------------------------------------------------
# Function to build variation list for rofi
# -----------------------------------------------------
build_variation_list() {
    local display_names=""
    local variation_paths=""
    
    for theme_dir in "$themes_path"/*/; do
        if [ ! -d "$theme_dir" ]; then continue; fi
        
        theme_name=$(basename "$theme_dir")
        
        # Skip assets or non-theme directories
        if [ "$theme_name" = "assets" ]; then continue; fi
        
        # Check for variation subdirectories
        found_variations=false
        for variation_dir in "$theme_dir"/*/; do
            if [ ! -d "$variation_dir" ]; then continue; fi
            
            variation_name=$(basename "$variation_dir")
            variation_style="$variation_dir/style.css"
            
            if [ -f "$variation_style" ]; then
                display_names+="$theme_name $variation_name\n"
                variation_paths+="$theme_name/$variation_name~"
                found_variations=true
            fi
        done
        
        # If no variations found, check if base theme has style.css
        if [ "$found_variations" = false ]; then
            base_style="$theme_dir/style.css"
            if [ -f "$base_style" ]; then
                display_names+="$theme_name (base)\n"
                variation_paths+="$theme_name~"
            fi
        fi
    done
    
    # Remove trailing characters
    display_names=${display_names::-2}
    variation_paths=${variation_paths::-1}
    
    echo "$display_names|$variation_paths"
}

# -----------------------------------------------------
# Main logic
# -----------------------------------------------------
if [ -n "$1" ]; then
    # Theme variation provided as parameter
    create_theme_links "$1"
else
    # No parameter - show rofi selection menu
    echo "Loading theme variations..."
    
    # Build the lists
    list_data=$(build_variation_list)
    display_names=$(echo "$list_data" | cut -d'|' -f1)
    variation_paths=$(echo "$list_data" | cut -d'|' -f2)
    
    if [ -z "$display_names" ]; then
        echo "No theme variations found!"
        exit 1
    fi
    
    # Show rofi menu
    choice=$(echo -e "$display_names" | rofi -dmenu -replace -i -no-show-icons -width 40 -p "Select Theme" -format i)
    
    if [ -n "$choice" ]; then
        # Convert choice index to variation path
        IFS="~"
        read -ra paths_array <<<"$variation_paths"
        selected_variation="${paths_array[$choice]}"
        
        if [ -n "$selected_variation" ]; then
            echo "Selected variation: $selected_variation"
            create_theme_links "$selected_variation"
        else
            echo "Invalid selection."
            exit 1
        fi
    else
        echo "No selection made."
        exit 0
    fi

    ./launch.sh
fi
