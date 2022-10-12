#!/usr/bin/bash
# current directory
path='C:\aliases/'

# creating vite app
npm create vite@latest . -- --template react

bash $path/tailwindSetup.sh
bash $path/reactRouterSetup.sh

npm run dev
