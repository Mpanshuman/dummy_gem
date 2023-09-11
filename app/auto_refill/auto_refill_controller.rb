module AutoRefill
    class AutoRefillController < ApplicationController
        def show
            AutoRefill.all 
        end
    end
end