describe "BookmarksNewView", ->

  this.collection = null
  this.view = null
  this.fake = {}

  beforeEach ->

    loadFixtures 'generic_view'

    this.fake =
      url:     'http://phony.com'
      notes:   'horse blanket'
      title:   'trimbles'
      tag_ids: []

    this.collection = new Booksmartlet.Collections.BookmarksCollection()
    this.view = new Booksmartlet.Views.Bookmarks.NewView
      collection: this.collection

    spyOn(this.collection, 'create').andReturn({})
    $('#content').html(this.view.render().el)

  it "renders the template correctly", ->
    expect($('#content')).toContain 'form'

  describe "creating new bookmark", ->

    beforeEach ->
      this.view.$('input[name="url"]').val this.fake.url
      this.view.$('textarea[name="notes"]').val this.fake.notes
      this.view.$('input[name="title"]').val this.fake.title
      this.view.$('#new-bookmark').click()

    it "creates the bookmark on save click", ->
      expect(this.view.model.attributes).toEqual this.fake














