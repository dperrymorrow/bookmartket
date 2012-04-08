describe "BookmarkHeaderView", ->
  this.view = null
  this.collection = null

  beforeEach ->
    loadFixtures 'generic_view'

    this.collection = new Booksmartlet.Collections.BookmarksCollection()
    this.view = new Booksmartlet.Views.Bookmarks.HeaderView
      collection: this.collection

    spyOn( this.collection, 'fetch')
    $('#content').html(this.view.render().el)

  it "renders the header view", ->
    expect($('#content')).toContain '#search-input'

  describe "searches on keyup", ->
    it "fetches the collection on keyup", ->
      this.view.$('#search-input').val('Fred').keyup()
      expect(this.collection.fetch).wasCalled()

    it "sets the search term to the input val on keyup", ->
      this.view.$('#search-input').val('Fred').keyup()
      expect(this.collection.search_term).toEqual('Fred')

    it "only searches if term is longer than 3", ->
      this.view.$('#search-input').val('F').keyup().val('Fr').keyup().val('Fre').keyup()
      expect(this.collection.fetch.callCount).toEqual(1)







