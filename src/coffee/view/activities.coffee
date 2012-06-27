class window.View.Activities extends Backbone.View
  el: '#content'
  initialize: (options) =>
    @render()
    # inject navigation here
    {activity, id} = options
    unless activity?
      return router.navigate 'activities/offer', true
    view_name = activity[0].toUpperCase() + activity[1..-1] + 'List' if activity
    if activity?
      @current = new View[view_name]
  template: Template.activities
  render: =>
    @$el.html @template()
