Booksmartlet.Views.Tags ||= {}

class Booksmartlet.Views.Tags.TagView extends Backbone.View

  template: JST["backbone/templates/tags/tag"]

  events:
    "click .tag": "deleteTag"

  initialize:(options) ->
    @tag = options.tag
    @collection = options.collection

  deleteTag:(e)->
    e.preventDefault()
    e.stopPropagation()

    $(@el).remove()
    @collection.remove [@tag]

  render: =>
    $(@el).html @template(@tag.toJSON())
    return this
