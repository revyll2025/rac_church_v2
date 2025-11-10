class PagesController < ApplicationController
  def home
    # Fetch daily verse from API
    @daily_verse = fetch_daily_verse
    # Charger les sermons et événements récents pour la page d'accueil
    @recent_sermons = Sermon.recent.limit(3)
    @upcoming_events = Event.upcoming.limit(3)
  end

  def about
  end

  def sermons
    @sermons = Sermon.recent
  end

  def show_sermon
    @sermon = Sermon.find(params[:id])
  end

  def events
    @events = Event.upcoming
  end

  def show_event
    @event = Event.find(params[:id])
  end

  def contact
  end

  private

  def fetch_daily_verse
    # Using Bible Gateway API for daily verse
    # Note: You'll need to sign up for an API key at https://api.biblegateway.com/
    begin
      response = HTTP.get("https://api.biblegateway.com/v3/verse/?key=YOUR_API_KEY&version=LSG&reference=random")
      JSON.parse(response.body.to_s)
    rescue => e
      # Fallback verse in case of API failure
      {
        "text" => "Car Dieu a tant aimé le monde qu'il a donné son Fils unique, afin que quiconque croit en lui ne périsse point, mais qu'il ait la vie éternelle.",
        "reference" => "Jean 3:16"
      }
    end
  end
end 