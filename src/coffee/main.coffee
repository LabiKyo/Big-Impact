$ ->
  Backbone.emulateJSON = true
  window.view.layout = new View.Layout
  window.router = new Router
  Backbone.history.start()

  window.reset = (callback) ->
    $.post '/api/v1/reset', ->
      callback?()
