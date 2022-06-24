#!/bin/sh

mkdir $1
cd $1

npm init -y
npm i parcel --save-dev
npm i react react-dom
npm i --save-dev gh-pages

mkdir src
# Add starter files
echo '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <!-- <link rel="icon" type="image/svg+xml" href="" /> -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="./src/index.jsx"></script>
  </body>
</html>' >> index.html

echo '"source": "./index.html",
"alias": {
    "process": false
  },
  "scripts": {
    "dev": "parcel --dist-dir docs",
    "build": "parcel build --dist-dir docs",
    "build-github": "rm -rf docs/* && rm -rf .parcel-cache/ && parcel build ./src/index.html --public-url ./ --dist-dir docs",
    "deploy": "gh-pages -d docs/"
  },' >> scripts

echo 'import React from "react";
import ReactDOM from "react-dom";
import App from "./App";

ReactDOM.render(<App />, document.getElementById("root")); ' >> src/index.jsx

echo 'import React from "react";
import Navbar from "./Components/Navbar";

const App = () => {
  return (
    <div>
      <h1>Hello World</h1>
      <Navbar />
    </div>
  );
}

export default App;' >> src/App.jsx

mkdir src/assets
mkdir src/assets/images
mkdir src/styles
mkdir src/Components
echo 'import React from "react";

const Navbar = () => {
  return (
    <>
      <nav>Navbar</nav>
    </>
  );
}


export default Navbar;' >> src/Components/Navbar.jsx

echo '# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

node_modules
dist
dist-ssr
*.local

# Editor directories and files
.vscode/*
!.vscode/extensions.json
.idea
.DS_Store
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

*.sketch
.parcel-cache/
*.fig
*.xd
.DS_Store
.prettierignore
dist/ '>> .gitignore

# Add start script
# sed -i "/scripts/ a\ \ \ \ \"dev\": \"parcel index.html\"," package.json

echo "Success! Created $1 at $PWD"
# echo -e "Inside that directory, run the \e[36mnpm start\e[0m command to start the development server."
