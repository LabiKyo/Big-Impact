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
    $.ajax '/api' + @urlRoot,
      data:
        email: $('input[name=email]').val()
        password: $('input[name=password]').val()
      success: (data, status, xhr) ->
        if @urlRoot is @adminUrl
          # TODO: alert success
        else
          # TODO: alert fail
      error: (xhr, status, error) ->
        console.log 'login failed!'
    false

