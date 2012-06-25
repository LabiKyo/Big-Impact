$ ->
  Backbone.emulateJSON = true
  window.view.layout = new View.Layout
  window.router = new Router
  Backbone.history.start()
