class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /shops
  # GET /shops.json
  def index
    @user = current_user.isAdmin
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @shops = Shop.find(params[:id])
  end

  # GET /shops/new
  def new
    if !current_user.isAdmin?
      redirect_to shops_path
    else
      @shops = Shop.new
  end
 end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    if !current_user.isAdmin?
      redirect_to shops_path
    else
      @shops = Shop.new(shop_params)
      respond_to do |format|
        if @shops.save
          format.html { redirect_to @shops, notice: 'Shop was successfully created.' }
          format.json { render :show, status: :created, location: @shops }
        else
          format.html { render :new }
          format.json { render json: @shops.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    if !current_user.isAdmin?
      redirect_to shops_path
    else
    respond_to do |format|
      if @shops.update(shop_params)
        format.html { redirect_to @shops, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shops }
      else
        format.html { render :edit }
        format.json { render json: @shops.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    if !current_user.isAdmin?
      redirect_to shops_path
    else
    @shops.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shops = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name)
    end
end
