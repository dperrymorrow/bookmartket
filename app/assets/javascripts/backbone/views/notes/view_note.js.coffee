Booksmartlet.Views.Notes ||= {}

class Booksmartlet.Views.Notes.ViewNote extends Backbone.View
  template: JST["backbone/templates/notes/view"]
  tagName:  "div"

  render: ->
    $(@el).html @template( @model.toJSON() )
    return this
