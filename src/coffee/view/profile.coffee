class window.View.Profile extends Backbone.View
  template: Template.profile
  render: =>
    @$el.html @template()
    @

