module.exports = class Vm extends require('wwl-js-vm').VM

  getMainViewClass: ->
    require('./views/main_view')

  initialize: (options)->
    super(options)

    @model = new (require('./models/ui'))({
      user_name: options.user_name,
      user_name_href: @options.user_name_href
    })

  getMainViewOptions: =>
    {
      vm: @
      context: @context
      model: @model
    }

