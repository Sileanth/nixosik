{pkgs, config, inputs, outputs, options, ...}: 
{
  imports = [];

  options = {


  };

  config = {
    specialisation = {
      light-theme.configuration = {
        colorScheme = inputs.nix-colors.colorSchemes.catppuccin-latte;

      };
      dark-theme.configuration = {
        colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

      };
    };


  };
}
