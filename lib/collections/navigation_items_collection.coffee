module.exports = class NavigationItemsCollection extends require('backbone').Collection

  model: require('../models/navigation_item')

  sync: =>
    # Prevent ajax

  setActive: (id)=>
    return unless @get(id)?

    ids = _.map @where({active: true}), (model)->
      model.id

    data = _.map ids, (id)->
      {id: id, active: false}

    data.push({id: id, active: true})

    @add(data, {merge: true})
    @
