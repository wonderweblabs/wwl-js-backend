Marionette = require('backbone.marionette')

module.exports = class MainView extends Marionette.LayoutView

  template: require('../tpl/main_view.hamlc')

  className: 'wwl-js-backend'
