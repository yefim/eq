define ['text!templates/question_view.html'], (template) ->
  class QuestionView extends Backbone.View
    events:
      'click a.prev': 'prev_question'
      'click a.next': 'next_question'

    initialize: (options) ->
      @number = options.number

    next_question: (e) ->
      e.preventDefault()
      window.router.navigate (@number + 1) + "", {trigger: true}

    prev_question: (e) ->
      e.preventDefault()
      window.router.navigate (@number - 1) + "", {trigger: true}

    render: ->
      @$el.html _.template(template, @model.toJSON())
      return @

  return {view: QuestionView}