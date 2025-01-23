{ stdenv, fetchFromGitHub, pkgs }:
{

 sddm-astronaut = stdenv.mkDerivation rec {
    pname = "sddm-astronaut";
    version = "5db329312e7a9f3af09ed1abccc173aed2154a0e";
dontWrapQtApps = true;
    # dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/${pname}
    '';
    src = fetchFromGitHub {
      owner = "ronia-jakim";
      repo = "sddm-theme";
      rev = "${version}";
      sha256 = "sha256-a42Fppq6Kro2XeCzA4XV/c2GB7L/roigtmHo2rddEKU=";
    };
    propagatedBuildInputs = (with pkgs.kdePackages; [
    qt5compat
    qtsvg
    qtmultimedia
    qtvirtualkeyboard
  ]) ++ (with pkgs ;[

    ]);

  };

}
