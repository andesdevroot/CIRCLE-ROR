class CommunitiesController < ApplicationController
before_action :authenticate_account!, except: [ :index, :show  ]


def index
  @communities = Community.all
end

def show
end

def new
end

def create
end




end
