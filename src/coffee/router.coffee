window.Router = {}

class window.Router.App extends Backbone.Router
  routes:
    '': 'index'
    'profile': 'profile'
    'feed': 'feed'

  index: =>
    console.log 'router: index'
    window.view.index.render()

  profile: =>
    console.log 'router: profile'
    window.view.profile.render()

  feed: =>
    console.log 'router: feed'
    window.view.feed.render()
