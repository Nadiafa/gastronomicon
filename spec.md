# Specifications for the Rails Assessment

## Specs:
- [x] Using Ruby on Rails for the project
    -   used `rails g new gastronomicon`
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    -   User: has_many :recipes
        Recipe: has_many :ingredient_recipes
        Ingredient: has_many :ingredient_recipes
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    -   Recipe: belongs_to :user
        IngredientRecipes: belongs_to :recipe / belongs_to :ingredient
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    -   User: has_many :ingredients, through: :recipes
        Recipe: has_many :ingredients, through: :ingredient_recipes
        Ingredient: has_many :recipes, through: :ingredient_recipes
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    -   Recipe has_many Ingredients through IngredientRecipes
        Ingredient has_many Recipes through IngredientRecipes
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    -   IngredientRecipes has a quantity attribute
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    -   User: username must be present and unique, password validated with has_secure_password
        Recipe: title must be present
        Ingredient: name must be present
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    -   'recent' scope method added to the recipe model to get the last 3 recipes created. Applied to home page to be rendered as long as there are recipes.
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    -  Omniauth signup/login with Github
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    -    recipe show page is nested in users
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    -   new recipes is nested in users
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    -   validation errors in forms for new user and new recipe
## Confirm:
- [ ] The application is pretty DRY

- [ ] Limited logic in controllers

- [ ] Views use helper methods if appropriate

- [ ] Views use partials if appropriate
