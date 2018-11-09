module ItemsHelper
    
    def check_status(item)
        if item.rentals.count > 0
            item.rentals.each do |rental|
                if !rental.buyer_checkin_confirm || !rental.seller_checkin_confirm
                    "checked_out"
                end
            end
        end
        
        "checked_in"
    end 
end
