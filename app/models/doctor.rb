class Doctor < ActiveRecord::Base
  has_many :interns, dependent: :destroy
  has_many :appointments, dependent: :destroy

  has_many :patients, through: :appointments

  validates :first_name, :last_name, presence: true, length: { minimum: 3 }
  validates :first_name, uniqueness: { scope: :last_name }

end