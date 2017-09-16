Option::HABTM_OptionSets.create!([
  {option_id: 2, option_set_id: 1},
  {option_id: 1, option_set_id: 1}
])
OptionSet::HABTM_Options.create!([
  {option_id: 2, option_set_id: 1},
  {option_id: 1, option_set_id: 1}
])
User.create!([
  {email: "mercurial@calmindia.com", password: "groupsite6197!", razorpay_payment_id: "pay_8bzZg6IKSVK2Jx", admin: true},
  {email: "something@something.com", encrypted_password: "$2a$11$DECTdo2Vz67b0bal9yCwa.MSsIVglkI5OYY1Dvs68jyNFGdkYk7yq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-09-15 17:06:48", last_sign_in_at: "2017-09-15 14:17:17", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", razorpay_payment_id: "pay_8ddNTAbEnopgvb"}
])
Course.create!([
  {name: "Build Mental Resilience", description: "Build Mental Resilience Desc", total_weeks: 4}
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
Quiz.create!([
  {name: "Sleep Inventory", course_id: 1, week: 1, order_in_week: 1}
])
QuizScore.create!([
  {user_id: 1, quiz_id: 1, course_id: 1, taken: false},
  {user_id: 4, quiz_id: 1, course_id: 1, taken: true}
])
Video.create!([
  {url: "//content.jwplatform.com/players/6549zayI-udl6r5q6.js", name: "Video 1", description: "Video 1 Desc", week: 1, order_in_week: 1, course_id: 1},
  {url: "//content.jwplatform.com/players/6549zayI-udl6r5q6.js", name: "Video 2", description: "Video 2 desc", week: 1, order_in_week: 2, course_id: 1},
  {url: "//content.jwplatform.com/players/6549zayI-udl6r5q6.js", name: "Video 1 ", description: "Video 1 desc", week: 2, order_in_week: 1, course_id: 1}
])
View.create!([
  {user_id: 1, video_id: 1, course_id: 1, played: true},
  {user_id: 1, video_id: 2, course_id: 1, played: true},
  {user_id: 4, video_id: 3, course_id: 1, played: true}
])
