class GameController < ApplicationController
    def reset
        session[:secretnum]=rand(100)
        cookies[:tries]=0
        cookies[:oldguesses]=""
    end
    def landing
        cookies[:username]= params[:username]
    end
    def try
        @guess = params[:guess].to_i
        cookies[:oldguesses]="#{cookies[:oldguesses]} #{params[:guess]}"
        secret=session[:secretnum].to_i
        @message=""
        if @guess == secret
            @result = "right!"
            if cookies[:tries].to_i<5
                @message = "YOU GET A GOLD MEDAL!"
            elsif cookies[:tries].to_i<10
                @message = "YOU GET A SILVER MEDAL."
            elsif cookies[:tries].to_i<20
                @message = "YOU GET A BRONZE MEDAL :("
            else
                @message= ""
            end
        elsif @guess < secret
            @result = "too low."
        elsif @guess > secret
            @result = "too high."
        else
            @result = "something went wrong"
        end
        cookies[:tries]=cookies[:tries].to_i+1
        if cookies[:tries].to_i ==1
            @proximity==""
        elsif (cookies[:previousguess].to_i-secret).abs <=(@guess-secret).abs
                @proximity="Getting colder..."
        elsif @guess==secret
                @proximity=""
        else
                @proximity="Getting warmer..."
        end
        cookies[:previousguess]=@guess
    end
end
