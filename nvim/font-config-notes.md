# Font Configuration Changes

This configuration has been updated to use the default Ubuntu terminal font instead of RobotoMono Nerd Font. The following changes were made:

1. Changed `guifont` in options.lua to use "Ubuntu Mono"
2. Created a centralized icons module at `lua/neotex/plugins/lsp/icons.lua` that:
   - Replaces Nerd Font icons with standard ASCII characters
   - Provides consistent icon mappings across plugins
   - Configures nvim-web-devicons to use standard icons

3. Updated the following components to use standard characters:
   - Completion menu icons (nvim-cmp)
   - LSP diagnostic signs
   - Mason installer icons
   - Lualine separators

If you want to switch back to using Nerd Fonts:
1. Change `guifont` back to your preferred Nerd Font
2. Edit the icons.lua file to use Nerd Font icons again
3. Update the plugin configurations accordingly

## Note on Icons

Some UI elements might look different due to the switch from Nerd Font icons to standard ASCII characters. This is expected and ensures compatibility with the default Ubuntu terminal font.
