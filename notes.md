Cafe -- (Attr: Name, City, State, Speciality, Table/Chair Seating, Outdoor Seating, Wifi, Cushioned Seating, Food)
- Hours--add later--string or datetime with open and close columns? --thinking do basic UTC datetime and not worry about timezones. Then search based on a standard -open late menaing open past blank time

- has_many reviews
- has_many users, through reviews
- has_many cafe_categories
- has_many categories, through cafe_categories

User -- (Attr: Username, Password (digest for DB), Email)

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
