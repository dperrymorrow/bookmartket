describe "HeaderView", ->
  this.view = null
  this.notes = null
  this.bookmarks = null

  beforeEach ->
    loadFixtures 'generic_view'

    this.notes = new Booksmartlet.Collections.BookmarksCollection()
    this.bookmarks = new Booksmartlet.Collections.NotesCollection()
    
    this.view = new Booksmartlet.Views.HeaderView
      notes: this.notes
      bookmarks: this.bookmarks

    spyOn this.notes, 'fetch'
    spyOn this.bookmarks, 'fetch'
    
    $('#content').html(this.view.render().el)

  it "renders the header view", ->
    expect($('#content')).toContain '#search-input'
    
  it "defaults to bookmarks", ->
    expect( this.view.context ).toEqual 'bookmarks'
    
  

  describe "searches on keyup", ->
    it "fetches the notes on keyup", ->
      this.view.context = 'notes'
      this.view.$('#search-input').val('Fred').keyup()
      expect(this.notes.fetch).wasCalled()

    it "sets the search term to the input val on keyup", ->
      this.view.context = 'notes'
      this.view.$('#search-input').val('Fred').keyup()
      expect(this.notes.search_term).toEqual 'Fred'
      
    it "fetches the bookmarks on keyup", ->
      this.view.context = 'bookmarks'
      this.view.$('#search-input').val('Fred').keyup()
      expect(this.bookmarks.fetch).wasCalled()

    it "sets the search term to the input val on keyup", ->
      this.view.context = 'bookmarks'
      this.view.$('#search-input').val('Fred').keyup()
      expect(this.bookmarks.search_term).toEqual 'Fred'

    # it "only searches if term is longer than 3", ->
    #   this.view.$('#search-input').val('F').keyup().val('Fr').keyup().val('Fre').keyup()
    #   expect(this.collection.fetch.callCount).toEqual(1)


  describe "note/mark toggling", ->

    it "toggles active class on click of note or 'mark", ->
      this.view.$('#add-note').click()
      expect( this.view.$('#add-note').hasClass('active')).toEqual true

    it "changes the preview text in search based on context", ->
      this.view.$('#add-note').click()
      expect( this.view.$('#search-input').attr('placeholder')).toContain 'Notes'












