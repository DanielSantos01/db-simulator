module Create_User
    def Create_User.ask_to_continue
        system "clear"
        print "do you want to register more users? [s/n] "
        wants_to_continue = gets.chomp()
        return wants_to_continue == "s"
    end

    def Create_User.get_user_infos(db_helper)
        is_creating = true
        while is_creating
            print "insert a user name: "
            user_name = gets.chomp()
            print "insert a user role: "
            user_role = gets.chomp()
            db_info = "id: #{rand()}, name: #{user_name}, role: #{user_role}"
            db_helper.write(db_info)

            wants_to_continue = Create_User.ask_to_continue
            if !wants_to_continue
                is_creating = false
            end
        end
    end
end
