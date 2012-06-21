class window.View.Admin extends Backbone.View
  initialize: =>
    # TODO: refactoring this: add validation
    @urlRoot = @fellowUrl

  template: Template.admin
  render: =>
    @$el.html @template()

  events:
    'click .admin button[type=submit]': 'submit'
    'change .admin input[type=checkbox]': 'toggleAdmin'

  adminUrl: '/wxy/admin'
  fellowUrl: '/wxy/member'

  # events
  toggleAdmin: (event) =>
    $elem = $ event.currentTarget
    if $elem.val()
      @urlRoot = @adminUrl
    else
      @urlRoot = @fellowUrl

  submit: =>
    data =
      email: $('input[name=email]').val()
    console.log JSON.stringify(data)
    $.ajax '/api' + @urlRoot,
      type: "POST"
      data:
        json: JSON.stringify(data)
      success: (data, status, xhr) ->
        if @urlRoot is @adminUrl
          view.message.success 'User created!'
        else
          view.message.error 'User created failed!'
      error: (xhr, status, error) ->
        console.log 'login failed!'
    false

