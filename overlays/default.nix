{ pkgs, ... }:

{

nixpkgs.overlays = [

(
  self: super : {
    koka = super.koka.overrideDerivation (old : {
      version = "2.6.0";

    });

  }

)

];


}
