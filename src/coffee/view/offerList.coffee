class window.View.OfferList extends Backbone.View
  template: Template.offerList
  el: '#feedsContent'
  initialize: =>
    @offers = window.collection.offerlist = new Collection.OfferList =>
      @render()
    @offers.on 'remove', (offer, offers) =>
      offer.destroy
        success: =>
          @render()
          view.message.success 'Delete offer success!'
        error: =>
          console.log 'remove failed'
    @offers.on 'change removed', (events) =>
      console.log 're-render', events
      @render()
  render: =>
    @$el.html @template
      offers: @offers

  # events
  events:
    'click button.create': 'createOffer'
    'click button.close': 'removeOffer'
    'click a.more': 'loadMore'

  createOffer: (event) =>
    view.modal.showOfferModal @offers
    false

  removeOffer: (event) =>
    $offer = $(event.currentTarget).closest('.item')
    @offers.remove @offers.get($offer.data('id'))

  loadMore: (event) =>
    @offers.loadMore()
    false
