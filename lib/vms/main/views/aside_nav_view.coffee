module.exports = class AsideNavView extends require('backbone.marionette').CollectionView
  tagName: 'ul'
  childView: require('./navigation_item')

  childViewOptions: (model, index)=>
    {
      model: model
      index: index
      vm: @options.vm
    }
