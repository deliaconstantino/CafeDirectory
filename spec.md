# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - User has_many Reviews; Cafe has_many Reviews; Cafe has_many Categories; Category has_many Cafes

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - User has_many Cafes through Reviews; Cafe has_many Users through Reviews

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - User has_many Cafes through Reviews; Cafe has_many Users through Reviews

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - Review has user submittable attributes: rating & content

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - User - validates presense for: email, username, password + uniqueness for: email,
    - Cafe - validates presense for: name, city, state, opening & closing times + validates that a cafe with same name, city, & state cannot be added twice
    - Category - validates presense and uniqueness for: name
    - Review - validates presense for: rating

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - URL: /cafes/highly_rated - uses scope method in Cafe model to return the cafe instance with the highest average of it's review ratings

- [x] Include signup

- [x] Include login

- [x] Include logout

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - omniauth for Google

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - new and index routes for reviews, nested under cafes

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - ei: cafes/1/reviews/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
