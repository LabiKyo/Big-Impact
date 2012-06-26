class window.View.OffersList extends Backbone.View
  template: Template.offerList
  el: '#feedsContent'
  initialize: =>
    @offers= new Collection.OfferList
    @render()
    @
  render: =>
    #@$el.html @template(@offers.toJSON())
    @
