require "spec_helper"

RSpec.describe AmazonFeedValidator::FeedValidator do
  describe '#validate' do
    subject { instance.validate }

    context 'empty envelope' do
      include_context :empty_envelope

      let(:instance) { described_class.new(feed, name: 'amzn-envelope') }

      it { is_expected.to eql false }

      it 'stores the errors' do
        subject
        expect(instance.errors).to match_array [
          "2:0: ERROR: Element 'AmazonEnvelope': Missing child element(s). Expected is one of ( EffectiveDate, Message )."
        ]
      end
    end
  end
end
