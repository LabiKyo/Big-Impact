page = (cls, callback) ->
  fn = ->
    @current?.undelegateEvents()
    @current = new View[cls]
    callback?()

class window.Router extends Backbone.Router
  initialize: =>
    # TODO: add session filter
    @navbar = collection.navbar
    @on 'route:index', @navbar.index
    @on 'route:admin', @navbar.admin
    @on 'route:profile', @navbar.profile
    @on 'route:activities', @navbar.activities

  routes:
    '': 'index'
    'activities': 'activities'
    'admin': 'admin'
    'profile': 'profile'

  index: page 'Index'
  activities: page 'Activities'
  admin: page 'Admin'
  profile: page 'Profile'
