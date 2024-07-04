//
//  ASAData.swift
//  Cluber
//
//  Created by Oliver Park on 6/2/24.
//

import Foundation

struct ASAStruct: Identifiable {
    let id = UUID()
    let clubName: String
    let teacherName: String
    let groupImage: String
    let subName: String
    let description: String
    let dayOfWeek: Int
    let roomNumber: Int
    var location: String = ""
    var socialMedia: Bool = false
    var instagramLink: String = ""
    var instagramID: String = ""
    
    var interested: Bool {
        get {
            UserDefaults.standard.bool(forKey: "\(clubName)_interested")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "\(clubName)_interested")
        }
    }
}

struct ASAList {
    static let HighSchool: Array = [
        // Monday
        ASAStruct(clubName: "FAB LAB", teacherName: "Mr. Gum", groupImage: "FL", subName: "Fabrication LAB", description: "Join DIS FAB LAB, a student managed club for students in grades 6 to 12. Make an impact in our school community by assisting teachers with essential services. Use state of the art technology from a professional, wide format printer to 3D printers and an automated vinyl cutter. Collaborate with peers, to provide teacher services such as printing, photocopying, 3D designing and printing", dayOfWeek: 1,roomNumber: 410),
        
        ASAStruct(clubName: "Jets Stream", teacherName: "Mr. Lipsky", groupImage: "JS", subName: "", description: "Jet Streamers will produce news broadcasts. They become journalists, find and report news stories, and broadcast their work on the DISTV YouTube channel", dayOfWeek: 1, roomNumber: 309),
        
        ASAStruct(clubName: "Rummikub Club", teacherName: "Ms. Wang", groupImage: "RC", subName: "", description: "Do you want to have a lot of fun with your friends and Ms. Wang by playing a very exciting board game called Rummikub? Rummikub is a very fun and easy number board game which you can learn easily if you don't know how to play! Ms. Wang is an expert Rummikub player and will help you learn and enjoy a lot. Join and let's have fun together!!!", dayOfWeek: 1, roomNumber: 202),
        
        ASAStruct(clubName: "Beginner Instruments" , teacherName: "Mr. Hutchings", groupImage: "BI", subName: "", description: "Ever wanted to learn a second instrument? Or maybe even your first? This asa is for students who want to explore new instruments. The school has limited supply of extra Instruments to borrow, but if we don't have one you'll have to buy your own, so make sure to contact Mr Hutchings as soon as you sign up to ask about supply.", dayOfWeek: 1, roomNumber: 406),
        
        ASAStruct(clubName: "HS Girls Futsal", teacherName: "Mr. Gall & Mr. Faille", groupImage: "HGF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments on Monday’s and Friday’s. They will be coached by Mr. Gall and Mr. Faille.", dayOfWeek: 1, roomNumber: 0, location: "DIS Futsal Fields"),
        
        ASAStruct(clubName: "HS Boys Futsal", teacherName: "Mr. Purdy", groupImage: "HBF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments. They will be coached by Mr. Purdy.", dayOfWeek: 1, roomNumber: 0, location: "DIS Futsal Fields"),
        
        ASAStruct(clubName: "Crochet Club", teacherName: "Ms. Wang", groupImage: "CrochetC", subName: "", description: "Have you ever experienced with crocheting? Ms. Wang's crochet club invites students who have any experience with crocheting or want to learn how to crochet. We can make nice and useful items like decoration items or accessory for ourselves. We will buy our own kit and crochet together in my classroom! For more clarification, come to Ms. Wang and I'd love to talk with you more!", dayOfWeek: 2, roomNumber: 202),
        
        ASAStruct(clubName: "CSCC", teacherName: "Mr. Gall", groupImage: "CSCC", subName: "Computer Science Competition Club", description: "Come and join the Computer Science Competition Club! High school Students will work with Bolt and David in 12th grade to participate in coding competitions such as USACO (United States of America Computing Olympiad), ACSL (American Computer Science League), and other competitions throughout the year as a team representing DIS. Middle school students will work with Kevin and Tommy in 11th grade to gain coding experience and knowledge to participate in the junior divisions of these competitions. The competitions generally take place online at the weekends and there is a registration fee for this.", dayOfWeek: 2, roomNumber: 301),
        
        ASAStruct(clubName: "Illusion Dance Club", teacherName: "Ms. Lualhati", groupImage: "IDC", subName: "", description: "The Illusion dance team is a group of students who have personal goals for dancing. The students in this dance team form strong friendships and learn how to work as a group and how to become a valuable group member. The members of this dance team exhibit great sportsmanship and positive attitudes towards each other and the school community. The students will be trying something new, will be learning determination, teamwork, and precision.", dayOfWeek: 2, roomNumber: 404),
        
        ASAStruct(clubName: "Competitive Debate Club", teacherName: "Mr. Lipsky", groupImage: "CDC", subName: "", description: "Students learn debate strategies and research and debate issues together. Student coaches Annie and Leanne will lead each practice. They will find competitions for students to enter and try to win awards. Students must commit to joining the ASA for Season 2 and Season 3.", dayOfWeek: 2, roomNumber: 309),
        
        ASAStruct(clubName: "MS/HS Boys Badminton", teacherName: "Mr. Zhao", groupImage: "BB", subName: "", description: "In this activity period, students will have an opportunity to show their badminton talent. They will be coached in playing the game and practice for the KISAC badminton tournament.", dayOfWeek: 2, roomNumber: 0, location: "DIS Gym"),
        
        ASAStruct(clubName: "MS/HS Girls Badminton", teacherName: "Mr. Zhao", groupImage: "BB", subName: "", description: "In this activity period, students will have an opportunity to show their badminton talent. They will be coached in playing the game and practice for the KISAC badminton tournament.", dayOfWeek: 2, roomNumber: 0, location: "DIS Gym"),
        
        ASAStruct(clubName: "Open Studio", teacherName: "Mr. Gum", groupImage: "OS", subName: "", description: """

This ASA is open to all HS students and will have a focus on observational drawing practice (still life and figure drawing). Life Drawing Studio will provide students opportunities to build their observational drawing skills.

Additionally, this ASA optionally provides High School Visual Arts students extra time in the art studio to work on their in-class art projects. If you're a HS art student it is highly encouraged that you sign up for this ASA to reserve extra time to work on your art assignments. This will be the only after school open studio time during Season 2. Weekend options for Open Art Studios are no longer available.
                  
""", dayOfWeek: 2, roomNumber: 101),
        
        ASAStruct(clubName: "Elite Training Club", teacherName: "Mr. Purdy & Mr. Faille", groupImage: "ETC", subName: "", description: "Join this ASA to begin your journey into body transformation. We will improve our athletic performances and transform ourselves into our strongest and best versions. A hard workout will also reward you with a powerful mental mindset. Supported by Harrison", dayOfWeek: 2, roomNumber: 0, location: "Fitness Center"),
        
        ASAStruct(clubName: "NHD Club", teacherName: "Mr. Kaschub", groupImage: "NHD", subName: "", description: "National History Day Club will give students an opportunity to participate in National History Day, learn about the NHD process and work on their project. NHD Club is intended for students that are interested in completing an NHD project and would like some direction, assistance and time to complete a quality project. National History Day is a research-based historical inquiry project that culminates in the NHD Korea competition in the spring. Top qualifiers from the NHD Korea competition then have the opportunity to compete in the international NHD competition in the United States in the summer. NHD Club for Trimester 3 will only be open to students that qualify for the final NHD competition.", dayOfWeek: 2, roomNumber: 310),
        
        ASAStruct(clubName: "MS/HS Korean Language & Social Studies", teacherName: "Korean Studies Teachers", groupImage: "KLSS", subName: "", description: "MS/HS Korean Languages & Social Studies (중/고등 한국교과수업)", dayOfWeek: 3, roomNumber: 0, location: "Various"),
        
        ASAStruct(clubName: "Strength and conditioning", teacherName: "Mr. Bergan", groupImage: "SaC", subName: "", description: "Are you interested in getting into shape for a sport? Getting in shape for personal health? Or just interested in learning how to lift weights for future goals? Then come join the strength and conditioning ASA with Mr. Bergan", dayOfWeek: 4, roomNumber: 0, location: "Fitness Center"),
        
        ASAStruct(clubName: "Painting Club", teacherName: "Ms. Wang", groupImage: "PC", subName: "", description: "Let's do pipo painting! Pipo painting is a slogan for 'Drawing it easy!' and also called a 'Puzzle painting'. Pipo painting is a type of DIY painting where you color in the numbers with the designated colors. Depending on what you choose, you don't actually color with paint when it comes to Diamond painting. Instead, you glue in small colored diamonds according to designated numbers/letters. Let's have a relaxing fun together with some nice music in Ms. Wang's room! If you want to see a nice example of pipo painting, feel free to visit Ms. Wang's room! We will work individually in a very safe environment and there will be some extra costs to purchase your pipo painting materials and that will cost about 10,000-15,000 won! Anybody can be an artist in this club!", dayOfWeek: 4, roomNumber: 202),
        
        ASAStruct(clubName: "Independent Study", teacherName: "Ms. Nagy", groupImage: "IndS", subName: "", description: "This is a goal-based Independent Study where students create goals (e.g. academic, activity-based, etc.), discover ways to achieve their goals, and have a space to work towards them. MS/HS students need administration approval.", dayOfWeek: 4, roomNumber: 306),
        
        ASAStruct(clubName: "Jets Flyover", teacherName: "Mr. Lipsky", groupImage: "JF", subName: "Journalism", description: "Students will research and report on school-wide news and events, explore graphic design, and piece together the official DIS newspaper and yearbook. They will write articles on topics such as past and future events, sports, arts, food, media, and any fun topics of their choice. They also take photographs, conduct interviews, and design cool games and contests that will be published in the newspaper and yearbook. This is a full-year commitment. Students that sign up 1st trimester will be automatically enrolled in 2nd and 3rd and it will be closed to new members after 1st trimester.", dayOfWeek: 4, roomNumber: 309),
        
        ASAStruct(clubName: "MS/HS Chess Club", teacherName: "Mr. Coleman", groupImage: "ChessC", subName: "", description: "Come learn competition chess and flex your chess skills against your friends every Thursday in Mr. Coleman's classroom. Every week there will be mini competitions between students and chances to learn and improve your chess game. Come see Mr. Coleman for more info.", dayOfWeek: 4, roomNumber: 201),
        
        ASAStruct(clubName: "High School Visual Arts Club", teacherName: "Mr. Gum", groupImage: "HSVAC", subName: "", description: "Are you interested in art? Do you want to help promote visual arts around our campus and community while practicing a wide range of visual art skills? Visual Arts Club would like to invite you to participate in a variety of collaborative art related activities. This club will also be associated with our official chapter of National Art Honors Society (NAHS).", dayOfWeek: 4, roomNumber: 101),
        
        ASAStruct(clubName: "HS Rock Band", teacherName: "Mr. Hutchings", groupImage: "HSRB", subName: "", description: "Join the High School Rock Band Club and unleash your inner rock star! Whether you're a seasoned musician or just starting out, our club offers a fun and supportive environment to jam, learn new skills, and rock out with friends. From classic rock to modern hits, come join us as we make music, build friendships, and rock the school stage!", dayOfWeek: 4, roomNumber: 406),
        
        ASAStruct(clubName: "HS Volleyball Skills ASA", teacherName: "Mr. Balint", groupImage: "HSVSA", subName: "", description: "Practicing Skills for Volleyball for HS students - including games, strategy, and skills coaching!", dayOfWeek: 4, roomNumber: 0, location: "Basketball Court"),
        
        ASAStruct(clubName: "MS/HS Club Nintendo", teacherName: "Mr. Hinkle", groupImage: "MHCN", subName: "", description: "Join us for fun games of Mario Kart 8, Mario Strikers, Splatoon 2 & 3, Super Smash Bros, Switch Sports, and Overcooked 2 among other games.", dayOfWeek: 4, roomNumber: 313),
        
        ASAStruct(clubName: "Writing Club", teacherName: "Ms. Loustch", groupImage: "WC", subName: "", description: "This club is designed for those who want to write, develop, workshop, and share their writing. We will meet in a relaxed environment to write and to encourage each other with the pieces we are working on. You can write anything: novels, news columns, memoirs, short stories, poems, song lyrics, movie scripts, creative essays, letters, jokes, fanfiction, and everything in-between. If you want to join a community of writers, come check us out!", dayOfWeek: 5, roomNumber: 314),
        
        ASAStruct(clubName: "String Orchestra Club", teacherName: "Mr. Hutchings", groupImage: "SOC", subName: "", description: "Immerse yourself in the enchanting world of music with our String Orchestra!", dayOfWeek: 5, roomNumber: 406),
        
        ASAStruct(clubName: "Advanced Media", teacherName: "Mr. Lipsky", groupImage: "AM", subName: "", description: "Advanced Media is offered to current leaders and editors of the Journalism class, Video Production class, Jet Stream ASA, Jets Flyover ASA, JBS Lunch Club, and photography Lunch Club. Students will use this ASA to work on media projects of their choice. Students in leadership positions in any DIS media class, ASA, or Lunch Club are encouraged to join so they can get extra time to work on their media projects. Students will also get the chance to produce podcasts in this ASA.", dayOfWeek: 5, roomNumber: 309),
        
        ASAStruct(clubName: "Prom Committee ASA", teacherName: "Mrs. Gum", groupImage: "PCA", subName: "", description: "This ASA is for members of Prom Committee who are available to join us during ASA time to continue preparing for Prom 2024. Tasks include researching ideas, planning and organizing aspects of the event and making decorations related to the theme. If you are not in our Prom Committee lunch club but are interested in joining or helping out during our ASA, please come and speak with Mrs. Gum!", dayOfWeek: 5, roomNumber: 104),
        
        ASAStruct(clubName: "HS Game Club", teacherName: "Mr. Coleman", groupImage: "HSGC", subName: "", description: "Come hang out with your peers and play some games and relax after a long week of work! We will play games such as computer games, nintendo switch, board games, and more! If you have any questions please reach out to Mr. Coleman.", dayOfWeek: 5, roomNumber: 201),
        
        ASAStruct(clubName: "Busking Club", teacherName: "Mr. Park", groupImage: "BuskC", subName: "", description: "Step into the spotlight with the Busking Club! Every week, we'll be taking our musical talents outdoors to perform for the community. Whether you love singing your heart out or playing instruments, this is the ideal club for those who have a passion for making music and want to share it with the world. If you've been honing your skills at home and itching for the perfect opportunity to showcase your talents, look no further. Join the Busking Club and let your confidence shine as we create magical moments through music for all to enjoy!", dayOfWeek: 5, roomNumber: 408),
        
        ASAStruct(clubName: "DAWG", teacherName: "Mr. Jolly", groupImage: "DAWG", subName: "Dog Assistance and Walking Group", description: "The Dog Assistance and Walking Group (DAWG) is an after school activity designed for students from grades 3-12 to learn dog walking skills and promote care for canines.", dayOfWeek: 5, roomNumber: 0, location: "Off-campus"),
        
        ASAStruct(clubName: "HS Girls Futsal", teacherName: "Mr. Gall & Mr. Faille", groupImage: "HGF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments on Monday’s and Friday’s. They will be coached by Mr. Gall and Mr. Faille.", dayOfWeek: 5, roomNumber: 0, location: "DIS Futsal Fields"),
        
        ASAStruct(clubName: "HS Boys Futsal", teacherName: "Mr. Purdy", groupImage: "HBF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments. They will be coached by Mr. Purdy.", dayOfWeek: 5, roomNumber: 0, location: "DIS Futsal Fields")
        
    ]
    
    static let Middle: Array = [
        // Monday
        ASAStruct(clubName: "Basketball", teacherName: "Mr. Bergan", groupImage: "BB", subName: "", description: "Coming Soon", dayOfWeek: 1, roomNumber: 10)
        
    ]
    
    static let Elementary: Array = [
        // Monday
        ASAStruct(clubName: "MockView", teacherName: "Mock", groupImage: "HC", subName: "MOCK", description: "MOCK", dayOfWeek: 1, roomNumber: 10)
        
    ]
}

