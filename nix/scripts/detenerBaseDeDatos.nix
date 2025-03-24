{
  pkgs,
  rutaPostgre,
}:

pkgs.writeShellScriptBin "detener-base-de-datos" ''
  pg_ctl -D ${rutaPostgre} stop
''
