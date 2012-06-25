window.View = {}
window.view = {}

class window.View.Layout extends Backbone.View
  el: 'body'
  template: Template.layout
  initialize: =>
    @render()
  render: =>
    @$el.html @template()
    @collection = window.collection.navbar = new Collection.NavBar
    @navbar = window.view.navbar = new View.NavBar @collection
    @message = window.view.message = new View.Message
