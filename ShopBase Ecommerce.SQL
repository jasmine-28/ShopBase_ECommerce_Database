-- MYSQL SCHEMA For ShopBase Ecommerce Database 

use ShopBase_Ecommerce;

-- 1. USERS

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(50),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. ADDRESSES (normalized user addresses)
CREATE TABLE Addresses (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    address_type ENUM('Billing', 'Shipping'),
    street VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 3. CATEGORIES
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100)
);

-- 4. PRODUCTS
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    stock_quantity INT,
    category_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);



-- 6. ORDERS
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    shipping_address_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (shipping_address_id) REFERENCES Addresses(address_id)
);

-- 7. ORDER ITEMS
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 8. PAYMENTS
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATETIME,
    amount DECIMAL(10,2),
    payment_method ENUM('Credit Card', 'PayPal', 'Net Banking', 'COD'),
    payment_status ENUM('Paid', 'Failed', 'Refunded'),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);








INSERT INTO Users (full_name, email, phone, gender, date_of_birth, created_at) VALUES
("Kelly Perkins", "qmarshall@yahoo.com", "901.838.9734", "Female", "1977-08-09", "2024-05-02 08:39:12"),
("Courtney Fitzpatrick", "dickersonashley@hotmail.com", "315-601-2541x335", "Male", "1996-11-19", "2024-06-22 19:46:02"),
("Joseph Roberts", "westjoe@yahoo.com", "+1-292-226-6299x9460", "Other", "2003-11-23", "2024-05-16 13:12:03"),
("Kenneth Russell", "danielbell@baker.com", "(550)831-8899", "Male", "1989-12-12", "2024-12-24 14:45:18"),
("Joseph Torres", "bryansosa@george.com", "962.689.8605x920", "Male", "1962-03-20", "2025-02-22 11:02:30"),
("Lindsay Martin", "robertwillis@lara.net", "369-048-6044x48215", "Male", "1980-04-10", "2023-06-15 17:05:25"),
("Jordan Estes", "fharrell@gmail.com", "(558)697-6822x02470", "Other", "2004-10-09", "2025-01-22 21:17:17"),
("Matthew Warren DVM", "allendenise@gmail.com", "661.196.7622x18549", "Other", "2001-04-26", "2024-02-12 02:29:59"),
("Jacob Smith", "blairmichael@hotmail.com", "405.984.7544", "Other", "1962-07-21", "2025-01-15 18:17:52"),
("Larry Baxter", "starkcaroline@contreras.com", "(826)208-5915x5278", "Other", "1985-07-31", "2023-05-20 01:47:07"),
("John Kelley", "acostajason@collins.net", "(646)885-7412x5291", "Male", "1998-06-14", "2024-06-08 04:38:27");













