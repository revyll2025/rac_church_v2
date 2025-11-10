module Member
  class SermonsController < Member::BaseController
    def index
      @sermons = Sermon.recent
    end

    def show
      @sermon = Sermon.find(params[:id])
    end
  end
end

