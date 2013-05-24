require "mongo"

include Mongo

@conn = MongoClient.new('localhost', 27017)
@collection = @conn['db']['eq']

agree_to_disagree = ["Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"]

questions = [
  { text: "Where are you enrolled?",
    options: [
      "High School",
      "Community College",
      "Four Year College",
      "Graduate School",
      "Other"
    ] },
  { text: "My high school grades don't really reflect what I can do.",
    options: agree_to_disagree },
  { text: "It should not be very hard to get a B (3.0) average at UCMP.",
    options: agree_to_disagree },
  { text: "I get easily discouraged when I try to do something and it doesn't work work.",
    options: agree_to_disagree },
  { text: "I am sometimes looked up to by others.",
    options: agree_to_disagree },
  { text: "If I run into problems concerning school, I have someone who would listen to me and help me.",
    options: agree_to_disagree },
  { text: "There is no use in doing things for people, you only find that you get it in the neck in the long run.",
    options: agree_to_disagree },
  { text: "In groups where I am comfortable, I am often looked to as leader.",
    options: agree_to_disagree },
  { text: "Once I start something, I finish it.",
    options: agree_to_disagree },
  { text: "When I believe strongly in something, I act on it.",
    options: agree_to_disagree },
  { text: "I am as skilled academically as the average applicant to UCMP.",
    options: agree_to_disagree },
  { text: "People can pretty easily change me even though I thought my mind was already made up on the subject.",
    options: agree_to_disagree },
  { text: "My friends and relatives don't feel I should go to college.",
    options: agree_to_disagree },
  { text: "My family has always wanted me to go to college.",
    options: agree_to_disagree }
]

puts "inserting..."
@collection.insert(questions)
puts "done."
