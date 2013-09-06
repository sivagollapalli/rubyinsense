class Rubyinsense.Views.QuestionsIndex extends Backbone.View
   tagName: 'li'
   
   template: JST['questions/index']

   render: ->
     $(@el).html(@template(questions: @collection))
     this
