
window.dpm ||= {}
class dpm.BsApp

  @startUp:(@api_key,@url,@title,@description,@tags)->
    @bookmarks_router = new Booksmartlet.Routers.BookmarksRouter()
    Backbone.history.start()
    @bookmarks_router.newBookmark() if window.location.hash == ''

