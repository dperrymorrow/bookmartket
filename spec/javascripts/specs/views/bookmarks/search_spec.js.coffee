describe "BookmarkSearchView", ->

  this.view = null
  this.collection = null

  beforeEach ->
    loadFixtures 'generic_view'

    this.collection = new Booksmartlet.Collections.BookmarksCollection()
    this.view = new Booksmartlet.Views.Bookmarks.SearchView
      bookmarks: this.collection

    $('#content').html(this.view.render().el)

  it "renders the template", ->
    expect($('#content')).toContain('.bookmarks-container')

  it "clears the bookmarks out each render", ->
    this.collection.reset([{},{}])
    this.collection.reset([{}])
    expect(this.view.$('.bookmarks-container').children().length).toEqual( 1 )

  it "renders one bookmarks per model", ->
    this.collection.reset([{},{},{},{}])
    expect(this.view.$('.bookmarks-container').children().length).toEqual( 4 )



