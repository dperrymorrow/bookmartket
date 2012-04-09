
Factory.define :note, :class  => Note do |f|
  f.title Faker::Lorem.words(3)
  f.body Faker::Lorem.sentences(4)
end