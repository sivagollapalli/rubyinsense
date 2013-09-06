class Rubyinsense.Routers.QuestionsRouter extends Backbone.Router

  routes:
    '': 'index'
    'questions/new' : 'new'
    'questions/:id/edit' : 'edit'
    'questions/:id' : 'destroy'
  
  index: ->
    collection = new Rubyinsense.Collections.QuestionsCollection()
    collection.fetch({url: '/api/questions', async: false})
    view = new Rubyinsense.Views.QuestionsIndex(collection: collection)
    $('#questions').html(view.render().el)

  new: ->
    question = new Rubyinsense.Models.Question()
    view = new Rubyinsense.Views.NewQuestion(question: question, action: 'new')
    $('#questions').html(view.render().el)

  edit: (id) ->
    question = new Rubyinsense.Models.Question()
    question.fetch url: "/api/questions/#{id}/edit", async: false # async: false option halts execution unless server completes execution
    view = new Rubyinsense.Views.NewQuestion(question: question, action: 'edit')
    $('#questions').html(view.render().el)
