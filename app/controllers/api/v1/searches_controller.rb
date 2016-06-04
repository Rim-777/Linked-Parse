class Api::V1::SearchesController < Api::V1::BaseController
  before_action :init_search, only: :search

  def search
    @result = @search.result
    return_result
  end

  private
  def init_search
    @search = SearchService.new(query, category)
  end

  def return_result
    if category == 'user'
      render json: {users: @result.as_json(include: [:skills, :educations, :experiences])}
    else
      respond_with (@result)
    end
  end

  def query
    params[:query]
  end

  def category
    params[:category]
  end
end
