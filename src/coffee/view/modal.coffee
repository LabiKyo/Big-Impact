class window.View.Modal extends Backbone.View
  el: '#modal'
  offerTemplate: Template.createOffer
  initialize: =>
    @
  showOfferModal:=>
    @offerModel?= new View.CreateOfferModal
    console.log 'show offer modal'
    @offerModel.render()
    @
