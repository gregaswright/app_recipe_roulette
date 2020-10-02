require "pry"
class CLI

    def start



        puts "\n               Hello and Welcome to Globel Recipe International.\n"
        greeting
    end


    def greeting
        puts "\n Sign-in or Sign-up?".cyan
        puts "\n Enter 1 to Sign-in, or 2 to Sign-up"
        choice = gets.chomp
        case choice
            when "1"
                sign_in
            when "2"
                sign_up
            else
                puts "Invalid Entry".red
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
                puts "\n Welcome to your Globel Recipe International, #{user_name}".green
                @this_user = User.find_by(user_name: user_name)
                main_menu
            else
                puts "\n Sorry, Invalid Password"
                sign_in
            end
        else
            puts "\n Invalid User Name.".red
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
            puts "\n You have Successfully Created an Account, Welcome to Globel Recipe International, #{user_name}".green
            main_menu
        end
    end


    def main_menu
        puts "\n What would you like to do?".cyan
        puts "\n Enter 1 to see your saved recipes."
        puts "\n Enter 2 to select a set of recipes based on a cuisine."
        puts "\n Enter 3 to add a comment to one of your existing recipes."
        puts "\n Enter 4 to log-out."
        choice = gets.chomp
        case choice
            when "1"
                saved_recipes
            when "2"
                recipe_category
            when "3"
                add_a_comment_with_user_recipes
            when "4"
                start
            else
                puts "\n Invalid Entry".red
                main_menu
            end
    end

    
    def saved_recipes
        UserRecipe.all.each do |u_recipe|
            if u_recipe.user_id == @this_user.id
               x = u_recipe.recipe_id
               y = u_recipe.comment
               @recipe = Recipe.all.find(x)
               puts "\n"
               puts "#{@recipe.name}                    comment: #{y}".light_blue
           
            end
        end
        puts "\n Would you like to delete or add a comment to any of these recipes?".cyan
        puts "\n Press 1 to Delete a Recipe"
        puts "\n Press 2 to Add a Comment"
        puts "\n Press 3 to Return to Main Menu"
        choice = gets.chomp
        case choice
            when "1"
                remove_saved_recipe
            when "2"
                add_a_comment
            when "3" 
                main_menu
            else
                puts "\n Invalid input, returning to Main Menu".red
                main_menu
        end
    end


    #needs to return a random amount from recipe cuisines
    def recipe_category
        puts "What type of cuisine are you in the mood for?".cyan
        puts "Push 1 for Italian"
        puts "Push 2 for American"
        puts "Push 3 for Japanese"
        puts "push 4 for Chinese"
        choice = gets.chomp
        case choice
            when "1"
                find_a_random_recipe("Italian")
            when "2"
                find_a_random_recipe("American")
            when "3"
                find_a_random_recipe("Japanese")
            when "4"
                find_a_random_recipe("Chinese")
            else
                puts "\n Invalid Entry".red
                recipe_category
        end
    end


    def find_a_random_recipe(recipe_cuisine)
        Recipe.all.select do |recipe|
            if recipe.cuisine == recipe_cuisine
                random_recipe = recipe.name
                puts "\n"
                puts "#{random_recipe}"
            end
        end
        puts "\n Would you like to add one of these recipes?".cyan
                puts "\n Press y for Yes"
                puts "\n Press n for No"
                choice = gets.chomp
                case choice
                when "y"
                    add_recipe
                when "n"
                    puts "\n Would you like to see a differnt cuisine?".cyan
                    puts "\n Press 1 for a differnt cuisine."
                    puts "\n Press 2 to return to main menu."
                    second_choice = gets.chomp
                    case second_choice
                        when "1"
                            recipe_category
                        when "2"
                            main_menu
                        else
                            puts "\n Invalid Entry".red
                            recipe_category
                    end
                else
                    puts "\n Invalid Entry".red
                    recipe_category
                    find_a_random_recipe(recipe_cuisine)
                end
    end


    def add_recipe
        puts "\n Please type the recipe from the list that you would like to add.".cyan
        recipe_name = gets.chomp
            if Recipe.exists?(name: recipe_name)
                recipe_object = Recipe.find_by(name: recipe_name)
                UserRecipe.create(user_id: @this_user.id, recipe_id: recipe_object.id, comment: "No current comment.")
                puts "\n Great! #{recipe_name} has been added to your Saved Recipes.".green
            else
                puts "\n #{recipe_name} not found, to try again press 1, press 2 to return to main menu.".red
                choice = gets.chomp
                case choice
                when "1"
                    add_recipe
                when "2"
                    main_menu
                else
                    puts "\n Invalid Entry".red
                    add_recipe
                
            end
        end
        puts "\n Would you like to add another recipe?".cyan
        puts "\n Press 1 to add another recipe from this list."
        puts "\n Press 2 to choose from a differnt cuisine."
        puts "\n Press 3 to return to main menu."
        puts "\n"
        choice = gets.chomp
            case choice
                when "1"
                    add_recipe
                when "2"
                    recipe_category
                when "3"
                    main_menu
                else
                    puts "\n Invalid Entry, returning to main menu.".red
                    main_menu
            end
    end

    def add_a_comment
        puts "\n What Recipe would you like to add a comment on?".cyan
        recipe_name = gets.chomp
        recipe = Recipe.find_by(name: recipe_name)
        user_recipe = UserRecipe.find_by(user_id: @this_user.id, recipe_id: recipe.id)
        if !user_recipe
            puts "\n Looks like you haven't saved this recipe, try again or return to main menu?".red
            puts "\n Press 1 to try again."
            puts "\n Press 2 to return to main menu."
            puts "\n"
            choice = gets.chomp
            case choice
                when "1"
                    add_a_comment
                when "2"
                    main_menu
                else
                    puts "\n Invalid Entry.".red
                    main_menu
            end
        else
            puts "\n Please input your comment.".cyan
            user_comment = gets.chomp
            user_recipe.update(comment: user_comment)
            puts "\n Great! Your Comment has been added!".green
            puts "\n Would you like to make a comment on a differnt recipe?".cyan
            puts "\n If yes press y, if no press any other key to return to main menu."
            puts "\n"
            choice_2 = gets.chomp
            case choice_2
                when "y"
                    add_a_comment
                else
                    main_menu
            end
        end
    end


    def add_a_comment_with_user_recipes
        puts "\n"
        UserRecipe.all.each do |u_recipe|
            if u_recipe.user_id == @this_user.id
               x = u_recipe.recipe_id
               @recipe = Recipe.all.find(x)
               puts "#{@recipe.name}"
           end
        end
        puts "\n What Recipe would you like to add a comment on?".cyan
        recipe_name = gets.chomp
        recipe = Recipe.find_by(name: recipe_name)
        user_recipe = UserRecipe.find_by(user_id: @this_user.id, recipe_id: recipe.id)
        if !user_recipe
            puts "\n Looks like you haven't saved this recipe, try again or return to main menu?".red
            puts "\n Press 1 to try again."
            puts "\n Press 2 to return to main menu."
            choice = gets.chomp
            case choice
                when "1"
                    add_a_comment
                when "2"
                    main_menu
                else
                    puts "\n Invalid Entry".red
                    main_menu
            end
        else
            puts "\n Please input your comment.".cyan
            user_comment = gets.chomp
            user_recipe.update(comment: user_comment)
            puts "\n Great! Your Comment has been added!".green
            puts "\n Would you like to make a comment on a differnt recipe?".cyan
            puts "\n If yes press y, if no press any other key to return to main menu."
            choice_2 = gets.chomp
            case choice_2
                when "y"
                    add_a_comment
                else
                    main_menu
            end
        end
    end

    def remove_saved_recipe
        puts "\n Which recipe would you like to remove?".cyan
        remove = gets.chomp
            remove_recipe_id = Recipe.where(name: remove).ids
            recipe_to_remove = UserRecipe.find_by(user_id: @this_user.id, recipe_id: remove_recipe_id)
            UserRecipe.delete(recipe_to_remove.id)
            puts "\n #{remove} has been deleted from your recipe list. Your list now only includes:".green
            saved_recipes
    end

    
    
end