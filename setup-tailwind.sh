#! /usr/bin/bash

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
@tailwind utilities;

@layer base {
  :root {
    /* main color  */
    --main-0: 255 240 246;
    --main-1: 255 222 235;
    --main-2: 252 194 215;
    --main-3: 250 162 193;
    --main-4: 247 131 172;
    --main-5: 240 101 149;
    --main-6: 230 73 128;
    --main-7: 214 51 108;
    --main-8: 194 37 92;
    --main-9: 166 30 77;

    /* second color  */
    --sec-0: 248 240 252;
    --sec-1: 243 217 250;
    --sec-2: 238 190 250;
    --sec-3: 229 153 247;
    --sec-4: 218 119 242;
    --sec-5: 204 93 232;
    --sec-6: 190 75 219;
    --sec-7: 174 62 201;
    --sec-8: 156 54 181;
    --sec-9: 134 46 156;

    /* neu color  */
    --neu-0: 248 249 250;
    --neu-1: 241 243 245;
    --neu-2: 233 236 239;
    --neu-3: 222 226 230;
    --neu-4: 206 212 218;
    --neu-5: 173 181 189;
    --neu-6: 134 142 150;
    --neu-7: 73 80 87;
    --neu-8: 52 58 64;
    --neu-9: 33 37 41;

    /* text color  */
    --white: #f8f9fa;
    --gray: #adb5bd;
    --black: #343a40;
  }
  .dark {
    /* main-color
    --main-0: 248 240 252;
    --main-1: 243 217 250;
    --main-2: 238 190 250;
    --main-3: 229 153 247;
    --main-4: 218 119 242;
    --main-5: 204 93 232;
    --main-6: 190 75 219;
    --main-7: 174 62 201;
    --main-8: 156 54 181;
    --main-9: 134 46 156;

    /* second color
    --sec-0: 255 240 246;
    --sec-1: 255 222 235;
    --sec-2: 252 194 215;
    --sec-3: 250 162 193;
    --sec-4: 247 131 172;
    --sec-5: 240 101 149;
    --sec-6: 230 73 128;
    --sec-7: 214 51 108;
    --sec-8: 194 37 92;
    --sec-9: 166 30 77; */
  }
}
' >src/index.css

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
