require ['models/question'], (Question) ->
  Backbone.history.start(pushState: true)
  console.log Question
