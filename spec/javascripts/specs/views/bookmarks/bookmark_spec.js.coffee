describe "BookmarkView", ->

  this.model = null
  this.view = null

  beforeEach ->
    loadFixtures 'generic_view'

    this.model = new Booksmartlet.Models.Bookmark()
    this.view = new Booksmartlet.Views.Bookmarks.BookmarkView
      model: this.model

    $('#content').html this.view.render().el

  describe "renders the template as expected", ->

    beforeEach ->
      this.model.set
        title: 'fake'
        url:   'http://fake.com'

      this.view.render()

    it "renders a row for the bookmark", ->
      expect($('#content')).toContain '.bookmark'

    it "renders the url as a href", ->
      expect($('#content').find('a.link').attr('href')).toEqual 'http://fake.com'

    it "renders the title of the like as the bookmark title", ->
      expect($('#content').find('a.link').text()).toEqual 'fake'

  describe "delete the bookmark", ->

    beforeEach ->
      spyOn this.model, 'destroy'
      this.view.$('a.delete').click()

    it "deletes the bookmark on remove", ->
      expect(this.model.destroy).wasCalled()

    it "removes itself on delete", ->
      expect($('#content').html()).toEqual ''
















