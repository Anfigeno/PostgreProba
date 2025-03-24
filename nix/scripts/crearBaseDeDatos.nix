{
  pkgs,
  rutaPostgre,
  rutaConfiguracionPostgre,
  usuarioPostgre,
}:

let
  rutaArchivoDeContrasena = "${rutaConfiguracionPostgre}/contrasena";
in
pkgs.writeShellScriptBin "crear-base-de-datos" ''
  if [ -d ${rutaPostgre} ]; then
    echo "La carpeta '${rutaPostgre}' ya existe. Es posible que la base de datos ya haya sindo iniciada. Deteniendo el script."
  else
    if [ ! -e ${rutaArchivoDeContrasena} ]; then
      echo "El archivo de contraseña '${rutaArchivoDeContrasena}' no existe. Cree el archivo, escriba una contraseña en el e intentelo de nuevo."
    else
      echo ${usuarioPostgre}
      initdb -D ${rutaPostgre} -A md5 --pwfile=${rutaArchivoDeContrasena} --username=${usuarioPostgre}
      echo "Base de datos creada!"
    fi
  fi
''
