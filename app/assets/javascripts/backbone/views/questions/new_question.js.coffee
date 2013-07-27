class Rubyinsense.Views.NewQuestion extends Backbone.View
   
   template: JST["backbone/templates/questions/new"]

   render: -> 
     $(@el).html(@template())
     this
