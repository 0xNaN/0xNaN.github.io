const path = require('path');

module.exports = {
  mode: 'production',
  entry: './src/script/main.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, '_site/script'),
  },
  module: {
     rules: [
       {
         test: /\.css$/i,
         use: ["style-loader", "css-loader"],
       },
       {
        test: /\.s[ac]ss$/i,
        use: [
          "style-loader",
          "css-loader",
          {
            loader: "sass-loader",
            options: {
              sassOptions: {
                silenceDeprecations: ["legacy-js-api"],
              },
            },
          },
        ],
       },
       {
        test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: '[name].[ext]',
              outputPath: 'fonts/'
            }
          }
        ]
      }
     ],
   },
};
