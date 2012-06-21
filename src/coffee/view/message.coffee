class window.View.Message extends Backbone.View
  initialize: =>
    @
  template: Template.message
  events:
    'click #message .close': 'close'

  close: (event) =>
    $elem = $ event.currentTarget
    $elem.closest('.alert').remove()

  alert: (type, message) =>
    mapping =
      warning: 'Warning! '
      error: 'Error! '
      success: 'Success! '
      info: 'Info: '
    title = mapping[type]
    html = @template
      type: type
      message: message
      title: title
    console.log  html
    @$el.append html

  warning: (message) =>
    @alert 'warning', message
  error: (message) =>
    @alert 'error', message
  info: (message) =>
    @alert 'info', message
  success: (message) =>
    @alert 'success', message
