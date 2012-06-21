window.Model = {}
window.model = {}

class window.Model.NavBarItem extends Backbone.Model
  upperName: =>
    name = @name()
    name[0] + name[1..-1]

  name: =>
    @attributes.name

  is_show: =>
    @attributes.is_show

  show: =>
    @set 'is_show', true

  hide: =>
    @set 'is_show', false

  is_active: =>
    @attributes.is_active

  active: =>
    @set 'is_active', true

  inactive: =>
    @set 'is_active', false

class window.Model.Fellow extends Backbone.Model
  urlRoot: '/ht/thisMember/'
  validate: =>
    return
  initialize: (callback) =>
    @fetch
      success: callback
      error: =>
        console.log 'error'
