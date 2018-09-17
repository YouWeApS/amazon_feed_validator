require "spec_helper"

RSpec.describe AmazonFeedValidator::FeedValidator do
  describe '#validate' do
    subject { instance.validate }

    describe 'beauty' do
      let(:instance) { described_class.new(feed, name: 'Beauty') }

      context 'size/color variation' do
        include_context :fragrance_size_scent_master

        it_behaves_like :passed_validation

        context 'invalid type' do
          include_context :fragrance_size_scent_master, type: 'bob'

          it_behaves_like :failed_validation, errors: [
            "3:0: ERROR: Element 'bob': This element is not expected. Expected is one of ( BeautyMisc, SkinCareProduct, HairCareProduct, BodyCareProduct, MakeUp, Fragrance, HairRemovalAndShavingProduct )."
          ]
        end
      end
    end
  end
end
