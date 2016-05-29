module.exports = class Vm extends require('wwl-js-vm').VM

  getMainViewClass: ->
    require('./views/main_view')

  initialize: (options)->
    super(options)

    @_navigationItemsCollection = options.navigation_items_collection

  getNavigationItemsCollection: =>
    @_navigationItemsCollection or= @_buildDefaultNavigationItemsCollection()

  setActiveNavigationItem: (id)=>
    @getNavigationItemsCollection().setActive(id)

  setHeaderVM: (headerVM)=>
    @getView().header.show(headerVM.getView())

  setBodyVM: (bodyVM)=>
    @getView().body.show(bodyVM.getView())

  _buildDefaultNavigationItemsCollection: =>
    new (require('../../collections/navigation_items_collection'))([{
      id: 'dashboard'
      title: 'Dashboard'
      icon: 'mdi mdi-view-dashboard'
      href: '/dashboard'
      active: true
    }])

  getMainViewOptions: =>
    {
      context: @context
      vm: @
    }

