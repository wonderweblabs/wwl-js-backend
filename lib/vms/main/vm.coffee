module.exports = class Vm extends require('wwl-js-vm').VM

  getMainViewClass: ->
    require('./views/main_view')

  initialize: (options)->
    super(options)

    @_navigationItemsCollection = options.navigation_items_collection
    @_model = new (require('./models/ui'))({
      logo_src: options.logo_src
      logo_href: options.logo_href
    })

  getNavigationItemsCollection: =>
    @_navigationItemsCollection or= @_buildDefaultNavigationItemsCollection()

  setActiveNavigationItem: (id)=>
    @getNavigationItemsCollection().setActive(id)

  setHeaderVM: (headerVM)=>
    @getView().header.show(headerVM.getView())

  setBodyVM: (bodyVM)=>
    @getView().body.show(bodyVM.getView())

  getMainViewOptions: =>
    {
      context: @context
      vm: @
      model: @_getModel()
    }

  _getModel: =>
    @_model

  _buildDefaultNavigationItemsCollection: =>
    new (require('../../collections/navigation_items_collection'))([{
      id: 'dashboard'
      title: 'Dashboard'
      icon: 'mdi mdi-view-dashboard'
      href: '/dashboard'
      active: true
    }])

