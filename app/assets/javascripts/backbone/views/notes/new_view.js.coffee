Booksmartlet.Views.Notes ||= {}

class Booksmartlet.Views.Notes.NewView extends Backbone.View
  template: JST["backbone/templates/notes/new"]
  children_instantiated = false

  # events:
  #    "click #new-bookmark": "save"

  initialize:(options)->
    @model = new options.collection.model()
    @tags_collection = @model.tags_collection

  render: ->
    $(@el).html @template(@model.toJSON() )
    return this
