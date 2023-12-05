# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

grades = ["1º de secundaria", "2º de secundaria", "3º de secundaria", "1º de preparatoria", "2º de secundaria", "3º de secundaria"]

subjects = ["Matemáticas", "Física", "Química", "Programación", "Inglés", "Español", "Historia", "Cálculo", "Orientación vocacional"]

50.times do
  Subject.create(
    name: subjects.sample,
    grade_subject: grades.sample,
    description: Faker::Lorem.sentence
  )
  faker_subjects << faker_subject
end

@faker_subjects = faker_subjects
