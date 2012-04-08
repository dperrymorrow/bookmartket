Booksmartlet.Views.Bookmarks ||= {}

class Booksmartlet.Views.Bookmarks.BookmarkView extends Backbone.View
  template: JST["backbone/templates/bookmarks/bookmark"]

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
