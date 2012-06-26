class window.View.CreateOfferModal extends Backbone.View
  el: '#modal'
  template: Template.createOffer
  render: =>
    $el.html @template()
    $ '#createNeedModal'
      .modal()
