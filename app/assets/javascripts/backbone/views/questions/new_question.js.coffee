class Rubyinsense.Views.NewQuestion extends Backbone.View
   
   template: JST["backbone/templates/questions/new"]

   events: ->
     'submit #new_question': 'addQuestion'

   render: ->
     $(@el).html(@template(question: this.options.question, action: this.options.action))
     this

   addQuestion: (event) ->
     event.preventDefault()
     collection = new Rubyinsense.Collections.QuestionsCollection()
     collection.create statement: $('#question_statement').val()
     router = new Rubyinsense.Routers.QuestionsRouter()
     router.navigate("", { trigger: true })
