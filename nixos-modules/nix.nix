{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mc.nix;
in
{

  imports = [
  ];

  options = {
    mc.nix = {
      enable = lib.mkEnableOption "enable nix";
    };

  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nh
    ];
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];

    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [
      # (final: prev: {
      #   codex = prev.codex.overrideAttrs (
      #     finalAttrs: _oldAttrs: {
      #       version = "0.133.0";
      #       src = prev.fetchFromGitHub {
      #         owner = "openai";
      #         repo = "codex";
      #         tag = "rust-v${finalAttrs.version}";
      #         hash = "sha256-RTxhhZjZ/64N60pmbNVzLwcSBomn67pPDpOjkL6RPUw=";
      #       };
      #       cargoDeps = final.rustPlatform.fetchCargoVendor {
      #         pname = finalAttrs.pname;
      #         version = finalAttrs.version;
      #         src = finalAttrs.src;
      #         sourceRoot = finalAttrs.sourceRoot;
      #         hash = "sha256-J4wvPn4lSTSsJrTG56vkhJe2F2b+fUvJLEd+qKQ9LUg=";
      #       };
      #       cargoHash = "sha256-J4wvPn4lSTSsJrTG56vkhJe2F2b+fUvJLEd+qKQ9LUg=";
      #     }
      #   );
      # })
    ];
    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      dates = "weekly";
    };

    programs.nix-ld = {
      enable = true;

    };
  };
}
