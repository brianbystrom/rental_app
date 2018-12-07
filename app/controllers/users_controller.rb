class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
    if !@user
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @rentals = @user.rentals.where(buyer_checkin_confirm: false).or(Rental.where(seller_checkin_confirm: false))
      @pending_items = Rental.where(item_id: @user.items).where(approval: false)
      puts "RENTALS: " + @rentals.count.to_s
      puts "PENDING: " + @pending_items.count.to_s
      @rental_buyer_history = Rental.where(user_id: params[:id]).where(buyer_checkin_confirm: true).where(seller_checkin_confirm: true)
      @rental_seller_history = Rental.where(item_id: @user.items).where(buyer_checkin_confirm: true).where(seller_checkin_confirm: true)
      #@rental_history = @rental_buyer_history + @rental_seller_history
      puts "BUYER HISTORY: " + @rental_buyer_history.count.to_s
      puts @rental_buyer_history
      puts "SELLER HISTORY: " + @rental_seller_history.count.to_s
      puts @rental_seller_history
      #@ip_addr = request.env[‘REMOTE_ADDR’]
      
      @comments = Comment.where(commented_id: params[:id])
      
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
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    
    @user.admin = false
    @user.status = false


      if @user.save
        redirect_to action: "index", controller: "home"
        #format.json { render :show, status: :created, location: @user }
      else
        #format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
        redirect_to action: "index", controller: "home"
      end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit(:fname, :lname, :email, :username, :password, :status, :admin, :street, :city, :state, :zip, :latitude, :longitude)
    end
end
