# frozen_string_literal: true

FactoryBot.define do
  factory :video do
    title { Faker::Pokemon.name }
    description { Faker::SiliconValley.motto }
    video_id { Faker::Crypto.md5 }
    sequence :position do |n|
      "#{n}"
    end
    tutorial
  end
end
