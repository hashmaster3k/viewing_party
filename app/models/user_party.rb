class UserParty < ApplicationRecord
  belongs_to :party
  validates :host_id, :invitee_id, presence: true
end
