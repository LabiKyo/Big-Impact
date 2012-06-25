class window.View.Index extends Backbone.View
  el: '#content'
  template: Template.index
  initialize: =>
    # TODO: refactoring this: add validation
    # dom
    @checkbox = @$ 'input[type=checkbox]'
    @is_admin = @checkbox.is ':checked'
    @render()
  render: =>
    @$el.html @template()


  # url
  urlRoot: '/session'

  # events
  events:
    'click button[type=submit]': 'submit'
    'change input[type=checkbox]': 'toggleAdmin'

  toggleAdmin: (event) =>
    @is_admin = not @is_admin

  submit: (event) =>
    event.preventDefault()
    event.stopPropagation()
    data =
      email: $('input[name=email]').val()
      password: $('input[name=password]').val()
      auth: if @is_admin then '0' else '1'
    $.ajax '/api/v1' + @urlRoot,
      type: 'POST'
      data:
        json: JSON.stringify data
      success: (data, status, xhr) =>
        if @is_admin
          router.navigate 'admin', true
          view.message.success 'Login success!'
        else
          router.navigate 'profile', true
          view.message.success 'Login success!'
      error: (xhr, status, error) =>
        console.log error
