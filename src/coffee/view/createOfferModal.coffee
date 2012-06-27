class window.View.CreateOfferModal extends Backbone.View
  el: '#modal'
  template: Template.createOffer
  initialize: (@offers) =>
    @render()
  render: =>
    @$el.html @template()
    @$('#createOfferModal').modal('show')

  # events
  events:
    'click .save': 'saveOffer'

  saveOffer: (callback) =>
    data_array = @$('form').serializeArray()
    data = {}
    for field in data_array
      data[field.name] = field.value
    newOffer = @offers.create data,
      success: (model, response)=>
        @undelegateEvents()
        @$('#createOfferModal').modal('hide')
      error: (model, response)=>
        console.log 'error'
