class Booksmartlet.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    title:  null
    notes:  null
    url:    null
    # domain: null

  url:->
    return "/iframe/bookmarks?api_key=#{dpm.BsApp.api_key}"

class Booksmartlet.Collections.BookmarksCollection extends Backbone.Collection
  model:       Booksmartlet.Models.Bookmark
  search_term: null

  url:->
    return "/iframe/bookmarks?api_key=#{dpm.BsApp.api_key}&search_term=#{encodeURI(@search_term)}"
