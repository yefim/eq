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
    url: '/questions'

  return {model: Question, collection: Questions}
