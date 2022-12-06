class FlightsController < ApplicationController
    wrap_parameters format: []
    def index
        render json: Flight.all
    end

    def destroy
        flight = Flight.find(params[:id])
        flight.destroy
        head :no_content
    end

    def create
        new_flight = Flight.create!(new_flight_params)
        render json: new_flight, status: :created

    rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def update
        new_flight = Flight.find(params[:id])
        if new_flight
            new_flight.update!(new_flight_params)
            render json: new_flight, status: :ok
        else
            render json: { error: "Flight not found" }, status: :not_found
        end
        
    end

    private

    def new_flight_params
        params.permit(:destination, :departure, :flight_date, :return_date, :user_id)
    end
end
