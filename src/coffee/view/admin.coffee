class window.View.Admin extends Backbone.View
  el: '#content'
  template: Template.admin
  initialize: =>
    # TODO: refactoring this: add validation
    @urlRoot = @fellowUrl
    @render()
  render: =>
    @$el.html @template()

  # urls
  adminUrl: '/wxy/admin'
  fellowUrl: '/wxy/member'

  # events
  events:
    'click button[type=submit]': 'submit'
    'change input[type=checkbox]': 'toggleAdmin'

  toggleAdmin: (event) =>
    $elem = $ event.currentTarget
    if $elem.is ':checked'
      @urlRoot = @adminUrl
    else
      @urlRoot = @fellowUrl

  submit: =>
    data =
      email: $('input[name=email]').val()
    $.ajax '/api' + @urlRoot,
      type: "POST"
      data:
        json: JSON.stringify(data)
      success: (data, status, xhr) =>
        if @urlRoot is @adminUrl
          view.message.success 'User created!'
        else
          view.message.error 'User created failed!'
      error: (xhr, status, error) =>
    false
