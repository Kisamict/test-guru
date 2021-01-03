admins = Admin.create(first_name: "admin", last_name: "admin", email: 'admin@example.com', password: "123456")

categories = Category.create(
  [
    {title: 'Frontend'},
    {title: 'Backend'}
  ]
)

tests = Test.create(
  [
    {title: 'HTML', level: 0, category_id: categories[0].id},
    {title: 'CSS', level: 0, category_id: categories[0].id},
    {title: 'Ruby', level: 1, category_id: categories[1].id},
    {title: 'Python', level: 1, category_id: categories[1].id}
  ]
)

questions = Question.create(
  [
    {body: "Who is the programmer's best friend?", test_id: tests[2].id},
    {body: 'Is Python object-oriented language?', test_id: tests[3].id},
    {body: 'Is HTML a programming language?', test_id: tests[0].id},
    {body: 'Is CSS a programming language?', test_id: tests[1].id}
  ]
)

answers = Answer.create(
  [
    {body: 'Ruby', correct: true, question_id: questions[0].id},
    {body: 'Dog', question_id: questions[0].id},
    {body: 'Yes', correct: true, question_id: questions[1].id},
    {body: 'No', question_id: questions[1].id},
    {body: 'No', correct: true, question_id: questions[2].id},
    {body: 'Yes', question_id: questions[2].id},
    {body: 'No', correct: true, question_id: questions[3].id},
    {body: 'Yes', question_id: questions[3].id}
  ]
)
