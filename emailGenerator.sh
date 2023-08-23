#!/bin/bash

# Verify correctly usage
if [ $# -ne 3 ]; then
    echo "Use: $0 input_file string output_file"
    exit 1
fi

archivo_entrada="$1"
cadena="$2"
archivo_salida="$3"

# Verificar si el archivo de entrada existe
if [ ! -f "$archivo_entrada" ]; then
    echo "Input file '$archivo_entrada' do not exist."
    exit 1
fi

# Procesar el archivo línea por línea y agregar la cadena al final
while IFS= read -r linea; do
    echo "${linea}${cadena}" >> "$archivo_salida"
done < "$archivo_entrada"

echo "Document succesfully generated in '$archivo_salida'."
