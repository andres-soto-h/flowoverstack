User.create!([
  {email: "andres.soto.h@outlook.com", encrypted_password: "$2a$11$oHlwymztN9qHNyReUXZmzep2Tc0l2cDPIYfoZg8oTSMrUq2mvgcny", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
  {email: "pepe@outlook.com", encrypted_password: "$2a$11$Ej0YByg4O5BpQSr7G0YwDuNbPKse1N.FTQHDu11EcBMCq/vG1Kg.O", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
])
Answer.create!([
  {description: "I think you are doing it right", question_id: 1},
  {description: "This is the second one with markdown support:\r\n\r\nerm 2 with *inline markup*\r\n\r\n:   Definition 2\r\n\r\n        { some code, part of Definition 2 }\r\n\r\n    Third paragraph of definition 2.\r\n\r\n_Compact style:_\r\n\r\nTerm 1\r\n  ~ Definition 1\r\n\r\nTerm 2\r\n  ~ Definition 2a\r\n  ~ Definition 2b", question_id: 1},
  {description: "This is the third answer", question_id: 1}
])
Comment.create!([
  {commentable_type: "Answer", commentable_id: 1, text: "Is this really your answer???"},
  {commentable_type: "Answer", commentable_id: 2, text: "I think you are wrong"},
  {commentable_type: "Question", commentable_id: 1, text: "This is my own comment"}
])
Question.create!([
  {title: "How do i use markdown?", body: "Indented code\r\n\r\n    // Some comments\r\n    line 1 of code\r\n    line 2 of code\r\n    line 3 of code\r\n\r\n", user_id: 1}
])
