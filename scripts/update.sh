

      # pushd ${cfg.config-path}
      flatpak update
      nix flake update
      nix fmt
      git add -A
      git commit -m "update"
      git push

      nh os switch .
      nh home switch .


      # popd

