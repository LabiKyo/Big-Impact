should = require 'should'
exports = module.exports = ->
  @World = require('../support/world').World

  @When /I uncheck I'm admin checkbox/, (callback) ->
    @browser.uncheck('isAdmin', callback)
