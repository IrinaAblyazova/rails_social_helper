class Web::Admin::AdminsController < Web::Admin::ApplicationController
  def index
    @q = Admin.ransack(params[:q])
    @admins = @q.result.all.paginate(page: params[:page]).decorate
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_attrs)

    if @admin.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    admin.destroy

    redirect_to action: :index
  end

  private

  def admin_attrs
    params.require(:admin).permit(:name, :email, :password, :role)
  end
end
