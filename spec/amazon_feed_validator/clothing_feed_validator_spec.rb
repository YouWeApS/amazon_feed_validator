require 'spec_helper'

RSpec.describe AmazonFeedValidator::FeedValidator do
  describe '#validate' do
    subject { instance.validate }

    describe 'clothing' do
      let(:instance) { described_class.new(feed, name: 'ProductClothing') }

      context 'size/color variation' do
        include_context :clothing_size_color_master

        it_behaves_like :passed_validation

        context 'invalid information' do
          include_context :clothing_size_color_master, { type: 'bbbb' }

          it_behaves_like :failed_validation, errors: [
            "7:0: ERROR: Element 'ClothingType': [facet 'enumeration'] The value 'bbbb' is not an element of the set {'Shirt', 'Sweater', 'Pants', 'Shorts', 'Skirt', 'Dress', 'Suit', 'Blazer', 'Outerwear', 'SocksHosiery', 'Underwear', 'Bra', 'Shoes', 'Hat', 'Bag', 'Accessory', 'Jewelry', 'Sleepwear', 'Swimwear', 'PersonalBodyCare', 'HomeAccessory', 'NonApparelMisc', 'Kimono', 'Obi', 'Chanchanko', 'Jinbei', 'Yukata', 'EthnicWear', 'Costume', 'AdultCostume', 'BabyCostume', 'ChildrensCostume'}.",
            "7:0: ERROR: Element 'ClothingType': 'bbbb' is not a valid value of the local atomic type."
          ]
        end
      end
    end
  end
end
