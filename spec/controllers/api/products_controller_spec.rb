require 'rails_helper'

describe Api::ProductsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: 'Controller Title', description: 'Controller Description', image_url: "sexy.jpeg", price: '1.0' }
  }

  let(:invalid_attributes) {
    {title: 'Controller Title', description: 'Controller Description', image_url: "sex2222y.jpssseg", price: 1 }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session, format: :json
      expect(response).to be_successful
    end

    it 'returns a list of products in json format' do
      FactoryBot.create_list(:product, 5)
      get :index
      expect(response.status).to eql(200)
      body = JSON.parse(response.body)
      expect(body.size).to eql(5)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :show, params: {id: product.to_param}, session: valid_session, format: :json
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: valid_attributes}, session: valid_session, format: :json
        }.to change(Product, :count).by(1)
      end

      it 'renders the product in json format with status :created' do
        post :create, params: {product: valid_attributes}, session: valid_session, format: :json
        expect(response.status).to eql(201)

        body = JSON.parse(response.body)
        valid_attributes.keys.each do |key|
          expect(valid_attributes[key]).to eql(body[key.to_s])
        end
      end
    end

    context 'with invalid params' do
      it 'renders error with :unprocessable_entity' do
        post :create, params: {product: invalid_attributes}, session: valid_session, format: :json
        expect(response.status).to eql(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {price: 1000}
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: new_attributes}, session: valid_session, format: :json
        product.reload
        expect(product.price).to eq(1000)
      end

      it 'renders the product in json format with status :ok' do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: valid_attributes}, session: valid_session, format: :json
        expect(response.status).to eql(200)

        body = JSON.parse(response.body)
        valid_attributes.keys.each do |key|
          expect(valid_attributes[key]).to eql(body[key.to_s])
        end
      end
    end

    context "with invalid params" do
      it "returns a 422 response" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: invalid_attributes}, session: valid_session, format: :json
        expect(response.status).to eql(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, params: {id: product.to_param}, session: valid_session, format: :json
      }.to change(Product, :count).by(-1)
    end

    it 'returns :head with :no_content' do
      product = Product.create! valid_attributes
      delete :destroy, params: {id: product.to_param}, session: valid_session, format: :json
      expect(response.status).to eql(204)
    end
  end

end
