Backbone.sync = (method, model, options) ->
  urlRoot = '/api/v1'
  switch method
    when 'create'
      $.post urlRoot + model.urlRoot, model.toJSON(), options.success
    when 'update'
      $.ajax urlRoot + model.urlRoot,
        data: model.toJSON()
        succuess: options.success
        type: 'PUT'
    when 'read'
        $.getJSON urlRoot + model.urlRoot, options.success
    when 'delete'
      $.ajax urlRoot + model.urlRoot
        data: model.toJSON()
        success: options.success
        type: 'DELETE'
