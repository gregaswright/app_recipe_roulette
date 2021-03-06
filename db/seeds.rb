Recipe.delete_all
User.delete_all
UserRecipe.delete_all

ben = User.create(user_name: "Ben85", password: "password")
greg = User.create(user_name: "Greg86", password: "password")
jill = User.create(user_name: "Jill92", password: "password") 
ted = User.create(user_name: "Ted55", password: "password")
jeff = User.create(user_name: "Jeff", password: "password")

spagetti_meatballs = Recipe.create(name: "Spagetti & Meatballs", cuisine: "Italian", ingredients: "Tomatos, Parm, Basil, Pork, Spagetti")
cheese_burger = Recipe.create(name: "Cheese Burger", cuisine: "American", ingredients: "Beef, Cheese, Mayo, Pickle, Bun")
hot_dog = Recipe.create(name: "Hot Dog", cuisine: "American", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")
baked_ziti = Recipe.create(name: "Baked Ziti", cuisine: "Italian", ingredients: "Tomatos, Parm, Basil, Mozz, Spagetti")
chili = Recipe.create(name: "Chili", cuisine: "American", ingredients: "Beef, Cheese, Mayo, Pickle, Bun")
corn_dog = Recipe.create(name: "Corn Dog", cuisine: "American", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")
pizza = Recipe.create(name: "Pizza", cuisine: "Italian", ingredients: "Tomatos, Parm, Basil, Pork, Spagetti")
tbone_steak = Recipe.create(name: "T-Bone Steak", cuisine: "American", ingredients: "Beef, Cheese, Mayo, Pickle, Bun")
carbonara = Recipe.create(name: "Carbonara", cuisine: "Italian", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")
chicken_alfredo = Recipe.create(name: "Chicken Alfredo", cuisine: "Italian", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")
udon = Recipe.create(name: "Udon Soup", cuisine: "Japanese", ingredients: "Tomatos, Parm, Basil, Pork, Spagetti")
katsu = Recipe.create(name: "Chicken Katsu", cuisine: "Japanese", ingredients: "Beef, Cheese, Mayo, Pickle, Bun")
ramen = Recipe.create(name: "Tonkotsu Ramen", cuisine: "Japanese", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")
nigiri = Recipe.create(name: "Nigiri", cuisine: "Japanese", ingredients: "Tomatos, Parm, Basil, Mozz, Spagetti")
sushi = Recipe.create(name: "Tuna Roll", cuisine: "Japanese", ingredients: "Beef, Cheese, Mayo, Pickle, Bun")
mapo_tofu = Recipe.create(name: "Mapo Tofu", cuisine: "Chinese", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")
peking = Recipe.create(name: "Peking Duck", cuisine: "Chinese", ingredients: "Tomatos, Parm, Basil, Pork, Spagetti")
congee = Recipe.create(name: "Congee", cuisine: "Chinese", ingredients: "Beef, Cheese, Mayo, Pickle, Bun")
scallion_pancake = Recipe.create(name: "Scallion Pancakes", cuisine: "Chinese", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")
soup_dumpling = Recipe.create(name: "Soup Dumplings", cuisine: "Chinese", ingredients: "Beef Frank, Ketchup, Sauerkraut, Mayo, Bun")

ur1 = UserRecipe.create(user: ben, recipe: spagetti_meatballs, comment: "No current comment")
ur2 = UserRecipe.create(user: ben, recipe: cheese_burger, comment: "No current comment")
ur3 = UserRecipe.create(user: greg, recipe: spagetti_meatballs, comment: "No current comment")
ur4 = UserRecipe.create(user: jill, recipe: hot_dog, comment: "No current comment")
ur5 = UserRecipe.create(user: ted, recipe: cheese_burger, comment: "No current comment")
