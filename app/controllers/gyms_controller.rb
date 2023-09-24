class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    gym = find_gym
    render json: gym
  end

  def destroy
    gym = find_gym
    gym.destroy
    head :no_content
  end

  private

  def find_gym
    Gym.find(params[:id])
  end

  def render_not_found_response
    render json: { errors: "Gym not found" }, status: :not_found
  end

  def render_unprocessable_entity_response exception
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
