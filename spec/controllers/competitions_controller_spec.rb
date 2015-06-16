require 'rails_helper'



RSpec.describe Api::V1::CompetitionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Competition. As you add validations to Competition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {{skill_id: 1}}

  let(:invalid_attributes) {{}}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompetitionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all competitions as @competitions" do
      competition = Competition.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:competitions)).to eq([competition])
    end
  end

  describe "GET #show" do
    it "assigns the requested competition as @competition" do
      competition = Competition.create! valid_attributes
      get :show, {:id => competition.to_param}, valid_session
      expect(assigns(:competition)).to eq(competition)
    end
  end

  describe "GET #new" do
    it "assigns a new competition as @competition" do
      get :new, {}, valid_session
      expect(assigns(:competition)).to be_a_new(Competition)
    end
  end

  describe "GET #edit" do
    it "assigns the requested competition as @competition" do
      competition = Competition.create! valid_attributes
      get :edit, {:id => competition.to_param}, valid_session
      expect(assigns(:competition)).to eq(competition)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Competition" do
        expect {
          post :create, {:competition => valid_attributes}, valid_session
        }.to change(Competition, :count).by(1)
      end

      it "assigns a newly created competition as @competition" do
        post :create, {:competition => valid_attributes}, valid_session
        expect(assigns(:competition)).to be_a(Competition)
        expect(assigns(:competition)).to be_persisted
      end

      it "redirects to the created competition" do
        post :create, {:competition => valid_attributes}, valid_session
        expect(response).to redirect_to(Competition.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved competition as @competition" do
        post :create, {:competition => invalid_attributes}, valid_session
        expect(assigns(:competition)).to be_a_new(Competition)
      end

      it "re-renders the 'new' template" do
        post :create, {:competition => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => new_attributes}, valid_session
        competition.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested competition as @competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => valid_attributes}, valid_session
        expect(assigns(:competition)).to eq(competition)
      end

      it "redirects to the competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => valid_attributes}, valid_session
        expect(response).to redirect_to(competition)
      end
    end

    context "with invalid params" do
      it "assigns the competition as @competition" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => invalid_attributes}, valid_session
        expect(assigns(:competition)).to eq(competition)
      end

      it "re-renders the 'edit' template" do
        competition = Competition.create! valid_attributes
        put :update, {:id => competition.to_param, :competition => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested competition" do
      competition = Competition.create! valid_attributes
      expect {
        delete :destroy, {:id => competition.to_param}, valid_session
      }.to change(Competition, :count).by(-1)
    end

    it "redirects to the competitions list" do
      competition = Competition.create! valid_attributes
      delete :destroy, {:id => competition.to_param}, valid_session
      expect(response).to redirect_to(competitions_url)
    end
  end

end
