class Rubyinsense.Views.Question extends Backbone.View

   template: JST["backbone/templates/questions/question"]
   tagName: 'li'

   render: -> 
     $(@el).html(@template({model: @model}))
     this
