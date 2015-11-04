require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "get player infor" do
    it "should success and return player info" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
