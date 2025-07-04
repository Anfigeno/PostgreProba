{
  pkgs ? import <nixpkgs> { },
}:

let
  rutaPostgre = "./.postgre";
  rutaConfiguracionPostgre = "./nix/postgre";

  parametroComunes = {
    inherit
      pkgs
      rutaPostgre
      rutaConfiguracionPostgre
      ;
  };

  iniciarBaseDeDatos = import ./nix/scripts/iniciarBaseDeDatos.nix parametroComunes;
  crearBaseDeDatos = import ./nix/scripts/crearBaseDeDatos.nix parametroComunes;
  detenerBaseDeDatos = import ./nix/scripts/detenerBaseDeDatos.nix {
    inherit
      pkgs
      rutaPostgre
      ;
  };
in
pkgs.mkShell {
  nativeBuildInputs = [
    iniciarBaseDeDatos
    crearBaseDeDatos
    detenerBaseDeDatos
    pkgs.postgresql_17
  ];
}
