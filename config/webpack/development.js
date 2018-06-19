const environment = require("./environment")

const WebpackNotifierPlugin = require("webpack-notifier")

environment.plugins.set("Notifier", new WebpackNotifierPlugin())

module.exports = environment.toWebpackConfig()
