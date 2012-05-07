class Booksmartlet.Models.Note extends Backbone.Model
  paramRoot: 'note'

  defaults:
    title:   null
    body:    null
    tag_ids: []
    rendered_body:  null

  initialize:(options)->
    @tags_collection = new Booksmartlet.Collections.TagsCollection()
    @tags_collection.note = @

  url:->
    @.set
      tag_ids: _.pluck( @tags_collection.models, 'id' )

    if @isNew()
      return "/iframe/notes?api_key=#{dpm.BsApp.api_key}"
    else
      return "/iframe/notes/#{@.id}?api_key=#{dpm.BsApp.api_key}"

class Booksmartlet.Collections.NotesCollection extends Backbone.Collection
  model:       Booksmartlet.Models.Note
  search_term: null

  url:->
    if !@search_term
      return "/iframe/notes?api_key=#{dpm.BsApp.api_key}"
    else
      return "/iframe/notes/search?api_key=#{dpm.BsApp.api_key}&search_term=#{encodeURI @search_term}"
