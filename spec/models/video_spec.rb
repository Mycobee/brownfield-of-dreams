require "rails_helper"

describe Video, type: :model do
  describe "validations" do
    it {should validate_presence_of :position}
  end
end
