define ['text!templates/question_view.html'], (template) ->
  class QuestionView extends Backbone.View
    events:
      'click a.prev'            : 'prev_question'
      'click a.next'            : 'next_question'
      'click input[type=radio]' : 'select_answer'

    select_answer: (e) ->
      selected = $(e.currentTarget).val()
      @model.set(selected: selected)
      @render()

    change_question: (e, val) =>
      e.preventDefault()
      return if $(e.currentTarget).hasClass('disabled')
      @trigger 'change_q', val

    next_question: (e) ->
      @change_question e, 1

    prev_question: (e) ->
      @change_question e, -1

    render: ->
      @$el.html _.template(template, @model.toJSON())
      return @

  return {view: QuestionView}
