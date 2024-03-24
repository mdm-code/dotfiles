This is a set of notes on how to install Neovim with Ansible.

1. Check if pyenv is available
2. If it is, prepare a dedicated Python virtual environment for Neovim
    - Make sure that init.vim has the right path set for the Python interpreter
    - Can be recorded as an Ansible fact to be reused later in the Jinja template
    - install pynvim in the virtual environment
3. Run Neovim in a headless mode to install required plugins
4. Consider whether to install Neovim with brew (macos only) or build it from source
5. The second option is more portable
6. Plugins can be declared as Ansible variables and added to init.vim with Jinja template
7. Make sure the config directory is present
8. Make sure the plugged directory exists (probably not needed, but might be a separate task for the sake of clarity)
9. Remember to include config options in init.vim for only installed plugins (Jinja?)
9. Run checkhealth to see what else should be installed
10. Install required LSP servers based on an Ansible var list
11. Remove gsnip-related configs (includes the Efm lsp server)
12. Make sure that tmux has the right default-terminal set (easy change in the config)
    - It has screen-256color but should have xterm-256color
13. Git is installed, so is Node. Make sure tree-sitter is installed (I installed it with brew)
    - Make sure CC is installed and available (it should be there by default, but consider installing it as well)
14. Make sure ripgrep (rg) is installed (brew or source)
    - Install fd ( as suggested by the checkhealth )
15. Consider installing some plugins for: html, css, htmlx
16. Make sure Go has templ installed: https://templ.guide/ 
    - Add LSP support for Go templ in neovim https://templ.guide/commands-and-tools/ide-support/#neovim--050
    - All the stuff regarding LSP and tree-sitter is in the templ docs above
    - Plus there's stuff on htmx
