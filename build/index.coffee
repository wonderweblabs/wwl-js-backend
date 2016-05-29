require('webcomponentsjs/webcomponents')

global.$                          = require('jquery')
global.jquery                     = global.jQuery = global.$
global._                          = require 'underscore'
global.underscore                 = global._
global.Backbone                   = require 'backbone'
global.backbone                   = global.Backbone
global.Backbone.$                 = $

domready    = require 'domready'
wwlContext  = require 'wwl-js-app-context'

domready ->
  context = new (wwlContext)({ root: true })

  tester = new (require('wwl-js-vm')).Tester({

    domElementId: 'wwl-js-vm-tester-container'

    config:
      getDefaultVMConfig: ->
        context: context
        navigation_items_collection: new (require('../lib/collections/navigation_items_collection'))([{
            id: 'dashboard'
            title: 'Dashboard'
            icon: 'mdi mdi-view-dashboard'
            href: '#/dashboard'
            active: true
          },{
            id: 'home'
            title: 'Home'
            href: '#/home'
            icon: 'mdi mdi-view-home'
            active: false
          }])

    vmConfig: _.extend({

      beforeStart: (vm, moduleConfig) ->
        vm.getView().triggerMethod 'attach'
        vm.getView().triggerMethod 'show'

      afterStart: (vm, moduleConfig) ->
        window.vm = vm

        Backbone.listenTo vm, 'click', (event, model, vm)=>
          console.log 'click', model.id
          vm.setActiveNavigationItem(model.id)

        vm.setHeaderVM(
          new (require('../lib/vms/header/vm'))({
            context: context,
            user_name: 'Niels Wonderweblabs'
            user_name_href: '#/test'
          })
        )

      vmPrototype: require('../lib/vms/main/vm')

    }, require('./vm_config'))

  }).run()
