class Booksmartlet.Routers.NotesRouter extends Backbone.Router
  _instance = undefined

  initialize: (options) ->
    @bookmarks = new Booksmartlet.Collections.NotesCollection()
    @bookmarks.reset []


  @getInstance:->
    _instance ||= new Booksmartlet.Routers.NotesRouter()

  routes:
    "notes/new":       "new"
    "notes/search":    "search"
    "notes/index":     "index"
    "notes/:id/edit":  "edit"
    # "*.":                  "index"

  new:->
    # hello
