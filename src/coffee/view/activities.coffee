class window.View.Activities extends Backbone.View
  el: '#content'
  initialize: (options) =>
    @render()
    # inject navigation here
    {activity, id} = options
    unless activity?
      return router.navigate 'activities/offer', true
    # TODO: move to router
    view_name = activity[0].toUpperCase() + activity[1..-1] if activity
    if id?
      @current = new View[view_name + 'Detail'] id
    if activity? and not id?
      @current = new View[view_name + 'List']
  template: Template.activities
  render: =>
    @$el.html @template()
