require 'rails_helper'
Sidekiq::Testing.fake!

RSpec.describe UpdateFeedsWorker, type: :worker do
  context 'when enqueued' do
    it "is the default queue" do
      described_class.perform_async
      assert_equal "default", described_class.queue
    end
  end
end
