Booksmartlet.Views.Tags ||= {}

class Booksmartlet.Views.Tags.IndexView extends Backbone.View

  template: JST["backbone/templates/tags/index"]

  events:
    "keyup #tags-input": "createTag"

  initialize:() ->
    @tags = @options.tags
    @tags.bind 'reset', @addAll, @
    @tags.bind 'add', @addOne, @

  addAll:() =>
    @.$(".tag-container").children().remove()
    @tags.each(@addOne)

  addOne:(tag) =>
    view = new Booksmartlet.Views.Tags.TagView
      tag:        tag
      collection: @tags

    @.$(".tag-container").append view.render().el

  render: =>
    $(@el).html @template(tags: @tags.toJSON() )
    @addAll()
    @tag_input = @.$('#tags-input')
    return this

  createTag:(e)->

    if e.keyCode == 188
      @tag_input.val @tag_input.val().trim()

      if @tag_input.val() != ','
        @tags.create
          name: @tag_input.val().replace(',', '')

        @tag_input.val('')
