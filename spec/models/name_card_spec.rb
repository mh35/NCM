require 'rails_helper'

RSpec.describe NameCard, type: :model do
  describe 'validation' do
    context 'valid name_card' do
      let(:name_card_simple) { build(:name_card, :shizuka) }
      let(:name_card_with_free_text_and_pass) { build(:name_card, :chihaya, :free_text, :password) }

      it 'is valid (simple)' do
        expect(User.find(name_card_simple.user_id)).not_to eq(nil)
        expect(name_card_simple.valid?).to eq(true)
      end

      it 'is valid (with free text and password)' do
        expect(User.find(name_card_with_free_text_and_pass.user_id)).not_to eq(nil)
        expect(name_card_with_free_text_and_pass.valid?).to eq(true)
      end
    end

    context 'invalid name_card' do
      let(:empty_name) { build(:name_card, :shizuka, :empty_name) }
      let(:empty_card_name) { build(:name_card, :chihaya, :empty_card_name) }

      it 'is invalid (empty name)' do
        expect(empty_name.valid?).to eq(false)
      end

      it 'is invalid (empty card name)' do
        expect(empty_card_name.valid?).to eq(false)
      end
    end
  end
end
