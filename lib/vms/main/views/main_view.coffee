module.exports = class MainView extends require('backbone.marionette').LayoutView

  template: require('../tpl/main_view.hamlc')

  className: 'wwl-js-backend'

  regions:
    asideNav: 'aside > nav'
    body: '.content > .inside'
    header: 'header'

  onRender: =>
    @asideNav.show(@_getAsideNavView())

    console.log @model

  _getAsideNavView: =>
    @_asideView or= new (require('./aside_nav_view'))({
      collection: @options.vm.getNavigationItemsCollection()
      vm: @options.vm
    })
