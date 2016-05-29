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
  tester = new (require('wwl-js-vm')).Tester({

    domElementId: 'wwl-js-vm-tester-container'

    config:
      getDefaultVMConfig: ->
        context: new (wwlContext)({ root: true })

    vmConfig: _.extend({

      beforeStart: (vm, moduleConfig) ->
        vm.getView().triggerMethod 'attach'
        vm.getView().triggerMethod 'show'

      afterStart: (vm, moduleConfig) ->
        window.vm = vm
        console.log 'VM', vm

      vmPrototype: require('../lib/vm')

    }, require('./vm_config'))

  }).run()
