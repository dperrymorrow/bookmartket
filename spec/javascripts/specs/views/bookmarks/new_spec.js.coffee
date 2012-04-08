describe "BookmarksNewView", ->

  this.collection = null
  this.view = null

  beforeEach ->

    loadFixtures 'generic_view'

    this.collection = new Booksmartlet.Collections.BookmarksCollection()
    this.view = new Booksmartlet.Views.Bookmarks.NewView
      collection: this.collection

    spyOn this.collection, 'create'

    $('#content').html(this.view.render().el)

  it "renders the template correctly", ->
    expect($('#content')).toContain 'form'

  it "creates the bookmark on save click", ->

    fake =
      url:   'http://phony.com'
      notes: 'horse blanket'
      title: 'trimbles'

    this.view.$('input[name="url"]').val fake.url
    this.view.$('textarea[name="notes"]').val fake.notes
    this.view.$('input[name="title"]').val fake.title

    this.view.$('#new-bookmark').click()
    expect(this.view.model.attributes).toEqual fake











