class Booksmartlet.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    title: null
    notes: null
    url:   null

class Booksmartlet.Collections.BookmarksCollection extends Backbone.Collection
  model: Booksmartlet.Models.Bookmark
  url: '/iframe/bookmarks'
