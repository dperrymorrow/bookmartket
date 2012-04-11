describe "BookmarksRouter", ->

  this.router = null

  beforeEach ->
    this.router = new Booksmartlet.Routers.BookmarksRouter()

    try
      Backbone.history.start()
    catch error
      console.log error

    spyOn this.router, 'newBookmark'

  # it "calls new bookmark with the bookmarks/new route", ->
  #   this.router.navigate 'bookmarks/new', true
  #   expect( this.router.newBookmark).wasCalled()




