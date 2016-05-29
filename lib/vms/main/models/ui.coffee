module.exports = class Ui extends require('backbone').Model

  defaults:
    logo_href: '#'
    logo_src: null

  sync: =>
    # Prevent ajax
