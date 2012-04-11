class Booksmartlet.Routers.BookmarksRouter extends Backbone.Router
  _instance = undefined

  initialize: (options) ->
    @bookmarks = new Booksmartlet.Collections.BookmarksCollection()
    @bookmarks.reset []
    @buildHeader()

  @getInstance:->
    _instance ||= new Booksmartlet.Routers.BookmarksRouter()

  routes:
    "bookmarks/new":       "newBookmark"
    "bookmarks/search":    "search"
    "bookmarks/index":     "index"
    "bookmarks/:id/edit":  "edit"
    # "*.":                  "index"

  newBookmark: ->
    @view = new Booksmartlet.Views.Bookmarks.NewView
      collection:      @bookmarks

    $("#content").html(@view.render().el)

  search: ->
    @view = new Booksmartlet.Views.Bookmarks.SearchView(bookmarks: @bookmarks)
    $("#content").html(@view.render().el)

  index: ->
    @view = new Booksmartlet.Views.Bookmarks.SearchView(bookmarks: @bookmarks)
    $("#content").html(@view.render().el)
    @bookmarks.fetch()

  edit: (id) ->
    bookmark = @bookmarks.get(id)
    @view = new Booksmartlet.Views.Bookmarks.EditView(model: bookmark)
    $("#content").html(@view.render().el)

  buildHeader:->
    @header = new Booksmartlet.Views.Bookmarks.HeaderView(collection: @bookmarks)
    $("#top-bar").html(@header.render().el)
