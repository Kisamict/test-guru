class Admin < User
  validates :fname, :lname, presence: true
end
