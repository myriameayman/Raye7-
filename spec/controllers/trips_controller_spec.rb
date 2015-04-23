require 'rails_helper'
require 'spec_helper'

RSpec.describe TripsController, :type => :controller do
describe "GET #index" do
  it "populates an array of trips" do
    
    get :index
    assigns(:trips).should eq([contact])
  end
end
end
