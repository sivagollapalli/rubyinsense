class Rubyinsense.Routers.QuestionsRouter extends Backbone.Router

  routes:
    '': 'index'
    'questions/:id' : 'show'
  
  initialize: -> 
    @collection = new Rubyinsense.Collections.QuestionsCollection()
    @collection.fetch()

  index: -> 
    view = new Rubyinsense.Views.QuestionsIndex(collection: @collection) 
    $('#questions').html(view.render().el)  

  show: (id) -> 
    alert 'on show route'
  
