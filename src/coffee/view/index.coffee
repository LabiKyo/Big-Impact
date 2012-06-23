class window.View.Index extends Backbone.View
  el: '#content'
  template: Template.index
  initialize: =>
    # TODO: refactoring this: add validation
    @urlRoot = @fellowUrl
    @render()
  render: =>
    @$el.html @template()

  # urls
  adminUrl: '/auth/AdminLogin'
  fellowUrl: '/auth/MemberLogin'

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
    $.ajax '/api' + @urlRoot,
      type: 'POST'
      data:
        email: $('input[name=email]').val()
        password: $('input[name=password]').val()
      success: (data, status, xhr) =>
        if @urlRoot is @adminUrl
          router.navigate 'admin', true
          view.message.success 'Login success!'
        else
          router.navigate 'profile', true
          view.message.success 'Login success!'
      error: (xhr, status, error) =>
    false
