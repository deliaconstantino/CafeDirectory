Cafe -- (Attr: Name, City, State, Hours, Table/Chair Seating, Speciality, Outdoor Seating, Wifi, Cushioned Seating, Food)

- has_many reviews
- has_many users, through reviews
- has_many cafe_categories
- has_many categories, through cafe_categories

User -- (Attr: Username, Password, Email)

- has_many reviews
- has_many coffeeshops through reviews

Review -- (Attr: Total Rating, Content)

- belongs_to user
- belongs_to cafe

Category -- (Attr: Name)

- has_many cafe_categories
- has_many cafes, through cafe_categories
    - seed with: Studying, Conversation, Traditional Coffee, Fancy Drinks, Reading

CafeCategory --

- belongs_to cafe
- belongs_to category
