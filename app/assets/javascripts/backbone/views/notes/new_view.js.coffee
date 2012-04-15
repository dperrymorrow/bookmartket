Booksmartlet.Views.Notes ||= {}

class Booksmartlet.Views.Notes.NewView extends Backbone.View
  template: JST["backbone/templates/notes/new"]
  children_instantiated = false

  events:
    "click #new-bookmark": "save"

  initialize:(options)->
    @model = new options.collection.model
    @tagsCollection = @model.tagsCollection

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set
      body: @.$('textarea[name="body"]').val()
      title: @.$('input[name="title"]').val()

    @model.save( null,
      success: (bookmark) =>
        @collection.add @model
        Booksmartlet.Routers.NotesRouter.getInstance().navigate "notes/index", true
      error: (note, jqXHR) =>
        @model = note
        dpm.Errors.highlightErrors $.parseJSON(jqXHR.responseText).errors, @.$('form')
        # @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  buildChildren:->
    @childrenInstantiated = true
    @tagsView = new Booksmartlet.Views.Tags.IndexView
      tags: @tagsCollection

  renderChildren:->
    @buildChildren() if !@childrenInstantiated
    @.$('#tags').html @tags_view.render().el

  render: ->
    $(@el).html @template(@model.toJSON() )
    @renderChildren()
    return this
