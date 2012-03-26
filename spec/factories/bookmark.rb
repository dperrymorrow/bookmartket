
Factory.define :bookmark, :class  => Bookmark do |f|
  f.url "http://#{Faker::Internet.domain_name}"
  f.title Faker::Name.name
end