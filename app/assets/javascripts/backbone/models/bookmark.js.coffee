class Booksmartlet.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    title:   null
    notes:   null
    url:     null
    tag_ids: []
    # domain: null

  initialize:(options)->
    @tags_collection = new Booksmartlet.Collections.TagsCollection()

  url:->
    @.set
      tag_ids: _.pluck(@tags_collection.models, 'id')

    if @isNew()
      return "/iframe/bookmarks?api_key=#{dpm.BsApp.api_key}"
    else
      return "/iframe/bookmarks/#{@.id}?api_key=#{dpm.BsApp.api_key}"

class Booksmartlet.Collections.BookmarksCollection extends Backbone.Collection
  model:       Booksmartlet.Models.Bookmark
  search_term: null

  url:->
    if !@search_term
      return "/iframe/bookmarks?api_key=#{dpm.BsApp.api_key}"
    else
      @reset []
      return "/iframe/bookmarks/search?api_key=#{dpm.BsApp.api_key}&search_term=#{encodeURI @search_term}"
