module.exports = class MainView extends require('backbone.marionette').LayoutView

  template: require('../tpl/main_view.hamlc')

  ui:
    userName: '.user-name'

  events:
    'click @ui.userName': 'onUserNameClick'

  onUserNameClick: (event)=>
    @options.vm.trigger('click:userName', event, vm)
