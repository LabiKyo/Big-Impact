window.Model = {}
window.model = {}

class window.Model.NavBarItem extends Backbone.Model
  initialize: (name) =>
    @set 'name', name

  defaults:
    is_show: false
