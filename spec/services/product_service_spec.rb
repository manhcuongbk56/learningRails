require 'rails_helper'

describe ProductService do
  let(:valid_attributes) do
    {
        title: 'Product Title',
        description: 'Product description',
        price: 1.00,
        image_url: 'image.jpg'
    }
  end

  let(:attributes) { %i[title description price image_url] }

  let(:invalid_attributes) { {description: nil} }

  context 'create_product!' do
    it 'creates product with valid attributes successfully' do
      product = ProductService.create_product!(valid_attributes)
      attributes.each do |attr|
        expect(product.send(attr)).to eql(valid_attributes[attr])
      end
    end

    it 'fail to create product with invalid attribute' do
      expect {ProductService.create_product!(invalid_attributes)}. to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'update_product!' do
    let(:product) {FactoryBot.create(:product)}

    it 'updates product with valid attributes successfully' do
      updated_product = ProductService.update_product!(product, valid_attributes)
      attributes.each do |attr|
        expect(updated_product.send(attr)).to eql(valid_attributes[attr])
      end
    end

    it 'fail to update product with invalid attribute' do
      expect {ProductService.update_product!(product, invalid_attributes)}. to raise_error(ActiveRecord::RecordInvalid)
    end

  end

end