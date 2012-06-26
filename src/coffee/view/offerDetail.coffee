class window.View.OfferDetail extends Backbone.View
  el: '#feedsContent'
  template: Template.offerDetail
  initialize: (offer_id,callback)=>
    @offer = new Model.Offer
    @offer.fetch
      success: =>
        console.log @offer.toJSON()
        @render()
      error: =>
        console.log 'error'
      data: =>
        offer_id: offer_id
    callback?()
    @
  render: =>
    @$el.html @template()
    @
