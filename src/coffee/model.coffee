window.Model = {}
window.model = {}

class window.Model.NavBarItem extends Backbone.Model
  upperName: =>
    name = @get_name()
    name[0] + name[1..-1]

  get_name: =>
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
  urlRoot: '/fellow/'
  idAttribute: 'url_token'
  initialize: (callback) =>
    @fetch
      success: callback?()
      error: =>
        console.log 'error'


class window.Model.Offer extends Backbone.Model
  idAttribute: 'url_token'
  urlRoot: '/offer'
  initialize: (callback) =>
    @fetch 
      success: callback?()
      error : =>
        console.log 'error'
