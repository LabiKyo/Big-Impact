should = require 'should'
{inspect} = require 'util'
exports = module.exports = ->
  @World = require('../support/world').World

  @Given /I am on index page/, (callback) ->
    @visit '#', =>
      @browser.location._url.href.should.eql @site + '#'
      callback()

  @Then /I should see Login form/, (callback) ->
    @browser.text('legend').should.eql 'Login'
    callback()

  @Then /I should see (.+) field/, (field, callback) ->
    @browser.field(field.toLowerCase()).should.ok
    callback()

  @Then /I should see I'm admin checkbox/, (callback) ->
    @browser.field('isAdmin').should.ok
    callback()

  @Then /I should see Login button/, (callback) ->
    @browser.button('Login').should.ok
    callback()

  @When /I fill (.+) field with '(.+)'/, (field, value, callback) ->
    @browser.fill(field.toLowerCase(), value, callback)

  @When /I uncheck I'm admin checkbox/, (callback) ->
    @browser.uncheck('isAdmin', callback)

  @When /I click (.+) button/, (button, callback) ->
    @browser.pressButton button, callback

  @Then /I should navigate to profile page/, (callback) ->
    @browser.location._url.hash.should.eql '#profile'
    callback()

  @Then /I should see success message 'Login success!'/, (callback) ->
    @browser.querySelector('.alert-success', '#message')._childNodes['2'].__nodeValue.should.eql 'Login success!'
    callback()