INSERT INTO Addresses (user_id, street, city, state, country) VALUES
(1, "0487 Hull Village Suite 759", "New Donald", "Florida", "Saudi Arabia"),
(2, "489 Kyle Stream", "Port Gabriellafort", "Oklahoma", "Bolivia"),
(3, "5938 Ramos Pike Suite 080", "Lake Marytown", "South Carolina", "Lithuania"),
(4, "51393 Linda Divide Suite 115", "Rodriguezside", "Maine", "Romania"),
(5, "583 Wallace Ranch", "Stewartbury", "Maine", "Colombia"),
(6, "09471 Erika Curve", "North Megan", "Vermont", "Uzbekistan"),
(7, "848 Melissa Springs Suite 947", "Kellerstad", "Colorado", "Greece"),
(8, "9533 Jessica Crescent", "West Laura", "Michigan", "Japan"),
(9, "23098 Anthony Roads", "New Maria", "Delaware", "India"),
(10, "1090 Susan Ferry", "South Jasonton", "Utah", "Angola"),
(11, "141 Charles Hollow Suite 620", "Williamsville", "Vermont", "India"),
(12, "5792 Tammy Centers", "Port Fernando", "North Dakota", "El Salvador"),
(13, "720 Maldonado Port", "Deborahfurt", "Texas", "El Salvador"),
(14, "071 Stevenson Plains", "Dennisfort", "Minnesota", "New Caledonia"),
(15, "599 Jennifer Loaf Suite 109", "Lake Matthew", "Kansas", "Czech Republic"),
(16, "9606 Barton Station Apt. 271", "Jacquelinemouth", "North Dakota", "Turks and Caicos Islands"),
(17, "900 Nguyen Villages Suite 063", "Port Jessicatown", "Montana", "Zambia"),
(18, "0300 James Rest Apt. 442", "South Melissafurt", "South Dakota", "Belgium"),
(19, "7142 Wilson Drives", "Melissaton", "Arizona", "Costa Rica"),
(20, "559 Meghan Squares Suite 765", "East Nicholas", "Maine", "Algeria"),
(21, "45551 Chan Camp", "West Frankshire", "Maine", "Guyana"),
(22, "241 Cross Causeway Suite 281", "Richardmouth", "Maryland", "Israel"),
(23, "87755 Timothy Squares", "Simmonsport", "Michigan", "Saint Pierre and Miquelon"),
(24, "96111 Kara Circle", "Smithfurt", "Oklahoma", "Malaysia"),
(25, "7936 Micheal Green Apt. 635", "North Lynntown", "North Dakota", "Korea"),
(26, "76430 Cindy Cove", "South Nicholas", "Ohio", "Sweden"),
(27, "97296 Rich Park", "Marthafort", "South Dakota", "Paraguay"),
(28, "930 Thornton Summit", "Lisaton", "North Dakota", "Cameroon"),
(29, "269 Robbins Valley Suite 118", "North Jeffreyton", "Maryland", "American Samoa"),
(30, "2275 Santana Parkway Apt. 918", "Lake Ronaldborough", "Maine", "Martinique"),
(31, "6993 Diane Alley Apt. 489", "Marvinfort", "Kentucky", "Western Sahara"),
(32, "6602 John Stream Suite 007", "Thomasland", "Utah", "Qatar"),
(33, "6097 Ellis Courts", "Osbornetown", "Arizona", "Nepal"),
(34, "518 Lee Tunnel", "Rodriguezton", "South Carolina", "Reunion"),
(35, "519 Kramer Crossroad Suite 418", "North Kimberly", "New Hampshire", "Holy See (Vatican City State)"),
(36, "5100 Scott Burg", "East Clayton", "South Dakota", "Slovakia (Slovak Republic)"),
(37, "412 Snow Manors Apt. 161", "South Kimtown", "New Hampshire", "Jersey"),
(38, "75415 David Square Apt. 552", "Port Terristad", "California", "Nauru"),
(39, "03104 Norris Rapids", "Port Donald", "New Jersey", "Bouvet Island (Bouvetoya)"),
(40, "4203 Rogers Highway Suite 852", "North Amandaport", "Hawaii", "Honduras"),
(41, "35833 Kelly Manor", "Port Davidtown", "Montana", "Belarus"),
(42, "64862 Evans Knoll", "East Seanstad", "South Dakota", "Yemen"),
(43, "6065 Harris Hill", "Davisburgh", "Connecticut", "Falkland Islands (Malvinas)"),
(44, "927 Lopez Manor", "Thompsonmouth", "Michigan", "Vietnam"),
(45, "7173 Smith Square", "Montgomerytown", "Indiana", "French Southern Territories"),
(46, "489 Roger Terrace", "Davisfort", "Wisconsin", "Djibouti"),
(47, "0140 Jonathan Pine Suite 714", "Justinborough", "Rhode Island", "Belize"),
(48, "44851 Pamela Track", "North Robert", "Maine", "Finland"),
(49, "838 Robert Roads", "Figueroaview", "Maine", "Kenya"),
(50, "221 Patrick Ramp Suite 284", "Crystalchester", "Indiana", "Lesotho");




















