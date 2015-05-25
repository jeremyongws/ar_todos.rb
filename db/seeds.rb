require 'faker'

5.times do
  List.create name: Faker::App.name
end

10.times do
  Task.create taskname: Faker::Hacker.verb + " " + Faker::Hacker.noun, list_id: List.all.sample.id
end

