window.View = {}
window.view = {}
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

class window.View.Feed extends Backbone.View
  template: Template.feed
  render: =>
    console.log 'render feed', @template()
    @$el.html @template()
    @

$ ->
  window.view.index = new View.Index
    el: $ 'section#application'
  window.view.profile = new View.Profile
    el: $ 'section#application'
  window.view.feed = new View.Feed
    el: $ 'section#application'
