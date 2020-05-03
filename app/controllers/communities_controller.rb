class CommunitiesController < ApplicationController
before_action :authenticate_account!, except: [ :index, :show ]
before_action :set_community, only: [:show]



def index
  @communities = Community.all
end

def show
  @community = Community.find(params[:id])
end

def new
  @community = Community.new
end

def create

    @community = Community.new (community_params)
    @community.account_id = current_account.id

     if @community.save
       redirect_to communities_path
     else
       render :new
      end
  end
#   @community = Community.new(community_params)
#
#   respond_to do |format|
#     if @community.save
#       format.html { redirect_to @community, notice: 'Communite was successfully created.' }
#       format.json { render action: 'show', status: :created, location: @community }
#     else
#       format.html { render action: 'new' }
#       format.json { render json: @community.errors, status: :unprocessable_entity }
#     end
#   end
# end



private

def set_community
  @community = Community.find(param[:id])
end

def community_params
   params.require(:community).permit(:name, :url, :rules)
end

end
