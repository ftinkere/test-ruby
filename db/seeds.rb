# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

patients = Patient.create [
  { full_name: 'Luke', birth_date: Date.today, number: '79998887766', email: 'Luke@example.com' },
  { full_name: 'Matvei', birth_date: Date.today, number: '71118887766', email: 'Matvei@example.com' },
]

consultation_requests = ConsultationRequest.create [
  {
    patient: patients.first,
    text: 'Здравствйте. У меня болит живот слева, а при надавливании проходит. Подскажите что это может быть?', date: Date.today
  },
  {
    patient: patients.first,
    text: 'Здравствйте. У меня неровная родинка. Это опасно?', date: Date.today
  },
]

recommendations = Recommendation.create [
  {
    consultation_request: consultation_requests.first,
    text: 'Здравствуйте! Боль в животе слева, которая проходит при надавливании, может быть вызвана несколькими факторами. Одной из возможных причин может быть простудное воспаление кишечника или кишечная инфекция. Также, данная симптоматика может указывать на проблемы с кишечником, такими как синдром раздраженного кишечника или дивертикулит. Однако, для более точного диагноза и определения причины боли, рекомендую Вам обратиться к врачу непосредственно. Врач проведет дополнительные обследования и нужные тесты, чтобы установить диагноз и назначить соответствующее лечение.'
  },
]