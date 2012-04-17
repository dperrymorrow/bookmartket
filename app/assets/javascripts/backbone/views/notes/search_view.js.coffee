Booksmartlet.Views.notes ||= {}

class Booksmartlet.Views.Notes.SearchView extends Backbone.View

  template: JST["backbone/templates/notes/search"]

  initialize:() ->
    @notes = @options.notes
    @options.notes.bind('reset', @render)

  addAll:() =>
    # @render()
    @.$(".notes-container").children().remove()
    @notes.each(@addOne)

  addOne:(note) =>
    view = new Booksmartlet.Views.Notes.NoteView
      model: note

    @.$(".notes-container").append(view.render().el)

  render: =>
    $(@el).html(
      @template
        notes:   @notes.toJSON()
        search_term: @notes.search_term
    )
    @addAll()
    return this
