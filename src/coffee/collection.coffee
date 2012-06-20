window.Collection = {}
window.collection = {}

class window.Collection.NavBar extends Backbone.Collection
  model: window.Model.NavBarItem
  initialize: =>
    @add [
      name: 'index'
    ,
      name: 'admin'
    ,
      name: 'activities'
    ,
      name: 'profile'
    ]

  hideAll: =>
    @all (item) =>
      item.hide()

  inactiveAll: =>
    @all (item) =>
      item.inactive()

  findItem: (name) =>
    @find (item) =>
      item.attributes.name is name

  active: (name) =>
    @inactiveAll()
    @show name
    @findItem(name).active()

  show: (name) =>
    @findItem(name).show()

  # items
  index: =>
    @hideAll()
    @active 'index'

  admin: =>
    @hideAll()
    @active 'admin'

  profile: =>
    @hideAll()
    @active 'profile'
    @show 'activities'

  activities: =>
    @hideAll()
    @active 'activities'
    @show 'profile'
