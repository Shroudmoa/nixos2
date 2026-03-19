{ stdenv, lib, fetchurl, gzip }:

stdenv.mkDerivation rec {
  pname = "cloud-ddns";
  version = "0.3";

  src = fetchurl {
    url = "https://github.com/jason-m/cloud-ddns/releases/download/v${version}/${pname}-${version}-${stdenv.hostPlatform.system}.gz";
    sha256 = "sha256-NQ/96M8VT9ddGAWBVsYVGu5l0sY/1dJSgBPxTW1dQDc=";
  };

  dontBuild = true;
  buildInputs = [ gzip ];

  unpackPhase = ''
    gunzip -c $src > $pname
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp $pname $out/bin/${pname}
    chmod +x $out/bin/${pname}
  '';

  meta = with lib; {
    description = "A simple dynamic DNS client";
    homepage = "https://github.com/jason-m/cloud-ddns";
    license = licenses.mit;
    maintainers = [];
    platforms = platforms.linux;
  };
}
