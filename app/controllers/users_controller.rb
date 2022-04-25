class UsersController < ApplicationController
    def index 
        render 'index'
    end

    def show
        params[:id]

        puts params
        render show
    end
end