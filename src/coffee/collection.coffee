window.Collection = {}
window.collection = {}

class window.Collection.NavBar extends Backbone.Collection
  model: window.Model.NavBarItem
  initialize: =>
    console.log 'init navbar'
