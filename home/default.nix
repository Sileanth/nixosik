{pkgs, pkgs-unstable, ...}: {
	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;


	imports = [
		./modules/git.nix
		./modules/shell.nix
		./modules/hypr.nix
		./modules/waybar.nix
		./modules/nvim

	];

	home-manager.users.sileanth = {
		home.stateVersion = "25.05";


		home.packages = (with pkgs; [
			obsidian
			discord
			spotify

			tailscale
			sqlite
      ansible
      python3

      helix
      zed-editor
      vscode
      windsurf

      nh
      nil
      nixd
			just


			mpv
			btop
			lazygit
			bat
			unrar
      tldr

			swi-prolog

			dotnet-sdk
			csharp-ls

			typescript-language-server
			nodejs_24
      svelte-language-server
			eslint

      elan

      gcc


			efibootmgr
			

		]) ++ (with pkgs-unstable; [
              code-cursor
    ]) ++ [
  (pkgs.writeShellScriptBin "epower" ''
CHOICE=$(${pkgs.gum}/bin/gum choose \
  "Shutdown" \
  "Reboot" \
  "Suspend" \
  "Hibernate")

case "$CHOICE" in
  "Shutdown")
    systemctl poweroff
    ;;
  "Reboot")
    systemctl reboot
    ;;
  "Suspend")
    systemctl suspend
    ;;
  "Hibernate")
    systemctl hibernate
    ;;
  *)
    echo "No action selected or invalid choice."
    ;;
esac
  '')

      ];






	};


}