INSERT INTO Categories (category_name, description) VALUES
("Electronics", "Wide range of consumer electronics including smartphones, laptops, and accessories."),
("Fashion", "Trendy clothing, shoes, and accessories for all genders and ages."),
("Home Appliances", "Durable and reliable home appliances like refrigerators, washing machines, and microwaves."),
("Beauty & Personal Care", "Skincare, haircare, makeup, and personal care products from top brands."),
("Books", "A vast collection of books ranging from fiction, non-fiction, and academic genres."),
("Toys & Games", "Fun toys and games for kids of all ages, including educational and interactive options."),
("Furniture", "Modern furniture for every room, including sofas, beds, and tables."),
("Sports & Outdoors", "Fitness gear, outdoor equipment, and sports apparel."),
("Groceries", "Everyday food items, snacks, and beverages delivered right to your door."),
("Health & Wellness", "Supplements, fitness equipment, and health monitoring devices."),
("Baby & Kids", "Clothing, toys, and care essentials for babies and children."),
("Automotive", "Car accessories, tools, and maintenance products for vehicle care."),
("Garden & Outdoor", "Garden tools, plants, and outdoor decor for home gardens and patios."),
("Jewelry & Watches", "Stylish jewelry, watches, and accessories for all occasions."),
("Office Supplies", "Everything you need for your office, from stationery to furniture."),
("Pet Supplies", "Pet food, toys, and care essentials for dogs, cats, and other pets."),
("Kitchenware", "Cookware, bakeware, and kitchen gadgets for every cooking enthusiast."),
("Music & Instruments", "Musical instruments, sound equipment, and accessories for musicians."),
("Computers & Accessories", "Laptops, desktops, and accessories for work and play."),
("Art & Craft", "Materials for DIY projects, painting, scrapbooking, and more."),
("Shoes", "Footwear for all occasions including casual, formal, and athletic styles."),
("Luggage & Bags", "Bags, suitcases, and travel accessories for your trips."),
("Weddings & Events", "Wedding dresses, event decor, and other essentials for your big day."),
("Cameras & Photography", "High-quality cameras, lenses, and photography accessories."),
("Food & Beverages", "Delicious snacks, drinks, and packaged food items for your pantry."),
("Software", "Productivity software, games, and creative tools for personal and business use."),
("Mobile Accessories", "Chargers, cases, and accessories for your mobile devices."),
("Baby Gear", "Strollers, car seats, and other essentials for parents."),
("Health Devices", "Smart health gadgets like fitness trackers, thermometers, and more."),
("DIY & Tools", "Power tools, hand tools, and DIY equipment for home improvement projects."),
("Books & Stationery", "Notebooks, pens, and educational books for students and professionals."),
("Gaming", "Video games, consoles, and gaming accessories for enthusiasts."),
("Gifts & Special Occasion", "Unique gifts for birthdays, anniversaries, and special moments."),
("Luxury Goods", "Premium and high-end products in fashion, jewelry, and accessories."),
("Digital Products", "E-books, online courses, and digital downloads for personal growth."),
("Food Storage", "Containers and solutions for storing food and keeping it fresh."),
("Seasonal & Holiday", "Decorations, gifts, and supplies for various holidays and seasons."),
("Baby Clothes", "Cute and comfortable clothing for newborns and toddlers."),
("Furniture & Decor", "Furniture pieces and home decor to style your living space."),
("Cleaning Supplies", "Household cleaning products to keep your home spotless."),
("Camping & Hiking", "Outdoor equipment for camping, hiking, and nature exploration."),
("Health & Fitness", "Workout gear, fitness tracking, and health products."),
("Craft Supplies", "Everything you need for knitting, sewing, and other creative crafts."),
("Consumer Goods", "Everyday consumer goods such as household essentials and personal items."),
("Sustainable Products", "Eco-friendly and sustainable products for a greener lifestyle."),
("Gardening Tools", "Tools and equipment for garden care, landscaping, and outdoor maintenance."),
("Luxury Fashion", "High-end fashion items including designer clothes, shoes, and accessories."),
("Technology Gadgets", "Smart tech gadgets like wearables, smart home devices, and gadgets."),
("Travel Accessories", "Travel bags, organizers, and accessories for your trips."),
("Baby Health", "Health and hygiene products for babies and toddlers."),
("Smart Home", "Smart home devices such as thermostats, cameras, and voice assistants."),
("Cycling & Sports", "Cycling equipment, sports gear, and outdoor recreation essentials."),
("Fitness Equipment", "Home gym equipment, weights, yoga mats, and more."),
("Photography Accessories", "Essential accessories for photographers, including tripods and lighting."),
("Home Security", "Security cameras, alarms, and other home safety products."),
("Collectibles", "Collectible items such as limited edition toys, memorabilia, and rare finds."),
("Laptops & Tablets", "Laptops, tablets, and accessories for work and entertainment."),
("Outdoor Furniture", "Comfortable and stylish outdoor furniture for patios and gardens.");

















