Booksmartlet.Views.Notes ||= {}

class Booksmartlet.Views.Notes.ShowView extends Backbone.View
  template: JST["backbone/templates/notes/show"]
  tagName:  "div"
  
  initialize:->
    @model = @options.model

  render: ->
    $(@el).html @template( @model.toJSON() )
    @.$('#note-body').html @model.get 'rendered_body'
    return this
