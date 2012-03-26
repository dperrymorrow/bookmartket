
Factory.define :bookmark, :class  => Bookmark do |f|
  f.url "http://example.com"
  f.title Faker::Name.name
end