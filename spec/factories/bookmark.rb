Factory.define :bookmark, :class  => Bookmark do |f|
  f.url 'http://www.example.com'
  f.title Faker::Name.name
end