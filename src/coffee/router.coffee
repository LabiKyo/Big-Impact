window.Router = {}

class window.Router.App extends Backbone.Router
  routes:
    '': 'index'
    'activities': 'activities'
    'admin': 'admin'
    'profile': 'profile'

  index: =>
    unless view.index?
      window.view.index = new View.Index
        el: $ 'section#content'
    model.navbar.index()
    view.index.render()

  activities: =>
    unless view.activities?
      window.view.activities = new View.Activities
        el: $ 'section#content'
    model.navbar.activities()
    view.activities.render()

  admin: =>
    unless view.admin?
      window.view.admin = new View.Admin
        el: $ 'section#content'
    model.navbar.admin()
    view.admin.render()

  profile: =>
    unless view.profile?
      window.view.profile = new View.Profile
        el: $ 'section#content'
    model.navbar.profile()
    view.profile.render()
