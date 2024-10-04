#!/bin/bash

if [ -d ".git" ]; then
  echo "Mostrando el historial de commits recientes..."

  git log --oneline --decorate --graph --all
  
  echo "Historial de commits mostrado arriba."
else
  echo "Este directorio no es un repositorio Git."
fi
