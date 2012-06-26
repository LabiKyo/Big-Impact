class window.View.CreateOfferModal extends Backbone.View
  el: '#modal'
  events:
    'click .save': 'saveOffer'
  template: Template.createOffer
  initialize: =>
    @
  render: =>
    @$el.html @template()
    @$('#createOfferModal').modal('show')
    @
  saveOffer: =>
    data_array = @$('form').serializeArray()
    data = {}
    for field in data_array
      data[field.name] = field.value
    newOffer = new Model.Offer 
    newOffer.save data,
      success: (model,response)=>
        console.log 'success'
        @$('#createOfferModal').modal('hide')
        #刷新页面
        console.log window.router
        window.router.navigate 'activities',
          trigger: true
          replace: true
        window.router.navigate 'offers-recently',
          trigger: true
          replace: true
      error: (model,response)=>
        console.log 'error'
    @
