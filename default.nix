{
  stdenvNoCC,
  fetchFromGitHub,
  lib
}:

stdenvNoCC.mkDerivation rec {
  pname = "vimix-nord-cursors";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "tristanRW";
    repo = "Vimix-nord-cursors";
    rev = "v${version}";
    sha256 = "sha256-vgerrPCoECm+cChfQN0VcqEeGT3wTg5E2l5a5Sr3cfQ=";
  };

  installPhase = ''
    install -dm 0755 $out/share/icons

    cp -pr dist/ $out/share/icons/vimix-nord-cursors
    mv $out/share/icons/vimix-nord-cursors/index.theme $out/share/icons/vimix-nord-cursors/cursor.theme
    cp -pr dist-white/ $out/share/icons/vimix-nord-white-cursors
    mv $out/share/icons/vimix-nord-white-cursors/index.theme $out/share/icons/vimix-nord-white-cursors/cursor.theme
  '';

  meta = with lib; {
    description = "Cursor theme using the Nord color palette based on Vimix";
    homepage = "https://github.com/tristanRW/Vimix-nord-cursors";
    license = licenses.gpl3;
    platforms = platforms.all;
    maintainers = with maintainers; [
    tristanRW
    ];
  };
}