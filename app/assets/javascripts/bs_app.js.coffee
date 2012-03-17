
window.dpm ?= {}
class dpm.BsApp

  constructor:(@hash,@url,@tags)->
    console.log 'fire it up....'
    @bookmarks_router = new Booksmartlet.Routers.BookmarksRouter()
    Backbone.history.start()

  @getInstance:()->
    return this
