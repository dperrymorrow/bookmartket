Booksmartlet.Views ||= {}

class Booksmartlet.Views.HeaderView extends Backbone.View
  template: JST["backbone/templates/header"]

  events:
    "keyup #search-input": "search"
    "click #add-mark":     "newMark"
    "click #add-note":     "newNote"

  initialize:(options)->
    @notes = options.notes
    @bookmarks = options.bookmarks

  search: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if @search_field.val().length > 0
      window.location.hash = "#{@context}/search" if window.location.hash != "/#{@context}/search"
    else
      window.location.hash = "#{@context}/new" if window.location.hash != "/#{@context}/new"

    # if @search_field.val().length >= 3
    if @context == 'notes'
      @notes.search_term = @search_field.val()
      @notes.fetch()
    else
      @bookmarks.search_term = @search_field.val()
      @bookmarks.fetch()

  render: ->
    $(@el).html @template()
    @search_field = @.$('#search-input')
    @.$('#add-mark').click()
    return this

  newMark:(e)->
    # e.preventDefault()
    #  e.stopPropagation()

    @.$('#add-note').removeClass 'active'
    @.$('#add-mark').addClass 'active'

    @context = 'bookmarks'
    @search_field.attr 'placeholder', 'Search Bookmarks'
    # Booksmartlet.Routers.BookmarksRouter.getInstance().navigate 'bookmarks/new', true

  newNote:(e)->
    # e.preventDefault()
    # e.stopPropagation()

    @.$('#add-mark').removeClass 'active'
    @.$('#add-note').addClass 'active'

    @context = 'notes'
    @search_field.attr 'placeholder', 'Search Notes'
    # Booksmartlet.Routers.NotesRouter.getInstance().navigate 'notes/new', true


