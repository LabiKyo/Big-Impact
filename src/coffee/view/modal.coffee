class window.View.Modal extends Backbone.View
  el: '#modal'
  offerTemplate: Template.createOffer
  showOfferModal: (collection)=>
    @offerModel = new View.CreateOfferModal collection
