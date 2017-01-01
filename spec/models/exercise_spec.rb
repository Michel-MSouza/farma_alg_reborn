require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe "Validations -->" do
    let(:exercise) { build(:exercise) }

    it "is valid with valid attributes" do
      expect(exercise).to be_valid
    end

    it "is invalid with empty title" do
      exercise.title = ""
      expect(exercise).to_not be_valid
    end

    it "is invalid with empty description" do
      exercise.description = ""
      expect(exercise).to_not be_valid
    end
  end

  describe "Relationships -->" do
    it "belongs to user" do
      expect(relationship_type(Exercise, :user)).to eq(:belongs_to)
    end

    it "has many questions" do
      expect(relationship_type(Exercise, :questions)).to eq(:has_many)
    end
  end
end
