FactoryBot.define do
  factory :mail_digest do
    title { Faker::Book.title }
    description { Faker::Quotes::Shakespeare.as_you_like_it_quote }
    update_frequency { 1 }

    factory :digest_with_feed do
      transient do
        feed_count {3}
      end

      after(:create) do |mail_digest, evaluator|
        create_list(:feed, evaluator.feed_count, mail_digest: mail_digest)
      end
    end

    factory :digest_with_feed_no_url do
      transient do
        feed_count {1}
      end

      after(:create) do |mail_digest, evaluator|
        create_list(:feed, evaluator.feed_count, mail_digest: mail_digest, url: nil)
      end
    end
  end
end
