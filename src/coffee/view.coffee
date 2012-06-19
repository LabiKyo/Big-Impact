window.View = {}
window.view = {}

class window.View.Layout extends Backbone.View
  template: Template.layout
  render: =>
    @$el.html @template()
    @

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

  # events
  toggleAdmin: (event) =>
    $elem = $ event.currentTarget
    if $elem.val()
      @urlRoot = '/auth/admin'
    else
      @urlRoot = '/auth/fellow'

  submit: =>
    $.ajax '/api' + @urlRoot,
      data:
        email: $('input[name=email]').val()
        password: $('input[name=password]').val()
      success: (data, status, xhr) ->
        if @urlRoot is '/auth/admin'
          router.navigate 'admin'
        else
          router.navigate 'activities'
      error: (xhr, status, error) ->
        console.log 'save failed!'
    false

class window.View.Activities extends Backbone.View
  template: Template.activities
  render: =>
    console.log @$el
    @$el.html @template()
    @

class window.View.Admin extends Backbone.View
  template: Template.admin
  render: =>
    @$el.html @template()
    @

class window.View.Profile extends Backbone.View
  template: Template.profile
  render: =>
    @$el.html @template()
    @

class window.View.editProfile extends Backbone.View
  template:Template.editProfile
  render: =>
    console.log 'render profile', @template()
    @$el.html @template()
    @

$ ->
  window.view.layout = new View.Layout
    el: $ 'body'
  view.layout.render()