INSERT INTO Products (product_name, description, price, stock_quantity, category_id) VALUES
("Smartphone XYZ", "A high-end smartphone with a large display, fast processor, and excellent camera features.", 799.99, 150, 1),
("Leather Jacket", "Premium quality leather jacket, perfect for winter fashion and style.", 129.99, 50, 2),
("Washing Machine", "Top-loading washing machine with multiple wash settings for effective cleaning.", 499.99, 30, 3),
("Organic Face Cream", "A soothing and moisturizing face cream made from organic ingredients.", 29.99, 200, 4),
("The Catcher in the Rye", "A classic novel by J.D. Salinger, telling the story of a disillusioned teenager.", 14.99, 100, 5),
("Lego City Set", "A creative Lego building set with pieces to build various city structures.", 49.99, 120, 6),
("Sofa Set", "Comfortable and stylish 3-piece sofa set for modern living rooms.", 699.99, 25, 7),
("Yoga Mat", "Non-slip yoga mat for a comfortable workout experience at home or at the gym.", 19.99, 75, 8),
("Gourmet Coffee Beans", "Premium roasted coffee beans for a rich and aromatic coffee experience.", 15.99, 150, 9),
("Multivitamin Supplement", "A daily multivitamin supplement to improve overall health and energy.", 19.99, 200, 10),
("Baby Stroller", "Lightweight and foldable stroller with adjustable seating for infants.", 159.99, 60, 11),
("Car Tire", "High-quality all-season tires for smooth rides and durability.", 99.99, 40, 12),
("Smartwatch", "A smartwatch with fitness tracking, heart rate monitoring, and customizable features.", 199.99, 100, 13),
("Dining Table Set", "Elegant dining table set with 6 chairs, made from solid wood.", 499.99, 20, 14),
("Gold Necklace", "A delicate and luxurious gold necklace with a simple yet elegant design.", 199.99, 80, 15),
("Office Chair", "Ergonomic office chair designed for comfort during long hours of work.", 89.99, 120, 16),
("Dog Collar", "Adjustable dog collar with a durable buckle and comfortable fit.", 12.99, 150, 17),
("Blender", "High-speed blender perfect for making smoothies, soups, and sauces.", 49.99, 90, 18),
("Camera Lens", "Professional camera lens for DSLR cameras, with high clarity and precision.", 299.99, 30, 19),
("Mobile Phone Case", "Protective phone case with a slim design and shock-absorbing material.", 15.99, 200, 20),
("Exercise Bike", "Indoor exercise bike for cardio workouts, with adjustable resistance levels.", 199.99, 50, 21),
("Guitar", "Electric guitar with a sleek design and high-quality sound for music lovers.", 299.99, 25, 22),
("Wireless Earbuds", "Compact and wireless earbuds with noise-canceling technology for clear sound.", 49.99, 150, 23),
("Camping Tent", "Durable and weather-resistant camping tent for outdoor adventures.", 129.99, 40, 24),
("Food Processor", "Multi-functional food processor with multiple blades and attachments for easy food prep.", 89.99, 60, 25),
("Laptop Bag", "Stylish and functional laptop bag with compartments for your tech accessories.", 39.99, 180, 26),
("Electric Kettle", "Quick-boiling electric kettle with an automatic shut-off feature.", 29.99, 110, 27),
("Smart Home Hub", "Smart home hub to control all connected devices with voice commands or smartphone app.", 149.99, 70, 28),
("Electric Scooter", "Foldable electric scooter for easy transportation around the city.", 399.99, 50, 29),
("Air Purifier", "Compact air purifier with HEPA filter to eliminate dust, pollen, and other allergens.", 79.99, 100, 30),
("Bluetooth Speaker", "Portable Bluetooth speaker with excellent sound quality and long battery life.", 59.99, 150, 31),
("Portable Power Bank", "High-capacity power bank to charge your devices on the go.", 24.99, 200, 32),
("Headphones", "Over-ear headphones with noise cancellation and superior sound quality.", 129.99, 80, 33),
("Rain Jacket", "Lightweight and waterproof jacket to keep you dry during rainy weather.", 59.99, 100, 34),
("Electric Grill", "Indoor electric grill perfect for grilling meats, vegetables, and seafood.", 99.99, 60, 35),
("Smart Thermostat", "Energy-efficient smart thermostat with remote control via mobile app.", 129.99, 50, 36),
("Travel Backpack", "Spacious and durable backpack with multiple compartments for travel essentials.", 49.99, 120, 37),
("Action Camera", "Waterproof action camera with HD video recording for outdoor sports and adventures.", 179.99, 40, 38),
("Water Bottle", "Insulated water bottle that keeps drinks hot or cold for hours.", 19.99, 180, 39),
("Blender Bottle", "Portable shaker bottle for mixing protein shakes and smoothies.", 14.99, 150, 40),
("Electric Toothbrush", "Rechargeable electric toothbrush with multiple brush settings for better oral hygiene.", 39.99, 200, 41),
("Fitness Tracker", "Wearable fitness tracker that monitors steps, calories, and sleep quality.", 49.99, 150, 42),
("Instant Pot", "Multi-functional pressure cooker that cooks meals quickly and efficiently.", 89.99, 100, 43),
("Smart Light Bulbs", "Smart LED light bulbs that can be controlled remotely using a mobile app.", 29.99, 120, 44),
("Pet Carrier", "Comfortable and durable pet carrier for easy travel with your pet.", 39.99, 80, 45),
("Adjustable Dumbbells", "Space-saving adjustable dumbbells for home workouts and strength training.", 149.99, 60, 46),
("Floor Lamp", "Modern and stylish floor lamp that adds ambiance to your living room.", 79.99, 100, 47),
("Electric Heater", "Compact and portable electric heater to keep your space warm and comfortable.", 49.99, 70, 48),
("Smartphone Tripod", "Adjustable smartphone tripod for stable photos and videos.", 29.99, 200, 49),
("Table Lamp", "Elegant table lamp with adjustable brightness for home or office use.", 39.99, 120, 50);











