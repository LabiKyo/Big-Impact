window.View = {}
window.view = {}

class window.View.Layout extends Backbone.View
  template: Template.layout
  render: =>
    console.log 'render layout', @template()
    @$el.html @template()
    @

class window.View.Index extends Backbone.View
  template: Template.index
  render: =>
    console.log 'render index', @template()
    @$el.html @template()
    @

class window.View.Profile extends Backbone.View
  template: Template.profile
  render: =>
    console.log 'render profile', @template()
    @$el.html @template()
    @

$ ->
  window.view.layout = new View.Layout
    el: $ 'body'
  view.layout.render()
