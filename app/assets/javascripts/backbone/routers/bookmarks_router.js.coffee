class Booksmartlet.Routers.BookmarksRouter extends Backbone.Router

  initialize: (options) ->
    @bookmarks = new Booksmartlet.Collections.BookmarksCollection()
    @bookmarks.reset []
    @buildHeader()

  routes:
    "bookmarks/new":       "newBookmark"
    "bookmarks/search":    "search"
    "bookmarks":           "new"
    "bookmarks/:id/edit":  "edit"

  newBookmark: ->
    @view = new Booksmartlet.Views.Bookmarks.NewView(collection: @bookmarks)
    $("#content").html(@view.render().el)

  search: ->
    @view = new Booksmartlet.Views.Bookmarks.SearchView(bookmarks: @bookmarks)
    $("#content").html(@view.render().el)

  edit: (id) ->
    bookmark = @bookmarks.get(id)
    @view = new Booksmartlet.Views.Bookmarks.EditView(model: bookmark)
    $("#content").html(@view.render().el)

  buildHeader:->
    @header = new Booksmartlet.Views.Bookmarks.HeaderView(collection: @bookmarks)
    $("#top-bar").html(@header.render().el)
