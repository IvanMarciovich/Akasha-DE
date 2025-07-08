#!/bin/bash

# Opções do menu
shutdown=" Desligar"
reboot=" Reiniciar"
lock=" Bloquear"
logout=" Sair"

# Captura a escolha do usuário
chosen_option=$(echo -e "$shutdown\n$reboot\n$lock\n$logout" | rofi -dmenu -p "Sistema" -i -theme ~/.config/rofi/powermenu.rasi)

# Executa a ação baseada na escolha
case "$chosen_option" in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$lock")
        # Adicione aqui o seu comando de bloqueio de tela, ex: hyprlock ou swaylock
        hyprlock 
        ;;
    "$logout")
        hyprctl dispatch exit
        ;;
esac
