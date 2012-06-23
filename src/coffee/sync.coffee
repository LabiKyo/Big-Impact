Backbone.sync = (method, model, options) ->
  urlRoot = '/api'
  switch method
    when 'create'
      $.post urlRoot + model.urlRoot, model.toJSON(), options.success
    when 'read'
      $.getJSON urlRoot + model.urlRoot, options.success
