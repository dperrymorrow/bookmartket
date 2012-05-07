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
    "note/:id/edit":  "edit"
    "note/:id/show":  "show"
    # "*.":                  "index"

  new:->
    @view = new Booksmartlet.Views.Notes.NewView
      collection: @notes

    $("#content").html(@view.render().el)

  search: ->
    @view = new Booksmartlet.Views.Notes.SearchView
      notes: @notes

    $("#content").html(@view.render().el)
    
  show:(id)->
    @view = new Booksmartlet.Views.Notes.ShowView
      model: @notes.get id

    $("#content").html @view.render().el

  index: ->
    @view = new Booksmartlet.Views.Notes.SearchView
      notes: @notes

    $("#content").html(@view.render().el)
    @notes.fetch()
