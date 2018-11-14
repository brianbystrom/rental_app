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
      @rental.total_price = @rental_days * @item.price
      @rental.approval = false

      respond_to do |format|
        if @rental.save
          puts
          format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
          format.json { render :show, status: :created, location: @rental }
        else
          format.html { render :new }
          format.json { render json: @rental.errors, status: :unprocessable_entity }
        end
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
