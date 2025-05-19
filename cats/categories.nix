{
  pkgs,
  ...
}:
{
  # Plugins that will be loaded at startup
  startupPlugins = {
    general = with pkgs.vimPlugins; [
      plenary-nvim
      lze
      lzextras

      nvchad-ui
      nvim-tree-lua
      nvim-web-devicons
      base46

      conform-nvim
      nvim-lint
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
    ];
    debug = with pkgs.vimPlugins; [
      nvim-nio
    ];
  };

  # Plugins that will not loaded at startup
  # Use `lze` or `lz.n` to lazy load these
  # Use `:NixCats pawsible` to see the `packadd` expects
  optionalPlugins = {
    general = with pkgs.vimPlugins; [
      blink-cmp
      # git
      vim-fugitive
      gitsigns-nvim

      mini-surround

      nvim-treesitter-context
      render-markdown-nvim

      telescope-nvim
      telescope-fzf-native-nvim
    ];
    testing = with pkgs.vimPlugins; [
      neotest
      neotest-golang
    ];
    debug = with pkgs.vimPlugins; [
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      nvim-dap-go
    ];
  };

  # Runtime plugin dependencies
  lspsAndRuntimeDeps = {
    general = with pkgs; [
      fd
    ];
    lang = {
      docker = with pkgs; [ hadolint ];
      javascript = with pkgs; [
        typescript-language-server
        tailwindcss-language-server
        biome
        eslint_d
      ];
      go = with pkgs; [
        go
        gopls
        gofumpt
        gotools
        golangci-lint
      ];
      lua = with pkgs; [
        lua-language-server
        stylua
      ];
      nix = with pkgs; [
        nixd
        nixfmt-rfc-style
      ];
    };
  };

  # Runtime environment variables
  environmentVariables = { };

  # Runtime shared libraries
  sharedLibraries = { };

  # Extra wrapper arguments, if needed
  # See https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/setup-hooks/make-wrapper.sh
  extraWrapperArgs = { };

  # Extra categories to enable
  # See :help nixCats.flake.outputs.categoryDefinitions.default_values
  extraCats = { };
}
