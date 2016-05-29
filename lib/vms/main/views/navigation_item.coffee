module.exports = class NavigationItem extends require('backbone.marionette').ItemView

  tagName: 'li'
  template: require('../tpl/navigation_item.hamlc')

  events:
    'click a': 'onLinkClick'

  modelEvents:
    'change:active': 'onActiveChange'

  onRender: =>
    @_assignActiveClass()

  onLinkClick: (event)=>
    @options.vm.trigger('click', event, @model, vm)

  onActiveChange: =>
    @_assignActiveClass()

  _assignActiveClass: =>
    if @model.get('active') == true
      @$el.addClass('active')
    else
      @$el.removeClass('active')
