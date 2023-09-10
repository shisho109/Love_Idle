class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @events = Event.all
    end
    def new
        @event = Event.new
      end
    
      def create
        event = Event.new(event_params)
        event.user_id = current_user.id
        if event.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @event = Event.find(params[:id])
        @opinions = @event.opinions
        @opinion = Opinion.new
      end

      def edit
        @event = Event.find(params[:id])
      end

      def update
        event = Event.find(params[:id])
        if event.update(event_params)
          redirect_to :action => "show", :id => event.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        event = Event.find(params[:id])
        event.destroy
        redirect_to action: :index
      end
    
      private
      def event_params
        params.require(:event).permit(:title, :idea)
      end
end