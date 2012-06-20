window.Model = {}
window.model = {}

class window.Model.NavBar extends Backbone.Model
  initialize: =>
    @hideAll()
    @on 'change', =>
      view.navbar.render()
  defaults:
    activities:
      name: 'Activities'
    admin:
      name: 'Admin'
    index:
      name: 'Index'
    profile:
      name: 'Profile'

  hideAll: =>
    for k,v of @attributes
      @set k,
        is_active: false
        is_show: false
        name: v.name

  index: =>
    @hideAll()
    @set
      index:
        is_active: true
        is_show: true
        name: 'Index'

  admin: =>
    @hideAll()
    @set
      admin:
        is_active: true
        is_show: true
        name: 'Admin'

  activities: =>
    @hideAll()
    @set
      activities:
        is_active: true
        is_show: true
        name: 'Activities'
      profile:
        is_active: false
        is_show: true
        name: 'Profile'

  profile: =>
    @hideAll()
    @set
      activities:
        is_active: false
        is_show: true
        name: 'Activities'
      profile:
        is_active: true
        is_show: true
        name: 'Profile'
