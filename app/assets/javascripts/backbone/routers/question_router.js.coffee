class Rubyinsense.Routers.QuestionsRouter extends Backbone.Router

  routes:
    '': 'index'
    'questions/new' : 'new'
  
  initialize: -> 
    @collection = new Rubyinsense.Collections.QuestionsCollection()
    @collection.fetch()

  index: -> 
    view = new Rubyinsense.Views.QuestionsIndex(collection: @collection) 
    $('#questions').html(view.render().el)  

  new: -> 
    view = new Rubyinsense.Views.NewQuestion() 
    $('#new-question').html(view.render().el)  
