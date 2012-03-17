Booksmartlet.Views.Bookmarks ||= {}

class Booksmartlet.Views.Bookmarks.BookmarkView extends Backbone.View
  template: JST["backbone/templates/bookmarks/bookmark"]

  events:
    "click .destroy" : "destroy"

  tagName: "div"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
