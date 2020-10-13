class UserParty < ApplicationRecord
  belongs_to :party
  validates_presence_of :host_id, :invitee_id
end
