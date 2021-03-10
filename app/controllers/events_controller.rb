class EventsController < ApplicationController
  
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    user = User.find(session[:user_id])
    @event = Event.new(event_params)
    @event.creator = user

    if @event.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  private
  
  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
