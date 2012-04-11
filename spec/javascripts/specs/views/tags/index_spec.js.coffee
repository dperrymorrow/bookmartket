describe "TagsIndexView", ->

  this.view = null
  this.collection = null

  beforeEach ->
    loadFixtures 'generic_view'

    this.collection = new Booksmartlet.Collections.TagsCollection()
    spyOn this.collection, 'create'

    this.view = new Booksmartlet.Views.Tags.IndexView
      tags: this.collection

    $('#content').html this.view.render().el

  it "renders one tag for each in collection", ->
    this.collection.reset([{},{}])
    expect(this.view.$('.tag').length ).toEqual 2

  describe "adds a new tag on comma press in tag field", ->

    beforeEach ->
      this.view.$('#tags-input').val(' donkey pants, ')
      this.view.createTag(keyCode:188)

    it "calls #createTag on key up", ->
      expect( this.collection.create ).toHaveBeenCalledWith(name:'donkey pants')

    it "clears after a tag is created", ->
      expect( this.view.$('#tags-input').val() ).toEqual ''









