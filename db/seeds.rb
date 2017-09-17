User.create!([
  {email: "mercurial@calmindia.com", password: "groupsite6197!", razorpay_payment_id: "pay_8bzZg6IKSVK2Jx", admin: true},
])
Course.create!([
  {name: "Build Mental Resilience", description: "Build Mental Resilience Desc", total_weeks: 4}
])

Quiz.create!([
  {name: "Sleep Inventory", course_id: 1, week: 1, order_in_week: 1}
])

Video.create!([
  {url: "//content.jwplatform.com/players/6549zayI-udl6r5q6.js", name: "Video 1", description: "Video 1 Desc", week: 1, order_in_week: 1, course_id: 1},
  {url: "//content.jwplatform.com/players/6549zayI-udl6r5q6.js", name: "Video 2", description: "Video 2 desc", week: 1, order_in_week: 2, course_id: 1},
  {url: "//content.jwplatform.com/players/6549zayI-udl6r5q6.js", name: "Video 1 ", description: "Video 1 desc", week: 2, order_in_week: 1, course_id: 1}
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
Option::HABTM_OptionSets.create!([
  {option_id: 2, option_set_id: 1},
  {option_id: 1, option_set_id: 1}
])
OptionSet::HABTM_Options.create!([
  {option_id: 2, option_set_id: 1},
  {option_id: 1, option_set_id: 1}
])