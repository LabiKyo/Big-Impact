$ ->
  Backbone.emulateJSON = true
  window.view.layout = new View.Layout
    el: $ 'body'
  view.layout.render()

  window.router = new Router.App
  Backbone.history.start()
