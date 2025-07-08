#!/bin/bash

# Script para capturar uma área, salvar, editar e copiar.

output_dir=~/Imagens/Screenshots
mkdir -p "$output_dir"

file_path="$output_dir/$(date +'%Y-%m-%d_%H-%M-%S').png"

# Captura a área. O if checa se a captura foi bem-sucedida ou cancelada.
if grim -g "$(slurp)" "$file_path"; then
    # Se a captura foi feita, abre no swappy para editar
    swappy -f "$file_path"

    # Depois de fechar o swappy, copia a imagem final para o clipboard
    wl-copy < "$file_path"

    # Notifica o sucesso
    notify-send "Screenshot Salvo" "Copiado para a área de transferência!" -i "$file_path"
else
    # Notifica o cancelamento
    notify-send "Screenshot" "Captura cancelada."
fi
