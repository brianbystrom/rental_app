# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(   fname:                  "Brian",
                lname:                  "Bystrom",
                email:                  "bbystrom@uncc.edu",
                username:               "bbystrom",
                password:               "password",
                password_confirmation:  "password",
                status:                 true,
                admin:                  false,
                street:                 "1120 Garrison Rd.",
                city:                   "Charlotte",
                state:                  "NC",
                zip:                    "28262",
                phone:                  "555-555-5555")
                
User.create!(   fname:                  "Katelyn",
                lname:                  "Gabb",
                email:                  "kgabb@uncc.edu",
                username:               "kgabb",
                password:               "password",
                password_confirmation:  "password",
                status:                 true,
                admin:                  false,
                street:                 "9201 University City Blvd",
                city:                   "Charlotte",
                state:                  "NC",
                zip:                    "28223",
                phone:                  "555-555-5555")
                
User.create!(   fname:                  "Seth",
                lname:                  "Spaulding",
                email:                  "sspauld4@uncc.edu",
                username:               "sspauld4",
                password:               "password",
                password_confirmation:  "password",
                status:                 true,
                admin:                  false,
                street:                 "9201 University City Blvd",
                city:                   "Charlotte",
                state:                  "NC",
                zip:                    "28223",
                phone:                  "555-555-5555")      
                
User.create!(   fname:                  "Nelson",
                lname:                  "Tang",
                email:                  "ntang4@uncc.edu",
                username:               "ntang4",
                password:               "password",
                password_confirmation:  "password",
                status:                 true,
                admin:                  false,
                street:                 "9201 University City Blvd",
                city:                   "Charlotte",
                state:                  "NC",
                zip:                    "28223",
                phone:                  "555-555-5555")
                
User.create!(   fname:                  "Ranz",
                lname:                  "Saturinas",
                email:                  "rsaturin@uncc.edu",
                username:               "rsaturin",
                password:               "password",
                password_confirmation:  "password",
                status:                 true,
                admin:                  false,
                street:                 "9201 University City Blvd",
                city:                   "Charlotte",
                state:                  "NC",
                zip:                    "28223",
                phone:                  "555-555-5555")
                
User.create!(   fname:                  "Jachin",
                lname:                  "Flancher",
                email:                  "jflanche@uncc.edu",
                username:               "jflanche",
                password:               "password",
                password_confirmation:  "password",
                status:                 true,
                admin:                  false,
                street:                 "9201 University City Blvd",
                city:                   "Charlotte",
                state:                  "NC",
                zip:                    "28223",
                phone:                  "555-555-5555")
                
User.create!(   fname:                  "Joel",
                lname:                  "Saju",
                email:                  "jsaju1@uncc.edu",
                username:               "jsaju1",
                password:               "password",
                password_confirmation:  "password",
                status:                 true,
                admin:                  false,
                street:                 "9201 University City Blvd",
                city:                   "Charlotte",
                state:                  "NC",
                zip:                    "28223",
                phone:                  "555-555-5555")

Item.create!(       user_id: 1,
                    serial_no: "SNO0001",
                    name: "iPhone X",
                    tag: "phone, apple, tech, smartphone",
                    price: "25.00",
                    brand: "Apple",
                    description: "This is a used iPhone that I no longer use.  Basic wear and tear but works perfectly fine if you are trying to test out the iphone to buy it yourself.",
                    model: "iPhone X",
                    image_url: "items/iphone_x_1.png",
                    status: true)
                    
Item.create!(       user_id: 1,
                    serial_no: "SNO0002",
                    name: "iPhone X",
                    tag: "phone, apple, tech, smartphone",
                    price: "20.00",
                    brand: "Apple",
                    description: "This is a used iPhone that I no longer use.  Basic wear and tear but works perfectly fine if you are trying to test out the iphone to buy it yourself.",
                    model: "iPhone X",
                    image_url: "items/iphone_x_2.png",
                    status: true)      
                    
Item.create!(       user_id: 1,
                    serial_no: "SNO0003",
                    name: "iPhone X",
                    tag: "phone, apple, tech, smartphone",
                    price: "22.00",
                    brand: "Apple",
                    description: "This is a used iPhone that I no longer use.  Basic wear and tear but works perfectly fine if you are trying to test out the iphone to buy it yourself.",
                    model: "iPhone X",
                    image_url: "items/iphone_x_3.jpg",
                    status: true)    
                    
Item.create!(       user_id: 2,
                    serial_no: "SNO0004",
                    name: "iPhone X",
                    tag: "phone, apple, tech, smartphone, iPhone",
                    price: "10.00",
                    brand: "Apple",
                    description: "Brand new iPhone, NIB willing to sell for $600 if you like it when rented.",
                    model: "iPhone X",
                    image_url: "items/iphone_x_4.jpg",
                    status: true) 
                    
Item.create!(       user_id: 2,
                    serial_no: "SNO0005",
                    name: "Razer Huntsman Elite",
                    tag: "razer, keyboard, peripheral, pc",
                    price: "15.25",
                    brand: "Razer",
                    description: "One of the new keyboards from Razer with optical switches.  Barely used and in great working condition.  Comes with wrist rest that lights up if you hook up the additional USB cable.",
                    model: "Razer Huntsman Elite",
                    image_url: "items/razer_huntsman_elite.jpg",
                    status: true)
                    
