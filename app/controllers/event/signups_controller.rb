class Event::SignupsController < ApplicationController
  before_action :set_event_signup, only: [:show, :edit, :update, :destroy]
  require 'csv'

  # GET /event/signups
  def index
    @event_signups = Event::Signup.all

    respond_to do |format|
      format.csv do
        csv = CSV.generate force_quotes: true do |rows|

          # data rows
          @event_signups.each do |signup|
            rows << [signup.name] + signup.signup_options.map { |k, v| "#{k}: #{v}" }
          end
        end

        send_data(csv, type: 'text/csv', filename: 'signups.csv')
      end
    end
  end

  # GET /event/signups/1
  def show
  end

  def new
    @event_signup = Event::Signup.new
  end

  def edit
  end

  def create
    @event_signup = Event::Signup.new(event_signup_params)

    if @event_signup.save
      Rails.logger.debug @event_signup.inspect
      redirect_to event_path(:diff14), notice: 'Danke für deine Anmeldung.'
    else
      render 'events/static/diff14'
    end
  end

  # PATCH/PUT /event/signups/1
  def update
    if @event_signup.update(event_signup_params)
      redirect_to @event_signup, notice: 'Signup was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /event/signups/1
  def destroy
    @event_signup.destroy
    redirect_to event_signups_url, notice: 'Signup was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_signup
      @event_signup = Event::Signup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_signup_params
      params.require(:event_signup).permit!
    end
end
