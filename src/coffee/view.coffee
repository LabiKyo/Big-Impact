window.View = {}
window.view = {}

class window.View.Layout extends Backbone.View
  template: Template.layout
  render: =>
    @$el.html @template()
    @navbar = window.view.navbar = new View.NavBar
      el: $ 'ul.nav'
    @navbar.render()
    @

class window.View.NavBar extends Backbone.View
  initialize: =>
    @model = window.model.navbar = new Model.NavBar
  template: Template.navbar
  render: =>
    template = @template
      items: @model.attributes
    @$el.html template
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
