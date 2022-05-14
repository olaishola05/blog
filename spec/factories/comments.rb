FactoryBot.define do
  factory :comment do
    text { 'Comments' }
    user_id { 1 }
    post_id { 1 }
  end
end
