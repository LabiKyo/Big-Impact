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
    alert 'save'
