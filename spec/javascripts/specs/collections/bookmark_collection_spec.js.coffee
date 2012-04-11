describe "BookmarksCollection", ->

  this.collection = null

  beforeEach ->

    window.dpm.BsApp =
      api_key: 'nobody'

    this.collection = new Booksmartlet.Collections.BookmarksCollection()

  it "returns search url if search_term", ->
    this.collection.search_term = 'donkey'
    expect(this.collection.url()).toEqual "/iframe/bookmarks/search?api_key=nobody&search_term=donkey"

  it "returns index url if search_term null", ->
    expect(this.collection.url()).toEqual "/iframe/bookmarks?api_key=nobody"






