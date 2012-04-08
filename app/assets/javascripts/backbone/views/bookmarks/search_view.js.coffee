Booksmartlet.Views.Bookmarks ||= {}

class Booksmartlet.Views.Bookmarks.SearchView extends Backbone.View

  template: JST["backbone/templates/bookmarks/search"]

  initialize:() ->
    @bookmarks = @options.bookmarks
    @options.bookmarks.bind('reset', @addAll)

  addAll:() =>
    @.$(".bookmarks-container").children().remove()
    @bookmarks.each(@addOne)

  addOne:(bookmark) =>
    view = new Booksmartlet.Views.Bookmarks.BookmarkView
      model: bookmark

    @.$(".bookmarks-container").append(view.render().el)

  render: =>
    $(@el).html @template(bookmarks: @bookmarks.toJSON() )
    @addAll()

    return this
