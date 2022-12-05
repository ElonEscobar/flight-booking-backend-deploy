class FlightSerializer < ActiveModel::Serializer
  attributes :id, :destination, :departure, :flight_date, :return_date
end
