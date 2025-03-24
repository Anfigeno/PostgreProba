# PostgreProba

Un flake simple para poner en marcha una base de datos PostgreSQL

## Instrucciones de uso

- Activar el entorno de desarrollo con `nix develop` o `nix-shell`
- Crear los archivos de PostgreSQL con `crear-base-de-datos`
- Iniciar la base de datos con `iniciar-base-de-datos`
- Conectarse a la base de datos con `psql -h 127.0.0.1 postgres -U anfigeno`
- Detener la base de datos con `detener-base-de-datos`

## Detalles importantes

- Los archivos de PostgreSQL se almacenan en `.postgre/`
- El archivo de contraseña debe estar en `./nix/postgre/contrasena`
- Los registros se encuentran en `./nix/postgre/registros`
- El usuario por defecto es 'anfigeno'

## Personalizar el flake

Simplemente cambia estas variables en el archivo `shell.nix` para personalizar el flake:

```nix
rutaPostgre = "./.postgre";
rutaConfiguracionPostgre = "./nix/postgre";
usuarioPostgre = "anfigeno";
```

## Eso es todo

Gracias por ver esta vaina
