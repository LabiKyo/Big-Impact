class window.View.Activities extends Backbone.View
  initialize: =>
    @render()
  el: 'section#content'
  template: Template.activities
  render: =>
    @$el.html @template()
