window.Rubyinsense =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new Rubyinsense.Routers.QuestionsRouter()
    Backbone.history.start()

$(document).ready ->
  Rubyinsense.initialize()
