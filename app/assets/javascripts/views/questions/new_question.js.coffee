class Rubyinsense.Views.NewQuestion extends Backbone.View
   template: JST["questions/new"]

   events: ->
     'submit #new_question': 'create'
     'submit #edit_question': 'update'

   render: ->
     $(@el).html(@template(question: this.options.question, action: this.options.action))
     this

   create: (event) ->
     event.preventDefault()
     collection = new Rubyinsense.Collections.QuestionsCollection()
     collection.create statement: $('#question_statement').val(), {url: '/api/questions', method: 'post'}
     router = new Rubyinsense.Routers.QuestionsRouter()
     router.navigate("", { trigger: true })

   update: (event) ->
     event.preventDefault()
     question = new Rubyinsense.Models.Question()
     id = $('#question').val()
     question.save({statement: $('#question_statement').val()}, {url: "/api/questions/#{id}", method: 'put'})
     router = new Rubyinsense.Routers.QuestionsRouter()
     router.navigate("", { trigger: true })
