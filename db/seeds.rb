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

ur1 = UserRecipe.create(user: ben, recipe: spagetti_meatballs, comment: "blarg")
ur2 = UserRecipe.create(user: ben, recipe: cheese_burger, comment: "blarg")
ur3 = UserRecipe.create(user: greg, recipe: spagetti_meatballs, comment: "blarg")
ur4 = UserRecipe.create(user: jill, recipe: hot_dog, comment: "blarg")
ur5 = UserRecipe.create(user: ted, recipe: cheese_burger, comment: "blarg")
