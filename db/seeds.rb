User.create!([
  {email: "mercurial@calmindia.com", password: "groupsite6197!", payment_id: "pay_8bzZg6IKSVK2Jx", admin: true},
])
Course.create!([
  {name: "Build Mental Resilience", description: "Content for first 2 weeks is out now! Content for the last 2 weeks will be released October 7th.", total_weeks: 4, audio_book_url: 'https://s3.ap-south-1.amazonaws.com/calmindia/Calm+India+Audio.zip', slide_deck_url: 'https://s3.ap-south-1.amazonaws.com/calmindia/Flash_Cards_Calmindia.pdf', slide_deck_title: 'Science Of The Mind', slide_deck_description: 'Handy deck of flash cards for a quick reference anytime anywhere.', audio_book_title: 'Re-train Your Mind', audio_book_description: 'Narrated version of the content broken down into 10 minute chunks.'}
])

Quiz.create!([
  {name: "Sleep Inventory", course_id: 1, week: 1, order_in_week: 1, result_text: 'Chances that you are experiencing a sleep disorder', }
])

Video.create!([
  {url: "https://s3.ap-south-1.amazonaws.com/calmindia/EP5PT2.mp4", name: "Video 1", description: "Video 1 Desc", week: 1, order_in_week: 1, course_id: 1},
  {url: "https://s3.ap-south-1.amazonaws.com/calmindia/EP5PT2.mp4", name: "Video 2", description: "Video 2 desc", week: 1, order_in_week: 2, course_id: 1},
  {url: "https://s3.ap-south-1.amazonaws.com/calmindia/EP5PT2.mp4", name: "Video 1 ", description: "Video 1 desc", week: 2, order_in_week: 1, course_id: 1}
])
Option.create!([
  {text: "Yes", value: 1},
  {text: "No", value: 0}
])
OptionSet.create!([
  {name: "Yes or No", noop: 2}
])
Question.create!([
  {question: "I have difficulty falling asleep", quiz_id: 1, option_set_id: 1, mandatory: nil},
  {question: "I wake up during the night and can't go to sleep", quiz_id: 1, option_set_id: 1, mandatory: true}
])
# Option::HABTM_OptionSets.create!([
#   {option_id: 2, option_set_id: 1},
#   {option_id: 1, option_set_id: 1}
# ])
# OptionSet::HABTM_Options.create!([
#   {option_id: 2, option_set_id: 1},
#   {option_id: 1, option_set_id: 1}
# ])
Question.create!([
  {question: "I have difficulty falling asleep", quiz_id: 1, option_set_id: 1, mandatory: nil},
  {question: "I wake up during the night and can't go to sleep", quiz_id: 1, option_set_id: 1, mandatory: true}
])
QuizThreshold.create!([
  {name: 'Low', quiz_id: 1, min: 0, max: 33},
  {name: 'Medium', quiz_id: 1, min: 34, max: 66},
  {name: 'High', quiz_id: 1, min: 67, max: 100}
])