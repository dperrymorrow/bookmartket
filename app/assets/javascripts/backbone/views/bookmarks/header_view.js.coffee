Booksmartlet.Views.Bookmarks ||= {}

class Booksmartlet.Views.Bookmarks.HeaderView extends Backbone.View
  template: JST["backbone/templates/bookmarks/header"]

  events:
    "keyup #search-input": "search"

  initialize:(options)->
    @collection = options.collection

  search: (e) ->
    e.preventDefault()
    e.stopPropagation()

    window.location.hash = "/bookmarks/search" if window.location.hash != "/bookmarks/search"
    @collection.search_term = @.$('#search-input').val()
    @collection.fetch()

  render: ->
    $(@el).html @template()
    return this
