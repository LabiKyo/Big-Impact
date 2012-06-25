Backbone.original_sync = Backbone.sync
Backbone.sync = (method, model, options) ->
  options.url = '/api/v1' + model.url()
  options.data =
    json: JSON.stringify(model.toJSON())
  Backbone.original_sync method, model, options
