class window.View.BasicProfile extends Backbone.View
  el: '#basicProfile'
  initialize: =>
    @render()
  template: Template.basicProfile
  editTemplate:Template.editBasicProfile
  events:
    'click #basicProfile #editBasicProfile': 'edit'
    'click #basicProfile .save': 'save'
    'click #basicProfile .cancel': 'cancel'
  fellow: =>
    model.currentFellow.toJSON()
  render: =>
    @$el.html @template(@fellow())
  edit: (event) =>
    @$el.html @editTemplate(@fellow())
    event.preventDefault()

  save: =>
    #获取表单的所有内容
    @$el.html @template(@fellow())

  cancel: =>
    @$el.html @template(@fellow())

class window.View.Profile extends Backbone.View
  el: 'section#content'
  initialize: =>
    @model = window.model.currentFellow = new Model.Fellow =>
      @render()
  template: Template.profile
  render: =>
    @$el.html @template()
    @basicProfile = window.view.basicProfile = new View.BasicProfile
    @basicProfileView = view.basicProfile
