Backbone.sync = (method, model, options) ->
  console.log 'sync', model.isValid()
  urlRoot = '/api'
  switch method
    when 'create'
      $.getJSON urlRoot + model.urlRoot, model.toJSON(), options.success
    when 'read'
      $.getJSON urlRoot + model.urlRoot, options.success
