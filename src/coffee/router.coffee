window.Router = {}

page = (title, callback) ->
  Title = title[0].toUpperCase() + title[1..-1]
  fn = ->
    unless view[title]?
      window.view[title] = new View[Title]
        el: $ 'section#content'
    collection.navbar[title]()
    view[title].render()
    view.navbar.render()
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
  profile: =>
    unless view.profile?
      window.view.profile = new View.Profile
        el: $ 'section#content'
    collection.navbar.profile()
    view.navbar.render()
    unless model.currentFellow?
      window.model.currentFellow = new Model.Fellow =>
        view.profile.render()
