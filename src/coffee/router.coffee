window.Router = {}

page = (title, callback) ->
  Title = title[0].toUpperCase() + title[1..-1]
  fn = ->
    unless view[title]?
      window.view[title] = new View[Title]
        el: $ 'section#content'
      model.navbar[title]()
      view[title].render()
      callback?()

  fn

class window.Router.App extends Backbone.Router
  routes:
    '': 'index'
    'activities': 'activities'
    'admin': 'admin'
    'profile': 'profile'

  index: page 'index'
  activities: page 'activities'
  admin: page 'admin'
  profile: page 'profile'
