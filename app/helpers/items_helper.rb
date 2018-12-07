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
    
    def current_rental(item)
        
        current_rental = false
    
        if item.rentals.count > 0
            item.rentals.each do |rental|
                if !rental.buyer_checkin_confirm || !rental.seller_checkin_confirm
                    current_rental = rental
                end
            end
        end
        
        if current_rental
            current_rental.id
        else
            current_rental
        end
        
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
    
    def buyer_rented(item)
        
        button = false
        
        if item.rentals.count > 0
            item.rentals.each do |rental|
               if rental.user_id == current_user.id && (!rental.buyer_checkin_confirm || !rental.seller_checkin_confirm)
                   puts "CONFIRM"
                   button = true
               end
            end
        end
        
        button
        
    end
    
    def seller_rented(item)
        
        button = false
        
        if item.rentals.count > 0
            item.rentals.each do |rental|
               if rental.item.user_id == current_user.id && (!rental.seller_checkin_confirm || !rental.buyer_checkin_confirm)
                   button = true
               end
            end
        end
        
        button
        
    end
    
    def buyer_checked_in(item)
        
        button = false
        
        if item.rentals.count > 0
            item.rentals.each do |rental|
               if rental.user_id == current_user.id && rental.buyer_checkin_confirm && !rental.seller_checkin_confirm
                   button = true
               end
            end
        end
        
        button
        
    end
    
    def seller_checked_in(item)
        
        button = false
        
        if item.rentals.count > 0
            item.rentals.each do |rental|
               if rental.item.user_id == current_user.id && rental.seller_checkin_confirm && !rental.buyer_checkin_confirm
                   button = true
               end
            end
        end
        
        button
        
    end
end
