class window.View.Message extends Backbone.View
  el: '#message'
  template: Template.message

  # mapping
  mapping:
    warning: 'Warning! '
    error: 'Error! '
    success: 'Success! '
    info: 'Info: '

  # events
  events:
    'click .close': 'close'

  close: (event) =>
    $alert = $(event.currentTarget).closest('.alert')
    $alert.fadeOut =>
      $alert.remove()

  # UI utils
  alert: (type, message) =>
    title = @mapping[type]
    html = @template
      type: type
      message: message
      title: title
    $alert = $ html
    @$el.append($alert)
    $alert.fadeIn()

  warning: (message) =>
    @alert 'warning', message
  error: (message) =>
    @alert 'error', message
  info: (message) =>
    @alert 'info', message
  success: (message) =>
    @alert 'success', message
