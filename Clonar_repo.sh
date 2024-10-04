#!/bin/bash

read -p "Ingresa la URL del repositorio a clonar: " repo_url

read -p "Nombre de la rama : " branch_name

git clone "$repo_url"

repo_name=$(basename "$repo_url" .git)

cd "$repo_name"

git checkout "$branch_name"

if [ $? -eq 0 ]; then
  echo "Se cambió correctamente a la rama '$branch_name'."
else
  echo "La rama '$branch_name' no existe. Creando una nueva rama."
  git checkout -b "$branch_name"
fi
