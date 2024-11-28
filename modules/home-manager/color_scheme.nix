{pkgs, config, inputs, lib, outputs, options, stylix, ...}: 
{
  imports = [];

  options = {


  };
   config = {
     stylix = lib.mkDefault {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        enable = true;
        autoEnable = true;
        image = ./joanna-kobierska-dinusie.jpg;
      };


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
