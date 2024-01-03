{
  stdenvNoCC,
  fetchFromGitHub,
  lib
}:

stdenvNoCC.mkDerivation rec {
  pname = "vimix-nord-cursor-theme";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "tristanRW";
    repo = "Vimix-nord-cursors";
    rev = "v${version}";
    sha256 = "";
  };

  installPhase = ''
    mkdir -p $out/share/icons

    cp -r vimix-nord-dark/ $out/share/icons/vimix-nord-cursors
    mv $out/share/icons/vimix-nord-cursors/index.theme $out/share/icons/vimix-nord-cursors/cursor.theme
    mv $out/share/icons/vimix-nord-cursors/vimix-nord-cursors $out/share/icons/vimix-nord-cursors/cursors
    cp -r vimix-nord-white/ $out/share/icons/vimix-nord-white-cursors
    mv $out/share/icons/vimix-nord-white-cursors/index.theme $out/share/icons/vimix-nord-white-cursors/cursor.theme
    mv $out/share/icons/vimix-nord-white-cursors/vimix-nord-white-cursors $out/share/icons/vimix-nord-white-cursors/cursors
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