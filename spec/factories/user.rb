
Factory.define :user, :class  => User do |f|
  f.email {Faker::Internet.email}
  f.password Faker::Name.name
end