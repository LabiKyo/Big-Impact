class window.View.Modal extends Backbone.View
  el: '#modal'
  offerTemplate: Template.createOffer
  initialize: =>
    @
  showOfferModal: (callback)=>
    @offerModel?= new View.CreateOfferModal
    console.log 'show offer modal'
    @offerModel.render()
    callback?()
    @
