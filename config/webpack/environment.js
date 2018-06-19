const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.loaders.set("glob", {
  enforce:  "pre",
  exclude:  "/node_modules/",
  test:     /\.js$/,
  use:      "import-glob"
})

environment.plugins.set("Provide",
  new webpack.ProvidePlugin({ swal: "sweetalert2", _: "lodash", moment: "moment", Promise: "bluebird" })
)

environment.plugins.set("",
  new webpack.NormalModuleReplacementPlugin(/es6-promise$/, 'bluebird')
)

module.exports = environment
