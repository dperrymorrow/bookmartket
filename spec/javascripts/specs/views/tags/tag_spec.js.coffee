describe "TagView", ->

  this.view = null
  this.model = null

  beforeEach ->
    loadFixtures 'generic_view'

    this.model = new Booksmartlet.Models.Tag
      name: 'donkey pants'

    this.view = new Booksmartlet.Views.Tags.TagView
      tag: this.model

    $('#content').html this.view.render().el

    spyOn this.model, 'destroy'

  it "renders the template", ->
    this.model.set
      name: 'donkey'

    this.view.render()
    expect( this.view.$('.name').text() ).toContain 'donkey'

  describe "delte the tag", ->

    it "calls delete on click of delete", ->
      this.view.$('a.delete').click()
      expect( $('#content').text() ).not.toContain('donkey pants')

    it "removes it self on delete", ->





