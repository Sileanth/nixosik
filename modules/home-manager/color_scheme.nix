{pkgs, config, inputs, outputs, options, stylix, ...}: 
{
  imports = [];

  options = {


  };

  config = {
    specialisation = {
      light-theme.configuration = {
        stylix = {
          base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
          enable = true;
          autoEnable = true;
          image = ./joanna-kobierska-dinusie.jpg;
        };

      };
      dark-theme.configuration = {
         stylix = {
          base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
          enable = true;
          autoEnable = true;
          image = ./joanna-kobierska-dinusie.jpg;
        };
      };
    };


  };
}
