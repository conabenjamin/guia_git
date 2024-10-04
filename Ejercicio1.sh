#!/bin/bash


read -p "Ingresa el nombre de tu carpeta: " nombre_folder
mkdir "$nombre_folder"
cd "$nombre_folder" 

git init

read -p "Ingresa el nombre de tu archivo: " nombre_file
touch "$nombre_file"

read -p "Ingresa el mensaje del commit: " mensaje

git add .
git commit -m "$mensaje"

echo "Cambios subidos con éxito."
