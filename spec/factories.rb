FactoryGirl.define do
  factory :dude do
    name { Faker::Name.name }
  end

  factory :book do
    title { Faker::Movie.title }
    description { Faker::Lorem.sentence }
    year { rand(1900..2010) }
    author factory: :dude
    tag_list { rand(6).times.map { Faker::Lorem.word }.join ', ' }
  end

  factory :video do
    title { Faker::Movie.title }
    description { Faker::Lorem.sentence }
    year { rand(1900..2010) }
    director factory: :dude
    tag_list { rand(6).times.map { Faker::Lorem.word }.join ', ' }

    factory :movie do
      kind 'movie'
    end

    factory :cartoon do
      kind 'cartoon'
    end
  end
end
