class Rubyinsense.Views.AppendQuestion extends Backbone.View
   
   template: JST["backbone/templates/questions/append"]

   render: -> 
     $(@el).html(@template(question: @collection))
     this
