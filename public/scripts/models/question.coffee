define [], ->
  class Question extends Backbone.Model
    defaults: ->
      return {
        text: ''
        options: []
        selected: ''
      }

  class Questions extends Backbone.Collection
    model: Question
    url: '/results'

  return {model: Question, collection: Questions}
