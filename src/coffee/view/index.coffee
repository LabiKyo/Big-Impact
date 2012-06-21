class window.View.Index extends Backbone.View
  initialize: =>
    @

  template: Template.index

  render: =>
    @$el.html @template()
    @

  events:
    'click button[type=submit]': 'submit'
    'change input[type=checkbox]': 'toggleAdmin'

  adminUrl: '/AdminLogin'
  fellowUrl: '/MemberLogin'

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
          router.navigate 'admin'
        else
          router.navigate 'activities'
      error: (xhr, status, error) ->
        console.log 'login failed!'
    false
