class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @userid = @item.user_id
    @user = User.find(@userid)
    @latitude = @user.latitude
    @longitude = @user.longitude
    @city = @user.city
    @state = @user.state
    
    @status = "checked_in"
    if @item.rentals.count > 0
      @item.rentals.each do |rental|
        if !rental.buyer_checkin_confirm || !rental.seller_checkin_confirm
          @status = "checked_out"
        end
      end
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    
    if logged_in?
      puts "User logged in, can create item."
      puts current_user.username
      
      @item.user_id = current_user.id
      
      if @item.save
        flash.now[:success] = "Item was successfully added!"
        redirect_to action: "index"
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
      
    else
      flash.now[:danger] = "You are not logged in, login to add an item!"
        respond_to do |format|
            format.html { render :new }
            format.json { render json: @item.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    
    if logged_in?
      if @item.user_id == current_user.id
        if @item.update(item_params)
          flash.now[:success] = "Item was successfully updated!"
          redirect_to action: "index"
        else
          respond_to do |format|
            format.html { render :edit }
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
      else
        flash.now[:danger] = "This is not your item, it was not updated!"
        respond_to do |format|
            format.html { render :edit }
            format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    else
      flash.now[:danger] = "You are not logged in, login to update an item that is yours!"
        respond_to do |format|
            format.html { render :edit }
            format.json { render json: @item.errors, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :serial_no, :name, :tag, :location, :price, :brand, :model, :status, images: [])
    end
end
