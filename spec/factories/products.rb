FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Test Title #{n}"}
    description {'Test description'}
    image_url {'sexy.jpeg'}
    price {1}
  end
  factory :invalid_product, parent: :product do
    price {-1}
  end
end