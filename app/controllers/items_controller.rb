class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    if params[:search]
      puts "CAME HERE"
      @items = Item.where("tag like ?", "%#{params[:search]}%")
    else
      puts "ALL"
      @items = Item.all
    end
    
    puts @items.count
  end

  # GET /items/1
  # GET /items/1.json
  def show
    
    @tags = @item.tag.split(',')
    @user_location = request.location.ip
    @distance = @item.user.distance_to(@user_location)
    @similar_items = Item.where("tag like ?", "%#{@tags[0]}%").where.not(user_id: @item.user_id).where.not(:id => Rental.where(buyer_checkin_confirm: false).or(Rental.where(seller_checkin_confirm: false)))
    @user_other_items = @item.user.items.where.not(id: @item.id).where.not(:id => Rental.where(buyer_checkin_confirm: false).or(Rental.where(seller_checkin_confirm: false)))
    
    @rental_buyer_history = Rental.where(user_id: @item.user.id).where(buyer_checkin_confirm: true).where(seller_checkin_confirm: true)
    @rental_seller_history = Rental.where(item_id: @item.user.items).where(buyer_checkin_confirm: true).where(seller_checkin_confirm: true)
    
    @rating_sum = 0
    @rating_count = 0
    
    if @rental_buyer_history.count > 0
      @rental_buyer_history.each do |brental|
        if brental.seller_rating
          @rating_sum = @rating_sum + brental.seller_rating
          @rating_count = @rating_count + 1
        end
      end
    end
    
    if @rental_seller_history.count > 0
      @rental_seller_history.each do |srental|
        if srental.buyer_rating
          @rating_sum = @rating_sum + srental.buyer_rating
          @rating_count = @rating_count + 1
        end
      end
    end
    
    puts "RATING SUM: " + @rating_sum.to_s
    puts "RATING COUNT: " + @rating_count.to_s
    
    if @rating_count > 0
      @rating = (@rating_sum / @rating_count).ceil
    else
      @rating = 0
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
        redirect_to current_user
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
      params.permit(:user_id, :serial_no, :name, :tag, :location, :price, :brand, :model, :description, :status, images: [])
    end
end
