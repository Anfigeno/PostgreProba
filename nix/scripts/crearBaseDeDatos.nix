{ pkgs, rutaPostgre, rutaConfiguracionPostgre }:

let rutaArchivoDeContrasena = "${rutaConfiguracionPostgre}/contrasena";
in pkgs.writeShellScriptBin "crear-base-de-datos" ''
  if [ -z $1 ]; then
    echo "Uso: $0 <nombre de usuario>"
    exit 1
  fi

  USUARIO_POSTGRE=$1

  if [ -d ${rutaPostgre} ]; then
    echo "La carpeta '${rutaPostgre}' ya existe. Es posible que la base de datos ya haya sindo iniciada. Deteniendo el script."
  else
    if [ ! -e ${rutaArchivoDeContrasena} ]; then
      echo "El archivo de contraseña '${rutaArchivoDeContrasena}' no existe. Cree el archivo, escriba una contraseña en el e intentelo de nuevo."
    else
      initdb -D ${rutaPostgre} -A md5 --pwfile=${rutaArchivoDeContrasena} --username=$USUARIO_POSTGRE
      echo "Base de datos creada!"
    fi
  fi
''
