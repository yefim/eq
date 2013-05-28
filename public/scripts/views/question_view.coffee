define ['text!templates/question_view.html'], (template) ->
  class QuestionView extends Backbone.View
    className: 'large-6 large-centered columns panel'
    events:
      'click a.prev'            : 'prev_question'
      'click a.next'            : 'next_question'
      'click a.success'         : 'show_results'
      'click input[type=radio]' : 'select_answer'

    initialize: (@options) ->

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

    show_results: (e) ->
      e.preventDefault()
      @trigger 'results'

    render: ->
      data = _.extend @options, @model.toJSON()
      @$el.html _.template(template, data)
      return @

  return {view: QuestionView}
