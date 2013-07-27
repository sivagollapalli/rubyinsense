class Rubyinsense.Views.QuestionsIndex extends Backbone.View
   
   template: JST["backbone/templates/questions/index"]

   initialize: ->
     @collection.on('reset', @render, this)

   render: -> 
     $(@el).html(@template(questions: @collection))
     this
