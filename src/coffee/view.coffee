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
#test data
data = 
  "first_name": "John"
  "last_name": "Smith"
  "mail_option": 1
  "mail": "No 18 Buaa"
  "mobile_country_code":"010"
  "mobile":"China Unicom"
  "country":"China"
  "zip":"100191"
  "state":"haidian"
  "city":"Beijing"
  "street":"Xueyuan Road"
  "target":"Education"
  "location":"Buaa"
  "job":"IT"
  "language":"Chinese"
  "gender":0
  "url_token":3123243
  "avatar_path":"http://img.baidu.com/img/iknow/avarta/48/r6s1g6.gif"   
         
class window.View.BasicProfile extends Backbone.View
  template: Template.basicProfile
  editTemplate:Template.editBasicProfile
  events: 
    'click #editBasicProfile':'edit'
    'click .save': 'save'
    'click .cancel': 'cancel'
  render: =>
    console.log 'render basic profile'
    @$el.html @template(data)
    @
  edit: =>
    console.log 'editing the basic profile'
    @$el.html @editTemplate()
    @
  save: =>
    console.log 'save basic profile'
    #获取表单的所有内容
    console.log @$el.children()
      
    @$el.html @template(data);
  cancel: =>
    console.log 'cancel'
    @$el.html @template(data)
  

class window.View.ContactInfo extends Backbone.View
  template: Template.contactInfo
  editTemplate: Template.editContactInfo
  events:
    'click .save': 'save'
    'click .cancel': 'cancel'
    'click #editContactInfo': 'edit'
  render: =>
    console.log 'render contact profile'
    @$el.html @template()
    @
  save: =>
    console.log 'save contact profile'
    @$el.html @template()
    @
  cancel: =>
    console.log 'cancel'
    @$el.html @template()
  edit: =>
    console.log 'edit contantprofile'
    @$el.html @editTemplate()

class window.View.OrgInfo extends Backbone.View
  template: Template.orgInfo
  editTemplate: ''
  render: =>
    console.log 'render your orginfo'
    @$el.html @template(data)
    @
class window.View.ThumnInfo extends Backbone.View
  template:Template.thumbInfo
  render: =>
    console.log 'render your thumbInfo '
    @$el.html @template(data)
    @
    
    
class window.View.Profile extends Backbone.View
  template: Template.profile
  render: =>
    @$el.html @template()
    #init the basic profileview
    window.view.basicProfile = new View.BasicProfile
      el: $ '#basicProfile'
    @basicProfileView = view.basicProfile
    @basicProfileView.render()
    #init the contactprofile view
    window.view.contactInfo = new View.ContactInfo
      el: $ '#contactInfo'
    @contactInfo = view.contactInfo
    @contactInfo.render()
    #init the org info view
    window.view.orgInfo = new View.OrgInfo
      el: $ '#orgInfo'
    @orgInfo = view.orgInfo
    @orgInfo.render()
    #init the thumbinfo view
    window.view.thumbInfo = new View.ThumnInfo
      el: $ '#thunbInfo'
    @thumbInfo = view.thumbInfo
    @thumbInfo.render()
    @

