class window.View.NavBar extends Backbone.View
  initialize: =>
    @collection = window.collection.navbar = new Collection.NavBar
  template: Template.navbar
  render: =>
    template = @template
      items: @collection.attributes
    @$el.html template
    @

