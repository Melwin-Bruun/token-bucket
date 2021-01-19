class Token_bucket
    
 
    def initialize(token_count, refil_time)
        @token_count = token_count
        @refil_time = refil_time
        @last_refill = Time.now
        
        @max_token_count = @token_count
        @refil_time_in_seconds = @refil_time
    
    end 


    def max_token_count
        return @max_token_count
    end 

    def refil_time_in_seconds
        return @refil_time_in_seconds
    end 

    def time_for_next_refill()
    
        if(@last_refill + @refil_time  <= Time.now)
            refil_tokens() 
        else 
            puts "time to next refill is #{@last_refill + @refil_time - Time.now}" 
        end 
        
    end 

    def tokens_left()
        time_for_next_refill()
        return @token_count
    end 

    def request_alloweed()
        if tokens_left() > 0 
            return true 
        else 
            return false 
        end 

    end 

    def request_sent()
        if request_alloweed() == true 
            puts "seding request"
            @token_count -= 1 
            puts "token count is #{@token_count}"
        else 
            puts "request not sent not enough tokens in bucket wait for refill #{@last_refill + @refil_time - Time.now}"
        end 

    end 

    def refil_tokens()
        #system med tids som refillar den 
        @token_count = @max_token_count
        @last_refill = Time.now
    end 



end 


