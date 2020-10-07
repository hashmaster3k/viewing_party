require 'rails_helper'
RSpec.describe Friend do
  
  describe "relations" do
    it {should belong_to :follower}
    it {should belong_to :followee}
  end
end