INSERT INTO Addresses (user_id, street, city, state, country) VALUES
(1, "0487 Hull Village Suite 759", "New Donald", "Florida", "Saudi Arabia"),
(2, "489 Kyle Stream", "Port Gabriellafort", "Oklahoma", "Bolivia"),
(3, "5938 Ramos Pike Suite 080", "Lake Marytown", "South Carolina", "Lithuania"),
(4, "51393 Linda Divide Suite 115", "Rodriguezside", "Maine", "Romania"),
(5, "583 Wallace Ranch", "Stewartbury", "Maine", "Colombia"),
(6, "09471 Erika Curve", "North Megan", "Vermont", "Uzbekistan"),
(7, "848 Melissa Springs Suite 947", "Kellerstad", "Colorado", "Greece"),
(8, "9533 Jessica Crescent", "West Laura", "Michigan", "Japan"),
(9, "23098 Anthony Roads", "New Maria", "Delaware", "India"),
(10, "1090 Susan Ferry", "South Jasonton", "Utah", "Angola"),
(11, "141 Charles Hollow Suite 620", "Williamsville", "Vermont", "India"),
(12, "5792 Tammy Centers", "Port Fernando", "North Dakota", "El Salvador"),
(13, "720 Maldonado Port", "Deborahfurt", "Texas", "El Salvador"),
(14, "071 Stevenson Plains", "Dennisfort", "Minnesota", "New Caledonia"),
(15, "599 Jennifer Loaf Suite 109", "Lake Matthew", "Kansas", "Czech Republic"),
(16, "9606 Barton Station Apt. 271", "Jacquelinemouth", "North Dakota", "Turks and Caicos Islands"),
(17, "900 Nguyen Villages Suite 063", "Port Jessicatown", "Montana", "Zambia"),
(18, "0300 James Rest Apt. 442", "South Melissafurt", "South Dakota", "Belgium"),
(19, "7142 Wilson Drives", "Melissaton", "Arizona", "Costa Rica"),
(20, "559 Meghan Squares Suite 765", "East Nicholas", "Maine", "Algeria"),
(21, "45551 Chan Camp", "West Frankshire", "Maine", "Guyana"),
(22, "241 Cross Causeway Suite 281", "Richardmouth", "Maryland", "Israel"),
(23, "87755 Timothy Squares", "Simmonsport", "Michigan", "Saint Pierre and Miquelon"),
(24, "96111 Kara Circle", "Smithfurt", "Oklahoma", "Malaysia"),
(25, "7936 Micheal Green Apt. 635", "North Lynntown", "North Dakota", "Korea"),
(26, "76430 Cindy Cove", "South Nicholas", "Ohio", "Sweden"),
(27, "97296 Rich Park", "Marthafort", "South Dakota", "Paraguay"),
(28, "930 Thornton Summit", "Lisaton", "North Dakota", "Cameroon"),
(29, "269 Robbins Valley Suite 118", "North Jeffreyton", "Maryland", "American Samoa"),
(30, "2275 Santana Parkway Apt. 918", "Lake Ronaldborough", "Maine", "Martinique"),
(31, "6993 Diane Alley Apt. 489", "Marvinfort", "Kentucky", "Western Sahara"),
(32, "6602 John Stream Suite 007", "Thomasland", "Utah", "Qatar"),
(33, "6097 Ellis Courts", "Osbornetown", "Arizona", "Nepal"),
(34, "518 Lee Tunnel", "Rodriguezton", "South Carolina", "Reunion"),
(35, "519 Kramer Crossroad Suite 418", "North Kimberly", "New Hampshire", "Holy See (Vatican City State)"),
(36, "5100 Scott Burg", "East Clayton", "South Dakota", "Slovakia (Slovak Republic)"),
(37, "412 Snow Manors Apt. 161", "South Kimtown", "New Hampshire", "Jersey"),
(38, "75415 David Square Apt. 552", "Port Terristad", "California", "Nauru"),
(39, "03104 Norris Rapids", "Port Donald", "New Jersey", "Bouvet Island (Bouvetoya)"),
(40, "4203 Rogers Highway Suite 852", "North Amandaport", "Hawaii", "Honduras"),
(41, "35833 Kelly Manor", "Port Davidtown", "Montana", "Belarus"),
(42, "64862 Evans Knoll", "East Seanstad", "South Dakota", "Yemen"),
(43, "6065 Harris Hill", "Davisburgh", "Connecticut", "Falkland Islands (Malvinas)"),
(44, "927 Lopez Manor", "Thompsonmouth", "Michigan", "Vietnam"),
(45, "7173 Smith Square", "Montgomerytown", "Indiana", "French Southern Territories"),
(46, "489 Roger Terrace", "Davisfort", "Wisconsin", "Djibouti"),
(47, "0140 Jonathan Pine Suite 714", "Justinborough", "Rhode Island", "Belize"),
(48, "44851 Pamela Track", "North Robert", "Maine", "Finland"),
(49, "838 Robert Roads", "Figueroaview", "Maine", "Kenya"),
(50, "221 Patrick Ramp Suite 284", "Crystalchester", "Indiana", "Lesotho");


















INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES
(1, 39, 10, 176.3),
(2, 28, 9, 142.21),
(3, 9, 7, 102.39),
(4, 14, 8, 454.0),
(5, 2, 7, 239.7),
(6, 45, 2, 53.77),
(7, 16, 5, 376.57),
(8, 16, 2, 93.67),
(9, 4, 2, 317.01),
(10, 5, 9, 22.62),
(11, 40, 2, 443.96),
(12, 26, 2, 481.03),
(13, 18, 6, 230.29),
(14, 10, 1, 238.89),
(15, 16, 5, 78.52),
(16, 7, 1, 194.28),
(17, 30, 7, 172.27),
(18, 8, 2, 326.12),
(19, 24, 5, 153.26),
(20, 19, 10, 6.69),
(21, 42, 4, 331.52),
(22, 33, 5, 267.84),
(23, 34, 9, 344.75),
(24, 8, 9, 187.59),
(25, 35, 9, 267.03),
(26, 7, 8, 96.85),
(27, 9, 4, 215.85),
(28, 6, 10, 172.9),
(29, 10, 6, 77.48),
(30, 20, 9, 430.48),
(31, 2, 8, 487.6),
(32, 26, 8, 111.17),
(33, 33, 2, 128.47),
(34, 32, 9, 384.08),
(35, 41, 2, 494.27),
(36, 35, 8, 19.42),
(37, 1, 9, 25.77),
(38, 5, 1, 99.35),
(39, 32, 7, 390.16),
(40, 14, 5, 234.68),
(41, 1, 6, 170.43),
(42, 36, 6, 383.91),
(43, 31, 1, 341.63),
(44, 8, 10, 438.73),
(45, 24, 4, 439.07),
(46, 47, 3, 381.45),
(47, 36, 2, 235.16),
(48, 34, 8, 313.24),
(49, 17, 9, 21.59),
(50, 27, 3, 130.38);














