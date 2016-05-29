module.exports = class Ui extends require('backbone').Model

  defaults:
    user_name: ''
    user_name_href: '#'
    user_name_icon: 'mdi mdi-settings'

    logout_href: '#'
    logout_icon: 'mdi mdi-exit-to-app'
    logout_title: 'Abmelden'

  sync: =>
    # Prevent ajax
