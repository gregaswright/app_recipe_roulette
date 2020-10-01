require_relative '../config/environment'

# 1. As a roommate, I want to see how much of a grocery I have left (Read)
# 2. As a roommate, I want to add my groceries to the grocerymate (Create)
# 3. As a roommate, I want to to see all the groceries I have in the grocerymate (Read)
# 4. As a roommate, I want to consume a grocery which reflects in the groceries quantity (Update) 
# 5. As a roommate I want to be able to toss one of my groceries (Delete)
# 6. A roommate should be able to see all their groceries (Read)
# 7. As a roommate I should be able to share groceries with another roommate (Update)
# 8. As a roommate I should be able to see which groceries are share with other roommates (Read)
# 9. As a roommate I should be able to gift a grocery to another roommate (Update)
# 10. As a roommate I should be able to move out and my groceries become shared among the remaining roommates (Update)
# 11. As a roommate I expect to be able to *steal* another roommates groceries if it is under a quarter quantity (Update)


cli = CLI.new
cli.start

binding.pry
0