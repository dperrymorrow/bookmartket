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

    if @search_field.val().length > 0
      window.location.hash = "bookmarks/search" if window.location.hash != "/bookmarks/search"
    else
      window.location.hash = "bookmarks/new" if window.location.hash != "/bookmarks/new"

    if @search_field.val().length >= 3
      @collection.search_term = @search_field.val()
      @collection.fetch()

  render: ->
    $(@el).html @template()
    @search_field = @.$('#search-input')
    return this
