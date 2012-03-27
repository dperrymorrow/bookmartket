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

    params =
      url:   @.$('input[name="url"]').val()
      notes: @.$('textarea[name="notes"]').val()
      title: @.$('input[name="title"]').val()

    @collection.create( params,
      success: (bookmark) =>
        window.location.hash = "/bookmarks"
      error: (bookmark, jqXHR) =>
        dpm.Errors.highlightErrors($.parseJSON(jqXHR.responseText),@.$('form'))
        # @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html @template(@model.toJSON() )
    return this
