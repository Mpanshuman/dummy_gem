class AutoRefill::Refill 
    def initialize(source_id, start_date)
        @source_id = source_id
        @start_date = start_date
    end

    def create_auto_refill
        print "order_id : #{@source_id} \n"
        print "start_date : #{@start_date} \n"
    end
end