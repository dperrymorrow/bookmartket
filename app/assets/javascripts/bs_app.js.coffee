
window.dpm ||= {}
class dpm.BsApp

  @startUp:(@api_key,@url,@title,@description,@tags)->
    bookmarks_router = new Booksmartlet.Routers.BookmarksRouter()
    notes_router = new Booksmartlet.Routers.NotesRouter()

    dpm.Errors.control_container = '.control-group'

    Backbone.history.start()
    bookmarks_router.newBookmark() if window.location.hash == ''

    header = new Booksmartlet.Views.HeaderView(collection: bookmarks_router.bookmarks)
    $("#top-bar").html header.render().el


