module.exports = class Vm extends require('wwl-js-vm').VM

  getMainViewClass: ->
    require('./views/main_view')
