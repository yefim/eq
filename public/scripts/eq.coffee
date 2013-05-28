require ['models/question', 'views/question_view'], (Question, QuestionView) ->
  class Router extends Backbone.Router
    initialize: ->
      @questions = new Question.collection()
      @questions.reset(Data.questions)

    routes:
      ':number' : 'show_question'

    show_question: (number) ->
      number = parseInt(number, 10)
      q = @questions.at(number)
      @question_view = new QuestionView.view(model: q)
      @question_view.on 'change_q', (val) =>
        @navigate (number + val) + "", {trigger: true}
      $('#questions').html @question_view.render().el

  window.router = new Router()
  Backbone.history.start(pushState: true)
