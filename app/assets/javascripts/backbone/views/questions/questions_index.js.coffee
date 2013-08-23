class Rubyinsense.Views.QuestionsIndex extends Backbone.View
   tagName: 'li'
   
   template: JST["backbone/templates/questions/index"]

   initialize: -> 
     @collection.on('reset', @render, this)

   render: ->
     $(@el).html(@template(questions: @collection))
     this
