class Booksmartlet.Models.Tag extends Backbone.Model
  paramRoot: 'tag'

  defaults:
    id:   null
    name: null

  url:->
    if @isNew()
      return "/iframe/tags?api_key=#{dpm.BsApp.api_key}"
    else
      return "/iframe/tags/#{@.id}?api_key=#{dpm.BsApp.api_key}"

class Booksmartlet.Collections.TagsCollection extends Backbone.Collection
  model:       Booksmartlet.Models.Tag
  search_term: null

  url:->
    return "/iframe/tags?api_key=#{dpm.BsApp.api_key}"
