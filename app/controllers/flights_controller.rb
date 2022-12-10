class FlightsController < ApplicationController
    wrap_parameters format: []
     skip_before_action :authorize, only: [ :destroy]

    def index
        user = User.find_by(id: session[:user_id])
        flights = user.flights
        
        render json: flights, include: :user
        # render json: Flight.all
    end

    def show
        flights = Flight.find(params[:id])
        render json: flights
    end

    def destroy
        flight = Flight.find(params[:id])
        flight.destroy
        head :no_content
    end

    def create
        
        new_flight = @current_user.flights.create!(new_flight_params)
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
        params.permit(:destination, :departure, :flight_date, :return_date )
    end

    # def authorize
    #     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    # end
end
