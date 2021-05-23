require_relative "./data/data_bank"
require_relative "./utils/get_user_infos"
require_relative "./utils/filter_users"

$run_data_bank = true
$Data_Bank = DB.new('users')

def handle_choice(choice)
    case choice
    when 1
        Create_User.get_user_infos($Data_Bank)
    when 2
        Filter_Users.get_params($Data_Bank)
    when 3
        puts "Thanks for use the app!"
        $run_data_bank = false
    else
        puts "You choose a invalid option"
    end
end

while $run_data_bank
    begin
    puts "       MENU       "
    puts "1 - Create User"
    puts "2 - Filter Users"
    puts "3 - Close App"
    print "Your Choice: "
    user_choice = gets.chomp().to_i
    system "clear"
    handle_choice(user_choice)
    rescue TypeError
        puts "Error: Insert an integer as option!"
    end
end
