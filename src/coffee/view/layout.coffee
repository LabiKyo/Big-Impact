class window.View.Layout extends Backbone.View
  template: Template.layout
  render: =>
    @$el.html @template()
    @navbar = window.view.navbar = new View.NavBar
      el: $ 'ul.nav'
    @navbar.render()
    @


