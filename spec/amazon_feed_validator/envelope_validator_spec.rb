require "spec_helper"

RSpec.describe AmazonFeedValidator::FeedValidator do
  describe '#validate' do
    subject { instance.validate }

    describe 'empty envelope' do
      include_context :empty_envelope

      let(:instance) { described_class.new(feed, name: 'amzn-envelope') }

      it_behaves_like :failed_validation, errors: [
        "2:0: ERROR: Element 'AmazonEnvelope': Missing child element(s). Expected is one of ( EffectiveDate, Message )."
      ]
    end
  end
end
