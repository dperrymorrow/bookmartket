Booksmartlet.Views.Tags ||= {}

class Booksmartlet.Views.Tags.IndexView extends Backbone.View

  template: JST["backbone/templates/tags/index"]

  events:
    "keyup #tags-input": "createTag"

  initialize:() ->
    @tags = @options.tags
    @tags.bind 'reset', @addAll, @
    @tags.bind 'add', @addOne, @

    @all_tags = new Booksmartlet.Collections.TagsCollection()
    @all_tags.bind 'reset', @setupSuggest, @
    @all_tags.fetch()

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

  setupSuggest:->
    @tag_input.typeahead
      source: @all_tags.pluck 'name'
      items: 8

    @tag_input.unbind 'keyup', $.proxy @, 'createTag'
    @tag_input.bind 'keyup', $.proxy @, 'createTag'

  createTag:(e)->
    if e.keyCode == 188 or e.keyCode == 13
      @tag_input.val @tag_input.val().trim()

      if @tag_input.val() != ',' and @tag_input.val().length > 1
        @tags.create
          name: @tag_input.val().replace(',', '')

        @tag_input.val('')
