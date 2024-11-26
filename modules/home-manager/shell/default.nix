{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    home = {
      sessionPath = [
        "$HOME/.local/bin"
      ];

      sessionVariables = {
        FOO = "Hello";
        BAR = "$FOO World!";
      };

      shellAliases = {
        lg = "lazygit";
        ll = "lsd -al";
        ga = "git add -A";
        g = "git";
      };
    };
  };
  # ...
}
