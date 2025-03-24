{
  pkgs,
  rutaPostgre,
  rutaConfiguracionPostgre,
  usuarioPostgre,
}:

pkgs.writeShellScriptBin "iniciar-base-de-datos" ''
  if [ ! -d ${rutaPostgre} ]; then
    echo "No se puede iniciar la base de datos porque aun no ha sido creada."
  else
    pg_ctl -D ${rutaPostgre} -l ${rutaConfiguracionPostgre}/registros -o "--unix-socket-directories='$PWD'" start
    echo "Para acceder a la base de datos usa:"
    echo "  psql -h 127.0.0.1 postgres -U ${usuarioPostgre}"
  fi
''
