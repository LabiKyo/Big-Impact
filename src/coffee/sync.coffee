Backbone.original_sync = Backbone.sync
Backbone.sync = (method, model, options) ->
  options.url = '/api/v1' + model.url()
  if method isnt 'read' # create, update or delete
    options.data = if options.data? then _.clone(options.data) else {}
    data =
      json: JSON.stringify model.toJSON()
    _.extend options.data, data
  Backbone.original_sync method, model, options
