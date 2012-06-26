class window.View.Activities extends Backbone.View
  el: '#content'
  initialize: =>
    @render()
  template: Template.activities
  render: =>
    @$el.html @template()
