Booksmartlet.Views ||= {}

class Booksmartlet.Views.HeaderView extends Backbone.View
  template: JST["backbone/templates/header"]

  events:
    "keyup #search-input": "search"
    "click #add-mark":     "newMark"
    "click #add-note":     "newNote"

  initialize:(options)->
    @collection = options.collection

  search: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if @search_field.val().length > 0
      window.location.hash = "bookmarks/search" if window.location.hash != "/bookmarks/search"
    else
      window.location.hash = "bookmarks/new" if window.location.hash != "/bookmarks/new"

    # if @search_field.val().length >= 3
    @collection.search_term = @search_field.val()
    @collection.fetch()

  render: ->
    $(@el).html @template()
    @search_field = @.$('#search-input')
    @.$('#add-mark').click()
    return this

  newMark:(e)->
    # e.preventDefault()
    #     e.stopPropagation()

    @.$('#add-note').removeClass 'active'
    @.$('#add-mark').addClass 'active'

    @search_field.attr 'placeholder', 'Search Bookmarks'
    # Booksmartlet.Routers.BookmarksRouter.getInstance().navigate 'bookmarks/new', true

  newNote:(e)->
    # e.preventDefault()
    #     e.stopPropagation()

    @.$('#add-mark').removeClass 'active'
    @.$('#add-note').addClass 'active'

    @search_field.attr 'placeholder', 'Search Notes'
    # Booksmartlet.Routers.NotesRouter.getInstance().navigate 'notes/new', true


