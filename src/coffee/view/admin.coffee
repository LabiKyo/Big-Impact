class window.View.Admin extends Backbone.View
  template: Template.admin
  render: =>
    @$el.html @template()
    @

