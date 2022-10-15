#! /usr/bin/bash
# current directory
path="C:\aliases"
# creating vite app
npm create vite@latest . -- --template react
npm i
bash $path/create-folders.sh
bash $path/setup-tailwind.sh
bash $path/setup-react-router.sh
bash $path/setup-redux.sh

npm run dev
