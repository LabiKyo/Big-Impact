class window.View.Activities extends Backbone.View
  template: Template.activities
  render: =>
    @$el.html @template()
    @

