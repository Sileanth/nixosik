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
        # "$HOME/.local/share/coursier/bin"
      ];

      sessionVariables = {
        FOO = "Hello";
        BAR = "$FOO World!";
      };

      shellAliases = {
        ls = "lsd";
        lg = "lazygit";
        ll = "lsd -al";
        ga = "git add -A";
        g = "git";
      };
    };
  };
  # ...
}
