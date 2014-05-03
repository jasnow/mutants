require 'spec_helper'

describe Mutants::GroupsController do
  describe '#new' do
    it 'instantiates a group empty object' do
      get :new

      expect(assigns(:group)).to be_a(Mutants::Group)
      expect(assigns(:group)).to be_new_record
    end
  end

  describe '#create' do
    context 'when params allow the group to be saved' do
      let(:params) { {name: SecureRandom.hex} }
      it 'creates a group successfully and redirects to edit path' do
        expect do
          post :create, :mutants_group => params
        end.to change { Mutants::Group.count }.by(1)

        created_group = Mutants::Group.last
        expect(response).to redirect_to(edit_group_path(created_group))
        expect(flash[:notice]).to eq('Group has been created successfully!')
      end
    end

    context 'when params do not allow the group to be saved' do
      let(:params) { {name: nil} }
      it 'does not create the group and renders new' do
        expect do
          post :create, :mutants_group => params
        end.to_not change { Mutants::Group.count }

        expect(response.status).to eq(422)
        expect(flash[:alert]).to eq('Group cannot be created')
        assigned_group = assigns(:group)
        expect(assigned_group).to be_a(Mutants::Group)
        expect(assigned_group).to be_a_new_record
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#edit' do
    let(:group) { create :group }
    it 'instantiates a group based on the id in the params' do
      get :edit, :id => group.to_param

      expect(response.status).to eq(200)
      expect(assigns(:group).id).to eq(group.id)
    end
  end

  describe '#update' do
    let(:group) { create :group }
    let(:params) { {name: new_name} }
    context 'when update params are ok' do
      let(:new_name) { SecureRandom.hex }
      it 'can update the name of a group' do
        put :update, id: group.to_param, mutants_group: params

        expect(response).to redirect_to(edit_group_path(group))
        expect(group.reload.name).to eq(new_name)
      end
    end

    context 'when update params are not ok' do
      let(:new_name) { nil }
      it 'fails to update and renders edit' do
        put :update, id: group.to_param, mutants_group: params

        expect(response.status).to eq(422)
        expect(response).to render_template(:edit)
      end
    end
  end
end