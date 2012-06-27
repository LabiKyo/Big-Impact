class window.View.OfferList extends Backbone.View
  template: Template.offerList
  el: '#feedsContent'
  initialize: =>
    @offers = window.collection.offerlist = new Collection.OfferList =>
      @render()
  render: =>
    @$el.html @template
      offers: @offers
