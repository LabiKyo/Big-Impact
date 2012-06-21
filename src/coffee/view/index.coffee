class window.View.Index extends Backbone.View
  initialize: =>
    # TODO: refactoring this: add validation
    @urlRoot = @fellowUrl

  template: Template.index

  render: =>
    @$el.html @template()

  events:
    'click .login button[type=submit]': 'submit'
    'change .login input[type=checkbox]': 'toggleAdmin'

  adminUrl: '/auth/AdminLogin'
  fellowUrl: '/auth/MemberLogin'

  # events
  toggleAdmin: (event) =>
    $elem = $ event.currentTarget
    if $elem.val()
      @urlRoot = @adminUrl
    else
      @urlRoot = @fellowUrl

  submit: =>
    $.ajax '/api' + @urlRoot,
      type: 'POST'
      data:
        email: $('input[name=email]').val()
        password: $('input[name=password]').val()
      success: (data, status, xhr) =>
        console.log @urlRoot, @adminUrl
        if @urlRoot is @adminUrl
          router.navigate 'admin', trigger: true
          view.message.success 'Login success!'
        else
          router.navigate 'profile', trigger: true
          view.message.success 'Login success!'
      error: (xhr, status, error) =>
        console.log 'login failed!', error
    false
