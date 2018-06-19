FactoryGirl.define do
  factory :product_attachments do
    photo        { File.open(File.join(Rails.root, 'spec', 'fixtures', 'images', 'test_file.png')) }
    product

  end
end
