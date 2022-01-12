// Generated using webpack-cli https://github.com/webpack/webpack-cli

const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const WorkboxWebpackPlugin = require('workbox-webpack-plugin');

const isProduction = process.env.NODE_ENV == 'production';
const MomentLocalesPlugin = require('moment-locales-webpack-plugin');

const PATHS = {
    html: path.join( __dirname, './src/' ),
};



const config = {
    entry: './src/js/index.js',
    output: {
        path: path.resolve(__dirname, 'dist'),
        publicPath: './static/',
        filename: "js/[name].js",
	assetModuleFilename: 'images/[hash][ext][query]',
	clean: true,
    },
    optimization: {
      minimize: true,
      splitChunks: {
        minSize: 100000,
        maxSize: 300000,
        usedExports: true,
        cacheGroups: {
          vendor: {
            test: /[\\/]node_modules[\\/]/,
            name: 'vendors',
            chunks: 'all',
          },
        },
      },
    },
    devServer: {
        open: true,
        host: 'localhost',
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: PATHS.html+'/index.html',
            image_path: PATHS.images,	
        }),
        new MomentLocalesPlugin({
            localesToKeep: ['es-us', 'ru'],
        }),

        // Add your plugins here
        // Learn more about plugins from https://webpack.js.org/configuration/plugins/
    ],
    module: {
        rules: [
            {
                test: /\.(eot|svg|ttf|woff|woff2|png|jpg|gif|ico)$/i,
                type: 'asset/resource',
            },

           {
		test: /\.css$/,
		use: [
		  // [style-loader](/loaders/style-loader)
		  { loader: 'style-loader' },
		  // [css-loader](/loaders/css-loader)
		  {
		    loader: 'css-loader',
		    options: {
		      modules: true
		    }
		  },
		  // [sass-loader](/loaders/sass-loader)
		  { loader: 'sass-loader' }
		]
	   },
            // Add your rules for custom modules here
            // Learn more about loaders from https://webpack.js.org/loaders/
        ],
    },
};

module.exports = () => {
    if (isProduction) {
        config.mode = 'production';
        
        
        config.plugins.push(new WorkboxWebpackPlugin.GenerateSW());
        
    } else {
        config.mode = 'development';
    }
    return config;
};