INSERT INTO Addresses (user_id, street, city, state, country) VALUES
(1, "0487 Hull Village Suite 759", "New Donald", "Florida", "Saudi Arabia"),
(2, "489 Kyle Stream", "Port Gabriellafort", "Oklahoma", "Bolivia"),
(3, "5938 Ramos Pike Suite 080", "Lake Marytown", "South Carolina", "Lithuania"),
(4, "51393 Linda Divide Suite 115", "Rodriguezside", "Maine", "Romania"),
(5, "583 Wallace Ranch", "Stewartbury", "Maine", "Colombia"),
(6, "09471 Erika Curve", "North Megan", "Vermont", "Uzbekistan"),
(7, "848 Melissa Springs Suite 947", "Kellerstad", "Colorado", "Greece"),
(8, "9533 Jessica Crescent", "West Laura", "Michigan", "Japan"),
(9, "23098 Anthony Roads", "New Maria", "Delaware", "India"),
(10, "1090 Susan Ferry", "South Jasonton", "Utah", "Angola"),
(11, "141 Charles Hollow Suite 620", "Williamsville", "Vermont", "India"),
(12, "5792 Tammy Centers", "Port Fernando", "North Dakota", "El Salvador"),
(13, "720 Maldonado Port", "Deborahfurt", "Texas", "El Salvador"),
(14, "071 Stevenson Plains", "Dennisfort", "Minnesota", "New Caledonia"),
(15, "599 Jennifer Loaf Suite 109", "Lake Matthew", "Kansas", "Czech Republic"),
(16, "9606 Barton Station Apt. 271", "Jacquelinemouth", "North Dakota", "Turks and Caicos Islands"),
(17, "900 Nguyen Villages Suite 063", "Port Jessicatown", "Montana", "Zambia"),
(18, "0300 James Rest Apt. 442", "South Melissafurt", "South Dakota", "Belgium"),
(19, "7142 Wilson Drives", "Melissaton", "Arizona", "Costa Rica"),
(20, "559 Meghan Squares Suite 765", "East Nicholas", "Maine", "Algeria"),
(21, "45551 Chan Camp", "West Frankshire", "Maine", "Guyana"),
(22, "241 Cross Causeway Suite 281", "Richardmouth", "Maryland", "Israel"),
(23, "87755 Timothy Squares", "Simmonsport", "Michigan", "Saint Pierre and Miquelon"),
(24, "96111 Kara Circle", "Smithfurt", "Oklahoma", "Malaysia"),
(25, "7936 Micheal Green Apt. 635", "North Lynntown", "North Dakota", "Korea"),
(26, "76430 Cindy Cove", "South Nicholas", "Ohio", "Sweden"),
(27, "97296 Rich Park", "Marthafort", "South Dakota", "Paraguay"),
(28, "930 Thornton Summit", "Lisaton", "North Dakota", "Cameroon"),
(29, "269 Robbins Valley Suite 118", "North Jeffreyton", "Maryland", "American Samoa"),
(30, "2275 Santana Parkway Apt. 918", "Lake Ronaldborough", "Maine", "Martinique"),
(31, "6993 Diane Alley Apt. 489", "Marvinfort", "Kentucky", "Western Sahara"),
(32, "6602 John Stream Suite 007", "Thomasland", "Utah", "Qatar"),
(33, "6097 Ellis Courts", "Osbornetown", "Arizona", "Nepal"),
(34, "518 Lee Tunnel", "Rodriguezton", "South Carolina", "Reunion"),
(35, "519 Kramer Crossroad Suite 418", "North Kimberly", "New Hampshire", "Holy See (Vatican City State)"),
(36, "5100 Scott Burg", "East Clayton", "South Dakota", "Slovakia (Slovak Republic)"),
(37, "412 Snow Manors Apt. 161", "South Kimtown", "New Hampshire", "Jersey"),
(38, "75415 David Square Apt. 552", "Port Terristad", "California", "Nauru"),
(39, "03104 Norris Rapids", "Port Donald", "New Jersey", "Bouvet Island (Bouvetoya)"),
(40, "4203 Rogers Highway Suite 852", "North Amandaport", "Hawaii", "Honduras"),
(41, "35833 Kelly Manor", "Port Davidtown", "Montana", "Belarus"),
(42, "64862 Evans Knoll", "East Seanstad", "South Dakota", "Yemen"),
(43, "6065 Harris Hill", "Davisburgh", "Connecticut", "Falkland Islands (Malvinas)"),
(44, "927 Lopez Manor", "Thompsonmouth", "Michigan", "Vietnam"),
(45, "7173 Smith Square", "Montgomerytown", "Indiana", "French Southern Territories"),
(46, "489 Roger Terrace", "Davisfort", "Wisconsin", "Djibouti"),
(47, "0140 Jonathan Pine Suite 714", "Justinborough", "Rhode Island", "Belize"),
(48, "44851 Pamela Track", "North Robert", "Maine", "Finland"),
(49, "838 Robert Roads", "Figueroaview", "Maine", "Kenya"),
(50, "221 Patrick Ramp Suite 284", "Crystalchester", "Indiana", "Lesotho");


















desc Users;
SELECT * FROM Users;


SELECT * FROM Addresses;


SELECT * FROM Products;


SELECT * FROM Orders;


SELECT * FROM OrderItems;


SELECT * FROM Payments;


SELECT o.order_id, u.full_name, a.street, a.city, a.state, a.country, o.order_status
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN Addresses a ON o.shipping_address_id = a.address_id;


SELECT p.product_name, SUM(oi.quantity * oi.price_per_unit) AS total_sales
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name;


UPDATE Orders
SET order_status = 'Shipped’
WHERE order_id = 1;



DELETE FROM Users
WHERE user_id = 1;









