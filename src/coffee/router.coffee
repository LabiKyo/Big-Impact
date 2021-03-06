window.page = (cls, options, callback) ->
  fn = ->
    @current?.undelegateEvents()
    @current = new View[cls] options
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
    'activities/:activity': 'activities'
    'activities/:activity/:id': 'activities'
    'admin': 'admin'
    'profile': 'profile'
    'offers/:offer_id': 'offerDetail'

  #page 之间有依赖项，所以应依赖渲染
  index: page 'Index'
  activities: (activity, id) ->
    fn = page 'Activities',
      activity: activity
      id: id
    ,->
      ''
    fn()
  admin: page 'Admin'
  profile: page 'Profile'
  offerDetail: (offer_id) =>
    new window.View.OfferDetail offer_id
