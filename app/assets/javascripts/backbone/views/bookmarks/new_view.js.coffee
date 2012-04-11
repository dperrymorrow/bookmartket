Booksmartlet.Views.Bookmarks ||= {}

class Booksmartlet.Views.Bookmarks.NewView extends Backbone.View
  template: JST["backbone/templates/bookmarks/new"]
  children_instantiated = false

  events:
    "click #new-bookmark": "save"

  initialize:(options)->
    @model = new options.collection.model
    @tags_collection = @model.tags_collection

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set
      url:   @.$('input[name="url"]').val()
      notes: @.$('textarea[name="notes"]').val()
      title: @.$('input[name="title"]').val()

    @model.save( null,
      success: (bookmark) =>
        @collection.add @model
        Booksmartlet.Routers.BookmarksRouter.getInstance().navigate "bookmarks/index", true
      error: (bookmark, jqXHR) =>
        @model = bookmark
        dpm.Errors.highlightErrors $.parseJSON(jqXHR.responseText).errors, @.$('form')
        # @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  buildChildren:->
    @children_instantiated = true
    @tags_view = new Booksmartlet.Views.Tags.IndexView
      tags: @tags_collection

  renderChildren:->
    @buildChildren() if !@children_instantiate
    @.$('#tags').html @tags_view.render().el

  render: ->
    $(@el).html @template(@model.toJSON() )
    @renderChildren()
    return this
