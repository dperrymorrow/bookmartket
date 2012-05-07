Booksmartlet.Views.Notes ||= {}

class Booksmartlet.Views.Notes.NewView extends Backbone.View
  template: JST["backbone/templates/notes/new"]
  children_instantiated = false
  mode: 'create'
  events:
    "click #save-note": "save"

  initialize:(options)->
    @model ||= new options.collection.model()
    @tags_collection = @model.tags_collection
    @mode = 'edit' if !@model.isNew()

  save:(e)->
    e.preventDefault()
    e.stopPropagation()

    @model.set
      body: @.$('textarea[name="body"]').val()
      title: @.$('input[name="title"]').val()

    @model.save( null,
      success: (note) =>
        @collection.add @model if @mode == 'create'
        Booksmartlet.Routers.NotesRouter.getInstance().navigate "notes/index", true
      error: (note, jqXHR) =>
        @model = note
        dpm.Errors.highlightErrors $.parseJSON(jqXHR.responseText).errors, @.$('form')
        # @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )


  buildChildren:->
    @children_instantiated = true
    @tags_view = new Booksmartlet.Views.Tags.IndexView
      tags: @tags_collection

  renderChildren:->
    @buildChildren() if !@children_instantiated
    @.$('#tags').html @tags_view.render().el

  render: ->
    $(@el).html @template(@model.toJSON() )
    @renderChildren()
    return this
