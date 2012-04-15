class Booksmartlet.Routers.NotesRouter extends Backbone.Router
  _instance = undefined

  initialize: (options) ->
    @notes = new Booksmartlet.Collections.NotesCollection()
    @notes.reset []

  @getInstance:->
    _instance ||= new Booksmartlet.Routers.NotesRouter()

  routes:
    "notes/new":       "new"
    "notes/search":    "search"
    "notes/index":     "index"
    "notes/:id/edit":  "edit"
    # "*.":                  "index"

  new:->

    @view = new Booksmartlet.Views.Notes.NewView
      collection: @notes

    $("#content").html(@view.render().el)
