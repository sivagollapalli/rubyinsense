class Rubyinsense.Views.QuestionsIndex extends Backbone.View
   
   template: JST["backbone/templates/questions/index"]

   events: ->
     'submit #new_question': 'addQuestion'

   initialize: ->
     @collection.on('reset', @render, this)
     @collection.on('add', @render, this)

   render: -> 
     $(@el).html(@template())
     @collection.each(@appendEntry)
     this

   appendEntry: (question) -> 
     user_id = document.cookie.split("=")[1]
     question_model =  new Rubyinsense.Models.Question()
     question_model.set("question", question)
     question_model.set("user_id", user_id)
     view = new Rubyinsense.Views.Question({model: question_model})
     $('#questions').append(view.render().el)

   addQuestion: (event) -> 
     event.preventDefault() 
     @collection.create statement: $('#question_statement').val()
