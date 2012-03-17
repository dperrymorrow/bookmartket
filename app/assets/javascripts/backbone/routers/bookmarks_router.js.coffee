class Booksmartlet.Routers.BookmarksRouter extends Backbone.Router
  initialize: (options) ->
    @bookmarks = new Booksmartlet.Collections.BookmarksCollection()
    @bookmarks.reset []

  routes:
    "/bookmarks/new":   "newBookmark"
    "/bookmarks/index": "index"
    "/bookmarks/:id/edit" : "edit"
    ".*":               "index"

  newBookmark: ->
    console.log 'new'
    @view = new Booksmartlet.Views.Bookmarks.NewView(collection: @bookmarks)
    $("#content").html(@view.render().el)

  index: ->
    @view = new Booksmartlet.Views.Bookmarks.IndexView(bookmarks: @bookmarks)
    $("#content").html(@view.render().el)

  edit: (id) ->
    bookmark = @bookmarks.get(id)

    @view = new Booksmartlet.Views.Bookmarks.EditView(model: bookmark)
    $("#bookmarks").html(@view.render().el)
