class Rubyinsense.Models.Question extends Backbone.Model
   paramRoot: 'question'

class Rubyinsense.Collections.QuestionsCollection extends Backbone.Collection
   model: Rubyinsense.Models.Question
