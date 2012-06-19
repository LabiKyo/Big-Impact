window.Router = {}

class window.Router.App extends Backbone.Router
  routes:
    '': 'index'
    'profile': 'profile'

  index: =>
    console.log 'router: index'
    unless view.index?
      window.view.index = new View.Index
        el: $ 'section#content'
    view.index.render()

  profile: =>
    console.log 'router: profile'
    unless view.profile?
      window.view.profile = new View.Profile
        el: $ 'section#content'
    view.profile.render()
