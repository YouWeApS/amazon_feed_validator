RSpec.describe AmazonFeedValidator do
  describe '.new' do
    subject { described_class.new '' }
    it { is_expected.to be_a AmazonFeedValidator::FeedValidator }
  end
end
