class window.View.BasicProfile extends Backbone.View
  el: '#basic-profile'
  initialize: (@fellow) =>
    @render()

  # templates
  template: Template.basicProfile
  editTemplate:Template.editBasicProfile

  render: =>
    @$el.html @template(@get_fellow_data())

  # data
  get_fellow_data: =>
    @fellow.toJSON()

  # events
  events:
    'click .edit': 'edit'
    'click .save': 'save'
    'click .cancel': 'cancel'

  edit: (event) =>
    event.preventDefault()
    event.stopPropagation()
    @$el.html @editTemplate(@get_fellow_data())

  save: =>
    data_array = @$('form').serializeArray()
    data = {}
    for field in data_array
      data[field.name] = field.value
    @fellow.save data,
      success: =>
        @$el.html @template(@get_fellow_data())
    false

  cancel: =>
    @$el.html @template(@get_fellow_data())

class window.View.Profile extends Backbone.View
  el: '#content'
  initialize: =>
    @model = window.model.fellow = new Model.Fellow =>
      @render()
  template: Template.profile
  render: =>
    @$el.html @template()
    @basicProfile = new View.BasicProfile @model
