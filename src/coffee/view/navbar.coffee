class window.View.NavBar extends Backbone.View
  el: 'ul.nav'
  initialize: (@collection) =>
    @collection.on 'change', @render
    @render()
  template: Template.navbar
  render: =>
    template = @template
      items: @collection.models
    @$el.html template
