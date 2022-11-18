# class UsersController < ApplicationController
#   before_action :set_user, only: %i[show edit update destroy]

#   def index
#     @user = current_user
#   end

#   def show
#   end

#   def new
#   end

#   def create
#   end

#   def edit
#   end

#   def update
#   end

#   def delete
#   end

#   def destroy
#   end

# end

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @user = current_user
  end
end
