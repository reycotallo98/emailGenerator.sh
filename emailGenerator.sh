#!/bin/bash

# Verificar si se proporcionaron los argumentos correctos
if [ $# -ne 3 ]; then
    echo "Uso: $0 archivo_entrada cadena archivo_salida"
    exit 1
fi

archivo_entrada="$1"
cadena="$2"
archivo_salida="$3"

# Verificar si el archivo de entrada existe
if [ ! -f "$archivo_entrada" ]; then
    echo "El archivo de entrada '$archivo_entrada' no existe."
    exit 1
fi

# Procesar el archivo línea por línea y agregar la cadena al final
while IFS= read -r linea; do
    echo "${linea}${cadena}" >> "$archivo_salida"
done < "$archivo_entrada"

echo "Documento procesado y guardado en '$archivo_salida'."
