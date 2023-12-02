# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

50.times do
  Subject.create(
    name: Faker::Educator.course_name,
    grade_subject: Faker::Educator.degree,
    description: Faker::Lorem.sentence
  )
  faker_subjects << faker_subject
end

@faker_subjects = faker_subjects
