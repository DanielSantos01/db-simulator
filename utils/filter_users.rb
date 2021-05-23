module Filter_Users
    def Filter_Users.ask_to_continue
        print "you want to do another filter? [s/n] "
        wants_to_continue = gets.chomp()
        system "clear"
        return wants_to_continue == "s"
    end

    def Filter_Users.get_params(db_helper)
        is_filtering = true
        while is_filtering
            print "insert the key you want to filter: "
            key = gets.chomp()
            print "insert the value you want to match: "
            value = gets.chomp()
            db_helper.get_hash
            results = db_helper.filter(key, value)
            puts "these results where found: "
            puts results
            wants_to_continue = Filter_Users.ask_to_continue

            if (!wants_to_continue)
                is_filtering = false
            end
        end
    end
end
