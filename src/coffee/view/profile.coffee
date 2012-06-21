class window.View.BasicProfile extends Backbone.View
  template: Template.basicProfile
  editTemplate:Template.editBasicProfile
  events:
    'click #basicProfile #editBasicProfile': 'edit'
    'click #basicProfile .save': 'save'
    'click #basicProfile .cancel': 'cancel'
  fellow: =>
    model.currentFellow.toJSON()
  render: =>
    console.log 'render basic profile'
    @$el.html @template(@fellow())
    @
  edit: (event) =>
    console.log 'editing the basic profile'
    @$el.html @editTemplate(@fellow())
    event.preventDefault()

  save: =>
    console.log 'save basic profile'
    #获取表单的所有内容
    console.log @$el.children()
    @$el.html @template(@fellow())

  cancel: =>
    console.log 'cancel'
    @$el.html @template(@fellow())

class window.View.Profile extends Backbone.View
  initialize: =>
    @model = model.currentFellow
  template: Template.profile
  render: =>
    @$el.html @template()
    #init the basic profileview
    window.view.basicProfile = new View.BasicProfile
      el: $ '#basicProfile'
    @basicProfileView = view.basicProfile
    @basicProfileView.render()
