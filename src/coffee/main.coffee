$ ->
  Backbone.emulateJSON = true
  Backbone.sync = (method, model, options) ->
    console.log 'sync', model.isValid()
    urlRoot = '/api'
    switch method
      when 'create'
        $.getJSON urlRoot + model.urlRoot, model.toJSON(), options.success
  #加载model
  window.model.currentFellow = new Model.Fellow();
  
  window.view.layout = new View.Layout
    el: $ 'body'
  view.layout.render()

  window.router = new Router.App
  Backbone.history.start()
