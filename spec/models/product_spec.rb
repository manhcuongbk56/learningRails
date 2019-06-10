require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'product' do
    it 'must have enough field' do
      product = Product.new
      expect(product.invalid?).to be true
      expect(product.errors[:title].any?).to be true
      expect(product.errors[:description].any?).to be true
      expect(product.errors[:price].any?).to be true
      expect(product.errors[:image_url].any?).to be true
    end

    it 'must have positive price' do
      product = Product.new(title: 'My title',
                            description: 'My description',
                            image_url: 'my_image.jpg')
      product.price = -1
      expect(product.invalid?).to be true
      expect(product.errors[:price]).to include('must be greater than or equal to 0.01')
      product.price = 1
      expect(product.valid?).to be true
    end
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:image_url) }
    it { should allow_value('cuong.jpg').for(:image_url) }
    it { should allow_value('cuong.jpeg').for(:image_url) }
    it { should allow_value('cuong.png').for(:image_url) }
    it { should allow_value('cuong.gif').for(:image_url) }
    it { should_not allow_value('cuong.ahihi').for(:image_url) }
    it { should validate_uniqueness_of(:title) }
  end
end
