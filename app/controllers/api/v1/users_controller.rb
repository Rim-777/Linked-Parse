class Api::V1::UsersController < Api::V1::BaseController
  before_action :init_import, only: :create

  def index
    @users = User.all
    render json: {users: @users.as_json(include: [:skills, :educations, :experiences])}
  end

  def create
    @user = @import.person
    render json: {user: @user.as_json(include: [:skills, :educations, :experiences])}
  end

  private
  def init_import
    @import = UserImportService.new(params[:linked_url])
  end
end
