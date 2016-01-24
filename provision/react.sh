#!/usr/bin/env bash

echo "Installing react"

cd /vagrant

echo "  creating package.json"
rm -f package.json
npm init --force >/dev/null 2>&1

echo "  installing react"
npm install react --save >/dev/null 2>&1

echo "  installing react-dom"
npm install react-dom --save >/dev/null 2>&1

echo "  installing redux"
npm install redux --save >/dev/null 2>&1

echo "  installing react-redux"
npm install react-redux --save >/dev/null 2>&1

echo "  installing lodash"
npm install lodash --save >/dev/null 2>&1

# the core logic of Babel
echo "  installing babel-core"
npm install babel-core --save-dev >/dev/null 2>&1

# You can use Babel with Webpack easily
echo "  installing babel-loader"
npm install babel-loader --save-dev >/dev/null 2>&1

# Out of the box Babel doesn't do anything.
# In order to actually do anything to your code you need to enable plugins.
# There are two types of plugins: syntax and transform.
# Syntax allow Babel to parse additional syntax whereas transform apply transformations.
# This way the code that is using future syntax can get transformed back to JavaScript older environments can understand.
# To make it easier to consume plugins, Babel supports the concept of presets.
# Each preset comes with a set of plugins so you don't have to wire them up separately.

echo "  installing babel-preset-es2015"
npm install babel-preset-es2015 --save-dev >/dev/null 2>&1

echo "  installing babel-preset-react"
npm install babel-preset-react --save-dev >/dev/null 2>&1

echo "  installing babel-preset-stage-1"
npm install babel-preset-stage-1 --save >/dev/null 2>&1

# You could pass Babel settings through Webpack (i.e., babel?presets[]=react,presets[]=es2015),
# but then it would be just for Webpack only.
# That's why we are going to push our Babel settings to this specific dotfile.

echo "  installing .babelrc"
cat > .babelrc << EOF
{
  "presets": ["react", "es2015", "stage-1"]
}
EOF

echo "  installing webpack.config.js"
cat > webpack.config.js << EOF
module.exports = {
  entry: [
    './app/index.js'
  ],
  output: {
    path: __dirname + "/public",
    publicPath: '/',
    filename: 'bundle.js'
  },
  module: {
    loaders: [{
      exclude: /node_modules/,
      loader: 'babel'
    }]
  },
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  devServer: {
    historyApiFallback: true,
    contentBase: './public',
    host: '192.168.33.60',
    port: 3000
  }
};
EOF

echo "  installing index.html"
mkdir -p public
cat > public/index.html << EOF
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="/style/style.css">
  </head>
  <body>
    <div class="container"></div>
  </body>
  <script src="/bundle.js"></script>
</html>
EOF

mkdir -p app

mkdir -p app/actions
touch app/actions/index.js

mkdir -p app/components
cat > app/components/app.js << EOF
import React from 'react';
import { Component } from 'react';

export default class App extends Component {
  render() {
    return (
      <div>React simple starter</div>
    );
  }
}
EOF

mkdir -p app/reducers
cat > app/reducers/index.js << EOF
import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  state: (state = {}) => state
});

export default rootReducer;
EOF

cat > app/index.js << EOF
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';

import App from './components/app';
import reducers from './reducers';

const createStoreWithMiddleware = applyMiddleware()(createStore);

ReactDOM.render(
  <Provider store={createStoreWithMiddleware(reducers)}>
    <App />
  </Provider>
  , document.querySelector('.container'));
EOF

mkdir -p public/style
echo > public/style/style.css

echo "react installed"
