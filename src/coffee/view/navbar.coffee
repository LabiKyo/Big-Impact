class window.View.NavBar extends Backbone.View
  el: 'ul.nav'
  initialize: =>
    @collection = window.collection.navbar = new Collection.NavBar
    @collection.on 'change', @render
    @render()
  template: Template.navbar
  render: =>
    template = @template
      items: @collection.models
    @$el.html template
