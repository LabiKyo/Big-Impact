zombie = require 'zombie'
exports.World = (callback) ->
  @World = (callback) ->
    callback()

  @site = 'http://big-impact.com/'
  @browser = new zombie.Browser
    site: @site

  @visit = (url, callback) ->
    @browser.visit url, callback

  callback()