Item.create!(       user_id: 3,
                    serial_no: "SNO0006",
                    name: "Razer DeathAdder Elite",
                    tag: "razer, mouse, peripheral, pc",
                    price: "5.00",
                    brand: "Razer",
                    description: "The Razer DeathAdder Elite features Razer's most advanced optical sensor, Razer Mechanical Mouse Switches as well as the stellar ergonomics that the top esports professionals swear by, so you’ll have unsurpassable accuracy and speed to dominate the playing field.",
                    model: "DeathAdder Elite",
                    image_url: "items/razer_deathadder_elite.jpg",
                    status: true)
                    
Item.create!(       user_id: 5,
                    serial_no: "SNO0007",
                    name: "Epson VS250 SVGA 3,200 Projector",
                    tag: "projector, tech, video",
                    price: "50.00",
                    brand: "Epson",
                    description: "Make a lasting impression with the VS250 portable projector, offering 3,200 lumens of color/white brightness (1) for vivid presentations - even in well-lit rooms. Featuring SVGA resolution (800 x 600), the VS250 is ideal for everyday projection needs. Its lightweight design and fast, easy setup tools get you up and running in no time. Plus, Epson 3LCD projectors deliver remarkable color accuracy, with up to 3x Higher Color Brightness (2) and up to 3x Wider Color Gamut (3) over competitive DLP projectors. The VS250 also supports HDMI, the standard in digital connectivity, for compatibility with the latest laptops and media players.",
                    model: "VS250",
                    image_url: "items/epson_vs250.jpg",
                    status: true) 
                    
Item.create!(       user_id: 5,
                    serial_no: "SNO0008",
                    name: "Xbox One S White",
                    tag: "gaming, tech, xbox, microsoft",
                    price: "25.00",
                    brand: "Microsoft",
                    description: "With the Microsoft Xbox One S 500GB Console, you get the best value in games and entertainment. It's 10 percent smaller than the Xbox One so it won't take up too much space in your home entertainment setup.",
                    model: "Xbox One S",
                    image_url: "items/xbox_one_s.jpg",
                    status: true) 
                    
Item.create!(       user_id: 5,
                    serial_no: "SNO0009",
                    name: "Xbox One Controller",
                    tag: "gaming, tech, xbox, microsoft, peripheral",
                    price: "10.00",
                    brand: "Microsoft",
                    description: "Experience the enhanced comfort and feel of the new Xbox Wireless Controller, featuring a streamlined design, textured grip, and Bluetooth technology for gaming on Windows 10 devices.",
                    model: "Xbox One",
                    image_url: "items/xbox_controller.jpg",
                    status: true)    
                    
Item.create!(       user_id: 6,
                    serial_no: "SNO0010",
                    name: "Samsung 58-inch TV",
                    tag: "tv, tech, samsung, smart, 4k",
                    price: "50.00",
                    brand: "Samsung",
                    description: "Enjoy 4K viewing with this 57.5-inch Samsung Ultra HDTV. Its quad-core processor lets you load apps, games and online content smoothly, and its UHD upscaling capability enhances the quality of lower-resolution videos. Connect multiple high-definition media components via the two HDMI and two USB ports of this Samsung Ultra HDTV.",
                    model: "LED MU6070 Series",
                    image_url: "items/samsung_tv.jpg",
                    status: true)
                    
Item.create!(       user_id: 6,
                    serial_no: "SNO0011",
                    name: "Samsung Note 9",
                    tag: "phone, tech, samsung, smart, note",
                    price: "32.00",
                    brand: "Samsung",
                    description: "Galaxy Note9 puts powerful technology in the hands of pioneers who demand more. Innovative features and design make it the only phone to keep up with the next generation of achievers.",
                    model: "Note 9",
                    image_url: "items/samsung_note_9.jpg",
                    status: true)  
                    
Rental.create!(     user_id: 2,
                    item_id: 1,
                    rental_start_date: Date.current(),
                    rental_end_date: Date.new(2018, 11, 30),
                    buyer_checkin_confirm: false,
                    seller_checkin_confirm: false,
                    total_price: 500,
                    assistance: false,
                    comment: "Where would you like to meet?",
                    approval: false)
                    
Rental.create!(     user_id: 1,
                    item_id: 8,
                    rental_start_date: Date.yesterday(),
                    rental_end_date: Date.today(),
                    buyer_checkin_confirm: true,
                    seller_checkin_confirm: true,
                    total_price: 25,
                    assistance: false,
                    buyer_rating: 3,
                    seller_rating: 5,
                    comment: "Where would you like to meet?",
                    approval: true)
                    
Rental.create!(     user_id: 3,
                    item_id: 4,
                    rental_start_date: Date.yesterday(),
                    rental_end_date: Date.today(),
                    buyer_checkin_confirm: true,
                    seller_checkin_confirm: true,
                    total_price: 25,
                    assistance: false,
                    buyer_rating: 5,
                    seller_rating: 5,
                    comment: "Where would you like to meet?",
                    approval: true)
                    
Comment.create!(    user_id: 1,
                    body: "This was a great experience, a pleasure to work with.",
                    commented_id: 2)
                    
Comment.create!(    user_id: 5,
                    body: "Amazing experience!",
                    commented_id: 1)
                    
Comment.create!(    user_id: 6,
                    body: "Thanks for the great rental, would rent from again 10/10!",
                    commented_id: 1)