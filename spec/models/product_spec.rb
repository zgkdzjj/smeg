require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) }

  # context "Validations" do
  #   subject { product }
  #   it { is_expected.to validate_presence_of(:model_number) }
  #   # it { is_expected.to validate_presence_of(:type) }

  #   it { is_expected.to validate_uniqueness_of(:model_number).case_insensitive }
  # end

  # context 'validate type' do
  #   let(:product) { build(:product, type: nil) }

  #   before do
  #     product.save
  #   end

  #   it 'should set the type' do
  #     expect(product.type).to_not be_nil
  #   end

  # end
end
