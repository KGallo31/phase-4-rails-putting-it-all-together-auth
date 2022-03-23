class RecipesController < ApplicationController
    def index
        user = User.find_by(id: session[:user_id])
        if user
            render json: Recipe.all, include: [:user], status: :ok
        else
            render json: {errors:["Not authorized"]}, status: :unauthorized
        end
    end

    def create
        user = User.find_by(id: session[:user_id])
        # recipe = Recipe.create(title: params[:title],instructions: params[:instructions],minutes_to_complete: params[:minutes_to_complete],user_id: user.id)
        if user
            recipe = Recipe.create(title: params[:title],instructions: params[:instructions],minutes_to_complete: params[:minutes_to_complete],user_id: user.id)
            if recipe.valid?
                render json: recipe, include: [:user],status: 201
            else
                render json: {errors: ["Unprocessable entity"]}, status: 422
            end
        else
            render json: {errors: ["Unauthorized user"]}, status: 401
        end
    end


    private 

    def recipe_params
        params.permit(:title,:instructions,:minutes_to_complete)
    end

end
