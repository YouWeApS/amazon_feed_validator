RSpec.shared_examples :failed_validation do |errors:|
  before { subject }
  it { is_expected.to eql false }
  it { expect(instance.errors).to match_array errors }
end

RSpec.shared_examples :passed_validation do
  before { subject }
  it { is_expected.to eql true }
  it { expect(instance.errors).to be_empty }
end
