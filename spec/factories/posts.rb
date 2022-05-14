FactoryBot.define do
  factory :post do
    title { 'post title' }
    text { 'lorem ipsum' }
    user_id { nil }
  end
end
