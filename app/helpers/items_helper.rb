module ItemsHelper
    
    def checked_in(item)
        
        status = true
        
        if item.rentals.count > 0
            item.rentals.each do |rental|
                if !rental.buyer_checkin_confirm || !rental.seller_checkin_confirm
                    status = false
                end
            end
        end
        
        status
    end 
    
    def pending(item)
        
        pending = false
        
        if item.rentals.count > 0
            item.rentals.each do |rental|
                if !rental.approval
                    pending = true
                end
            end
        end
        
        pending
    end 
end
