module Member
  class EventsController < Member::BaseController
    def index
      @events = Event.upcoming
    end

    def show
      @event = Event.find(params[:id])
    end
  end
end

