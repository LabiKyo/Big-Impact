window.View = {}
window.view = {}

class window.View.Layout extends Backbone.View
  el: 'body'
  template: Template.layout
  initialize: =>
    @render()
  render: =>
    @$el.html @template()
    @navbar = window.view.navbar = new View.NavBar
    @message = window.view.message = new View.Message
