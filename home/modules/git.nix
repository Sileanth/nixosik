{configs, pkgs, ...}:
{



		home-manager.users.sileanth = {
			programs.git = {
				enable = true;
				userEmail = "lukasz.magnuszewski@gmail.com";
				userName = "sileanth";

				# TODO
				# signing = {
				#
				# };

			};


			programs.gh = {
				enable = true;
				settings = {
					editor="nvim";
				};
				gitCredentialHelper = {
					enable = true;
				};

			};
			programs.lazygit = {
				enable = true;
			};
		};
}
