#!/bin/bash

mostrar_menu() {
    echo "Seleccione una tarea a realizar:"
    echo "1. Ver el estado del repositorio (git status)"
    echo "2. Ver el historial de commits (git log)"
    echo "3. Crear una nueva rama"
    echo "4. Cambiar a una rama específica"
    echo "5. Subir cambios (crea commit)"
    echo "6. Salir"
}

estado_repositorio() {
    if [ -d ".git" ]; then
        git status
        echo "Estado del repositorio mostrado con éxito."
    else
        echo "Este directorio no es un repositorio Git."
    fi
}

historial_commits() {
    if [ -d ".git" ]; then
        git log --oneline --decorate --graph --all
        echo "Historial de commits mostrado con éxito."
    else
        echo "Este directorio no es un repositorio Git."
    fi
}

crear_rama() {
    if [ -d ".git" ]; then
        read -p "Ingrese el nombre de la nueva rama: " nueva_rama
        git checkout -b "$nueva_rama"
        if [ $? -eq 0 ]; then
            echo "Rama '$nueva_rama' creada con éxito."
        else
            echo "Error al crear la rama '$nueva_rama'."
        fi
    else
        echo "Este directorio no es un repositorio Git."
    fi
}

cambiar_rama() {
    if [ -d ".git" ]; then
        read -p "Ingrese el nombre de la rama a la que desea cambiar: " nombre_rama
        git checkout "$nombre_rama"
        if [ $? -eq 0 ]; then
            echo "Cambiado a la rama '$nombre_rama' con éxito."
        else
            echo "Error: La rama '$nombre_rama' no existe o no se pudo cambiar."
        fi
    else
        echo "Este directorio no es un repositorio Git."
    fi
}

subir_cambios(){
    read -p "Ingresa el mensaje del commit: " mensaje

    git add .

    git commit -m "$mensaje"

    remote=$(git remote)
    if [ -z "$remote" ]; then
    echo "No hay repositorio remoto configurado. Configura un repositorio remoto primero."
    exit 1
    fi

    git push origin $(git branch --show-current)

    echo "Cambios subidos a GitHub con éxito."
}


while true; do
    mostrar_menu
    read -p "Seleccione una opción (1-5): " opcion

    case $opcion in
        1)
            estado_repositorio
            ;;
        2)
            historial_commits
            ;;
        3)
            crear_rama
            ;;
        4)
            cambiar_rama
            ;;
        5)
            subir_cambios
            ;;
        6)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción entre 1 y 5."
            ;;
    esac

    echo ""
done
