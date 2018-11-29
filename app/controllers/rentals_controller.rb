class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
    
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)
    @item = Item.find(@rental.item_id)
    
    if current_user
      @rental.user_id = current_user.id
      @rental.buyer_checkin_confirm = false
      @rental.seller_checkin_confirm = false
      
      
      
      
      @rental_days = (@rental.rental_end_date - @rental.rental_start_date).to_i/86400
      @rental.total_price = (@rental_days + 1) * @item.price
      @rental.approval = false
      
      puts "RENTAL INFORMATION"
      puts @rental_days
      puts @item.price


        if @rental.save
          #format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
          redirect_to current_user
        else
          format.html { render :new }
          format.json { render json: @rental.errors, status: :unprocessable_entity }
        end
    else
      respond_to do |format|
        flash.now[:danger] = "Please sign in to rent an item."
        format.html { items_path(@item) }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def approve_rental
    puts "HELLO"
    @rental_id = params[:rental_id]
    puts @rental_id
    
    @rental = Rental.find(params[:rental_id])
    
    if current_user
      if current_user.id == @rental.item.user_id
        @rental.approval = true
        @rental.save
      else
        puts "FAIL1"
      end
    else
      puts "FAIL2"
    end
    
    redirect_to current_user
    
  end
  
  def deny_rental
    puts "HELLO"
    @rental_id = params[:rental_id]
    puts @rental_id
    
    @rental = Rental.find(params[:rental_id])
    
    if current_user
      if current_user.id == @rental.item.user_id
        @rental.destroy
      else
        puts "FAIL1"
      end
    else
      puts "FAIL2"
    end
    
    redirect_to current_user
    
  end
  
  def buyer_rental_rating
    puts "LETS GO"
    puts params[:rental_id]
    puts params[:rating]
    
    if current_user
      
      rental = Rental.find(params[:rental_id])
      
      if current_user.id == rental.user_id 
        puts "HELLO1"
        if params[:rating].to_i.between?(1, 5) && !rental.buyer_rating
          puts "HELLO2"
          rental.buyer_rating = params[:rating]
          rental.save
        end
      end
      
      redirect_to current_user
    else
      redirect_to root_path
    end
  end
  
  def seller_rental_rating
    puts "LETS GO"
    puts params[:rental_id]
    puts params[:rating]
    
    
    if current_user
      
      rental = Rental.find(params[:rental_id])
      puts rental.item.user_id
      
      if current_user.id == rental.item.user_id 
        if params[:rating].to_i.between?(1, 5) && !rental.seller_rating
          rental.seller_rating = params[:rating]
          rental.save
        end
      end
      
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.permit(:user_id, :item_id, :rental_start_date, :rental_end_date, :buyer_checkin_confirm, :seller_checkin_confirm, :total_price, :assistance, :assistance_reason, :comment)
    end
end
