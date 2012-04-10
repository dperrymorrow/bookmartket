Booksmartlet.Views.Bookmarks ||= {}

class Booksmartlet.Views.Bookmarks.NewView extends Backbone.View
  template: JST["backbone/templates/bookmarks/new"]

  events:
    "click #new-bookmark": "save"

  initialize:(options)->
    @model = new options.collection.model

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.set
      url:   @.$('input[name="url"]').val()
      notes: @.$('textarea[name="notes"]').val()
      title: @.$('input[name="title"]').val()

    @collection.create( @model,
      success: (bookmark) =>
        @model = bookmark
        Booksmartlet.Routers.BookmarksRouter.getInstance().navigate "bookmarks/index", true
      error: (bookmark, jqXHR) =>
        @model = bookmark
        dpm.Errors.highlightErrors $.parseJSON(jqXHR.responseText).errors, @.$('form')
        # @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html @template(@model.toJSON() )
    return this
