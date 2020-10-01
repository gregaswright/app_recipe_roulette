require "pry"
class CLI

    def start
        puts "\n               Hello and Welcome to Recipe Roulette.\n"
        greeting
    end


    def greeting
        puts "\n Sign-in or Sign-up?"
        puts "\n Enter 1 to Sign-in, or 2 to Sign-up"
        choice = gets.chomp
        case choice
            when "1"
                sign_in
            when "2"
                sign_up
            else
                puts "Invalid Entry"
                    greeting
            end
    end


    def sign_in
        puts "\n Please Enter User Name"
        user_name = gets.chomp
        if User.exists?(user_name: user_name)
            puts "\n Please Enter Your Password"
            password = gets.chomp
            if User.exists?(password: password)
                puts "\n Welcome to your Recipe Roulette, #{user_name}"
                @this_user = User.find_by(user_name: user_name)
                main_menu
            else
                puts "\n Sorry, Invalid Password"
                sign_in
            end
        else
            puts "\n Invalid User Name."
            greeting
        end
    end


    def sign_up
        puts "\n Please Create User Name"
        user_name = gets.chomp
        if User.exists?(user_name: user_name)
            puts "\n This User Name Already Exists"
        else
            puts "\n Please Create Password"
            password = gets.chomp
            @this_user = User.create(user_name: user_name, password: password)
            puts "\n You have Successfully Created an Account, Welcome to Recipe Roulette, #{user_name}"
            user_interface
        end
    end


    def main_menu
        puts "\n What would you like to do?"
        puts "\n Enter 1 to see your saved recipes?"
        puts "\n Enter 2 to select a random set of recipes based on a category."
        puts "\n Enter 3 to add a comment to one of your existing recipes."
        puts "\n Enter 4 to return to log-in screen."
        choice = gets.chomp
        case choice
            when "1"
                saved_recipes
            when "2"
                recipe_category
            when "3"
                add_a_comment
            when "4"
                greeting
            else
                puts "\n Invalid Entry"
                main_menu
            end
    end

    
    def saved_recipes
        UserRecipe.all.each do |u_recipe|
            if u_recipe.user_id == @this_user.id
               x = u_recipe.recipe_id
               @recipe = Recipe.all.find(x)
               puts "#{@recipe.name}"
           
            end
        end
        puts "\n Would you like to Delete or Add a Comment to any of these recipes?"
        puts "\n Press 1 to Delete a Recipe"
        puts "\n Press 2 to Add a Comment"
        puts "\n Press 3 to Return to Main Menu"
        choice = gets.chomp
        case choice
            when "1"
                delete_a_recipe
            when "2"
                add_a_comment
            when "3" 
                main_menu
            else
                puts "\n Invalid input, returning to Main Menu"
                main_menu
        end
    end


    #needs to return a random amount from recipe cuisines
    def recipe_category
        puts "What type of cuisine are you in the mood for?"
        puts "Push 1 for Italian"
        puts "Push 2 for American"
        choice = gets.chomp
        case choice
            when "1"
                find_a_random_recipe("Italian")
            when "2"
                find_a_random_recipe("American")
            else
                puts "\n Invalid Entry"
        end
    end


    def find_a_random_recipe(recipe_cuisine)
        Recipe.all.select do |recipe|
            if recipe.cuisine == recipe_cuisine
                random_recipe = recipe.name
                puts "#{random_recipe}"
            end
        end
        puts "\n Would you like to add one of these Recipes?"
                puts "\n Press y for Yes"
                puts "\n Press n for No"
                choice = gets.chomp
                case choice
                when "y"
                    add_recipe
                when "n"
                    puts "\n Would you like a new random #{recipe_cuisine} recipe or a differnt cuisine?"
                    puts "\n Press 1 for new #{recipe_cuisine} recipes."
                    puts "\n Press 2 for a differnt cuisine."
                    puts "\n Press 3 to return to main menu."
                    second_choice = gets.chomp
                    case second_choice
                    when "1"
                        find_a_random_recipe(recipe_cuisine)
                    when "2"
                        recipe_category
                    when "3"
                        main_menu
                    else
                        puts "\n Invalid Entry"
                        recipe_category
                    end
                end
    end


    def add_recipe
        puts "\n Please type the Recipe from the List that you would like to add."
        recipe_name = gets.chomp
            if Recipe.exists?(name: recipe_name)
                recipe_object = Recipe.find_by(name: recipe_name)
                UserRecipe.create(user_id: @this_user.id, recipe_id: recipe_object.id, comment: "No current comment")
                puts "\n Great! This Recipe has been added to your Saved Recipes."
            else
                puts "\n Recipe not found, to try again press 1, press 2 to return to main menu."
                choice = gets.chomp
                case choice
                when "1"
                    add_recipe
                when "2"
                    main_menu
                else
                    puts "\n Invalid Entry"
                    add_recipe
                
            end
        end
        puts "\n Would you like to add another recipe?"
        puts "\n Press 1 to add another recipe"
        puts "\n Press 2 to return to main menu"
        choice = gets.chomp
            case choice
                when "1"
                    add_recipe
                when "2"
                    main_menu
                else
                    puts "\n Invalid Entry"
                    main_menu
            end
    end


    def add_a_comment
        puts "\n"
        UserRecipe.all.each do |u_recipe|
            if u_recipe.user_id == @this_user.id
               x = u_recipe.recipe_id
               @recipe = Recipe.all.find(x)
               puts "#{@recipe.name}"
           end
        end
        puts "\n What Recipe would you like to add a comment on?"
        recipe_name = gets.chomp
        recipe = Recipe.find_by(name: recipe_name)
        user_recipe = UserRecipe.find_by(user_id: @this_user.id, recipe_id: recipe.id)
        if !user_recipe
            puts "\n Looks like you haven't saved this recipe, try again or return to main menu?"
            puts "\n Press 1 to try again"
            puts "\n Press 2 to return to main menu"
            choice = gets.chomp
            case choice
                when "1"
                    add_a_comment
                when "2"
                    main_menu
                else
                    puts "\n Invalid Entry"
                    main_menu
            end
        else
            puts "\n Please input your comment"
            user_comment = gets.chomp
            user_recipe.update(comment: user_comment)
        end

    end

    
    
end