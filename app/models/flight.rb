class Flight < ApplicationRecord
    belongs_to :user

    validates :destination, presence: true
    validates :departure, presence: true
    validates :flight_date, presence: true
    # validates :user_id, presence: true

end
