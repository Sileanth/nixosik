{
  config,
  pkgs,
  ...
}: {
  imports = [];
  options = {};
  config = {
    programs.wofi = {
      enable = true;
      style = ''
        window {
                    margin: 0px;
                    border: 1px solid #7A8478;
                    background-color: #1E2326;
                    }

        #input {
                    margin: 5px;
                    border: none;
                    color: #D3C6AA;
                    background-color: #272E33;
                    }

        #inner-box {
                    margin: 5px;
                    border: none;
                    background-color: #1E2326;
                    }

        #outer-box {
                  margin: 5px;
                  border: none;
                  background-color: #1E2326;
                  }

        #scroll {
                  margin: 0px;
                  border: none;
                  }

        #text {
                  margin: 5px;
                  border: none;
                  color: #D3C6AA;
                  }

        #entry:selected {
                  background-color: #272E33;
                  }
      '';
    };
  };
}
