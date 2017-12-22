class EventsController < ApplicationController
  def index
  end

  def show
    @event = params[:id]
    @event_signup = Event::Signup.new

    return unless ['diff14'].include?(@event)

    render "events/static/#{@event}"
  end
end