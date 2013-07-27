#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Rubyinsense =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: -> 
    new Rubyinsense.Routers.QuestionsRouter()
    Backbone.history.start()

$(document).ready -> 
  Rubyinsense.init()
