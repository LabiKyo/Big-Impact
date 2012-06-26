Backbone.original_sync = Backbone.sync
Backbone.sync = (method, model, options) ->
  options.url = '/api/v1' + model.url()
  #read时的query String 有问题
  if method isnt 'read'
    if options.data
      options.data = _clone options.data
    else
      options.data = {}
    data = 
      json: JSON.stringify model.toJSON()
    _.extend options.data, data   
  Backbone.original_sync method, model, options
