class window.View.Modal extends Backbone.View
  el: '#modal'
  offerTemplate: Template.createOffer
  initialize: =>
    @
  createOfferModel:=>
    @$el.html @offerTemplate()
    @$('#createOfferModal').modal('show')
    @
