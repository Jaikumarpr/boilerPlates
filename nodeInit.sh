npm init -y
npm install express body-parser cookie-parser axios winston xml2js passport express-session morgan cors path-to-regexp dotenv
npm install -D @babel/cli @babel/core @babel/preset-env chai mocha nodemon prettier eslint eslint-plugin-prettier eslint-config-prettier eslint-plugin-node eslint-config-node
npx install-peerdeps --dev eslint-config-airbnb
mkdir src
touch src/index.js
touch .babelrc
touch .prettierrc
touch .eslintrc.json

touch startDel.js

echo "var fs = require('fs');
const package = require('./package.json');
package['scripts'] = {
\"start\": \"npm run build && npx nodemon ./dist/index.js\",
\"clean\": \"rm -rf ./dist\",
\"build\": \"npm run clean && npx babel src -d dist\"
}


fs.writeFile(\"package.json\", JSON.stringify(package), function(err) {
if (err) {
console.log(err);
}
});" >> startDel.js

node startDel.js
rm startDel.js

npm install

echo "import express from 'express'
const app = express();
const port = 3000;
app.get('/', (req, res) => res.send('Hello World'));
app.listen(port, () => console.log(\`Example app listening at http:// localhost:{port}\`)" >> src/index.js

echo "{
    \"presets\":[
        \"@babel/preset-env\"
    ]
}" >> .babelrc

echo "{
    \"singleQuote\": true
}" >> .prettierrc

echo "{
    \"extends\": [\"airbnb\", \"prettier\", \"plugin:node/recommended\"],
    \"plugins\": [\"prettier\"],
    \"rules\":{
        \"prettier/prettier\": \"error\",
        \"no-unused-vars\": \"warn\",
        \"no-console\": \"off\",
        \"func-names\": \"off\",
        \"no-process-exit\": \"off\",
        \"object-shorthand\": \"off\",
        \"class-methods-use-this\": \"off\"
    }
}" >> .eslintrc.json