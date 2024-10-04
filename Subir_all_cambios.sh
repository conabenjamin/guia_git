#!/bin/bash

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