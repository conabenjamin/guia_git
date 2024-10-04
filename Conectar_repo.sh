#!/bin/bash

read -p "ingrese el repositorio para conectar" repo

git remote add origin $repo
git branch -M main
git push -u origin main