
window.dpm ||= {}
class dpm.BsApp

  @startUp:(@api_key,@url,@title,@description,@tags)->
    bookmarks_router = Booksmartlet.Routers.BookmarksRouter.getInstance()
    notes_router = Booksmartlet.Routers.NotesRouter.getInstance()

    dpm.Errors.control_container = '.control-group'
    window.location.hash = ''
    Backbone.history.start()
    bookmarks_router.newBookmark()

    header = new Booksmartlet.Views.HeaderView
      bookmarks: bookmarks_router.bookmarks
      notes:     notes_router.notes

    $("#top-bar").html header.render().el


