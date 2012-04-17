Booksmartlet.Views.Notes ||= {}

class Booksmartlet.Views.Notes.NoteView extends Backbone.View
  template: JST["backbone/templates/notes/note"]

  events:
    "click a.delete" : "destroy"

  tagName: "div"

  destroy: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.destroy()
    this.remove()

  render: ->
    $(@el).html @template( @model.toJSON() )
    return this
