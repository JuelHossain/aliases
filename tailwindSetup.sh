#!/usr/bin/bash

# setting up tailwind css
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# modifiying tailwind setup
echo '
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}' >tailwind.config.cjs

# injecting tailwind in css file
echo '
@tailwind base;
@tailwind components;
@tailwind utilities;' >src/index.css

# removing app.css file form the src folder
rm src/app.css

# changing the app.jsx file
echo '
export default function App() {
  return (
    <h1 className="text-3xl font-bold underline">
      Hello world!
    </h1>
  )
}' >src/app.jsx
