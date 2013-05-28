require "mongo"

include Mongo

@conn = MongoClient.new('localhost', 27017)
@collection = @conn['db']['eq']

agree_to_disagree = ["Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"]

questions = [
  { id: 1,
    text: "Where are you enrolled?",
    options: [
      "High School",
      "Community College",
      "Four Year College",
      "Graduate School",
      "Other"
    ] },
  { id: 2,
    text: "My high school grades don't really reflect what I can do.",
    options: agree_to_disagree },
  { id: 3,
    text: "It should not be very hard to get a B (3.0) average at UCMP.",
    options: agree_to_disagree },
  { id: 4,
    text: "I get easily discouraged when I try to do something and it doesn't work work.",
    options: agree_to_disagree },
  { id: 5,
    text: "I am sometimes looked up to by others.",
    options: agree_to_disagree },
  { id: 6,
    text: "If I run into problems concerning school, I have someone who would listen to me and help me.",
    options: agree_to_disagree },
  { id: 7,
    text: "There is no use in doing things for people, you only find that you get it in the neck in the long run.",
    options: agree_to_disagree },
  { id: 8,
    text: "In groups where I am comfortable, I am often looked to as leader.",
    options: agree_to_disagree },
  { id: 9,
    text: "Once I start something, I finish it.",
    options: agree_to_disagree },
  { id: 10,
    text: "When I believe strongly in something, I act on it.",
    options: agree_to_disagree },
  { id: 11,
    text: "I am as skilled academically as the average applicant to UCMP.",
    options: agree_to_disagree },
  { id: 12,
    text: "People can pretty easily change me even though I thought my mind was already made up on the subject.",
    options: agree_to_disagree },
  { id: 13,
    text: "My friends and relatives don't feel I should go to college.",
    options: agree_to_disagree },
  { id: 14,
    text: "My family has always wanted me to go to college.",
    options: agree_to_disagree }
]

puts "clearing collection..."
@collection.remove()
puts "inserting..."
@collection.insert(questions)
puts "done."
