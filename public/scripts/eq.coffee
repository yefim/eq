require ['models/question', 'views/question_view'], (Question, QuestionView) ->
  class Router extends Backbone.Router
    initialize: ->
      @questions = new Question.collection()
      @questions.reset(Data.questions)

    routes:
      'results' : 'show_results'
      ':number' : 'show_question'

    show_results: ->
      console.log "results are shown"

    show_question: (number) ->
      number = parseInt(number, 10)
      q = @questions.get(number)
      @question_view = new QuestionView.view(
        model: q
        min: 1
        max: @questions.length
      )
      @question_view.on 'change_q', (val) =>
        @navigate (number + val) + "", {trigger: true}
      @question_view.on 'results', =>
        @navigate 'results', {trigger: true}
      $('#questions').html @question_view.render().el

  window.router = new Router()
  Backbone.history.start(pushState: true)
