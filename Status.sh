#!/bin/bash

# Revisar si estás dentro de un repositorio Git
if [ -d ".git" ]; then
  echo "Revisando el estado del repositorio..."
  
  git status
  
  echo "Estado del repositorio mostrado arriba."
else
  echo "Este directorio no es un repositorio Git."
fi
