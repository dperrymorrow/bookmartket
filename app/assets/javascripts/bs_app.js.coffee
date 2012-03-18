
window.dpm ?= {}
class dpm.BsApp

  @startUp:(@api_key,@url,@tags)->
    @bookmarks_router = new Booksmartlet.Routers.BookmarksRouter()
    Backbone.history.start()
