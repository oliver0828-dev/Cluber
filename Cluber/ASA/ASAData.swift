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
    var quarter: String = "All"
    var sports: String = "N"
    var championship: Bool = false
    
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
        ASAStruct(clubName: "FAB LAB", teacherName: "Mr. Gum", groupImage: "FL", subName: "Fabrication LAB", description: "Join DIS FAB LAB, a student managed club for students in grades 6 to 12. Make an impact in our school community by assisting teachers with essential services. Use state of the art technology from a professional, wide format printer to 3D printers and an automated vinyl cutter. Collaborate with peers, to provide teacher services such as printing, photocopying, 3D designing and printing.", dayOfWeek: 1,roomNumber: 410),
        
        ASAStruct(clubName: "Jets Stream", teacherName: "Mr. Lipsky", groupImage: "JS", subName: "", description: "Jet Streamers will produce news broadcasts. They become journalists, find and report news stories, and broadcast their work on the DISTV YouTube channel", dayOfWeek: 1, roomNumber: 309),
        
        ASAStruct(clubName: "Rummikub Club", teacherName: "Ms. Wang", groupImage: "RC", subName: "", description: "Do you want to have a lot of fun with your friends and Ms. Wang by playing a very exciting board game called Rummikub? Rummikub is a very fun and easy number board game which you can learn easily if you don't know how to play! Ms. Wang is an expert Rummikub player and will help you learn and enjoy a lot. Join and let's have fun together!!!", dayOfWeek: 1, roomNumber: 202),
        
        ASAStruct(clubName: "Beginner Instruments" , teacherName: "Mr. Hutchings", groupImage: "BI", subName: "", description: "Ever wanted to learn a second instrument? Or maybe even your first? This asa is for students who want to explore new instruments. The school has limited supply of extra Instruments to borrow, but if we don't have one you'll have to buy your own, so make sure to contact Mr Hutchings as soon as you sign up to ask about supply.", dayOfWeek: 1, roomNumber: 406),
        
        ASAStruct(clubName: "HS Girls Futsal", teacherName: "Mr. Gall & Mr. Faille", groupImage: "HGF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments on Monday’s and Friday’s. They will be coached by Mr. Gall and Mr. Faille.", dayOfWeek: 1, roomNumber: 0, location: "DIS Futsal Fields", quarter: "3", sports: "futsal"),
        
        ASAStruct(clubName: "HS Boys Futsal", teacherName: "Mr. Purdy", groupImage: "HBF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments. They will be coached by Mr. Purdy.", dayOfWeek: 1, roomNumber: 0, location: "DIS Futsal Fields", quarter: "3", sports: "futsal"),
        
        ASAStruct(clubName: "HS Boys Basketball", teacherName: "Mr. Kaschub", groupImage: "HBB", subName: "", description: """
This is the SKAIS/KISAC team for high school basketball.  The teams will train to compete in SKAIS and KISAC tournaments. They also will compete once again
DMHS at Camp Walker.

Note: They will practice on Mondays from 4:30-6:00 pm and on Fridays from 2:50-4:20 pm.
""", dayOfWeek: 1, roomNumber: 0,location: "DIS Gym", socialMedia: true, instagramLink: "https://www.instagram.com/dis_basketball/", instagramID: "@dis_basketball", quarter: "2", sports: "basketball"),
        
        ASAStruct(clubName: "Crochet Club", teacherName: "Ms. Wang", groupImage: "CrochetC", subName: "", description: "Have you ever experienced with crocheting? Ms. Wang's crochet club invites students who have any experience with crocheting or want to learn how to crochet. We can make nice and useful items like decoration items or accessory for ourselves. We will buy our own kit and crochet together in my classroom! For more clarification, come to Ms. Wang and I'd love to talk with you more!", dayOfWeek: 2, roomNumber: 202),
        
        ASAStruct(clubName: "CSCC", teacherName: "Mr. Gall", groupImage: "CSCC", subName: "Computer Science Competition Club", description: "Come and join the Computer Science Competition Club! High school Students will work with Bolt and David in 12th grade to participate in coding competitions such as USACO (United States of America Computing Olympiad), ACSL (American Computer Science League), and other competitions throughout the year as a team representing DIS. Middle school students will work with Kevin and Tommy in 11th grade to gain coding experience and knowledge to participate in the junior divisions of these competitions. The competitions generally take place online at the weekends and there is a registration fee for this.", dayOfWeek: 2, roomNumber: 301),
        
        ASAStruct(clubName: "Illusion Dance Club", teacherName: "Ms. Lualhati", groupImage: "IDC", subName: "", description: "The Illusion dance team is a group of students who have personal goals for dancing. The students in this dance team form strong friendships and learn how to work as a group and how to become a valuable group member. The members of this dance team exhibit great sportsmanship and positive attitudes towards each other and the school community. The students will be trying something new, will be learning determination, teamwork, and precision.", dayOfWeek: 2, roomNumber: 404),
        
        ASAStruct(clubName: "Competitive Debate Club", teacherName: "Mr. Lipsky", groupImage: "CDC", subName: "", description: "Students learn debate strategies and research and debate issues together. Student coaches Annie and Leanne will lead each practice. They will find competitions for students to enter and try to win awards. Students must commit to joining the ASA for Season 2 and Season 3.", dayOfWeek: 2, roomNumber: 309),
        
        ASAStruct(clubName: "HS Badminton", teacherName: "Mr. Zhao", groupImage: "BBB", subName: "", description: "In this ASA, students will have an opportunity to show their badminton talent. They will be coached in playing the game and have internal matches with their friends.", dayOfWeek: 2, roomNumber: 0, location: "DIS Gym"),
        
        ASAStruct(clubName: "Open Studio", teacherName: "Mr. Gum", groupImage: "n/a", subName: "", description: """
This ASA is open to all HS students and will have a focus on observational drawing practice (still life and figure drawing). Life Drawing Studio will provide students opportunities to build their observational drawing skills.

Additionally, this ASA optionally provides High School Visual Arts students extra time in the art studio to work on their in-class art projects. If you're a HS art student it is highly encouraged that you sign up for this ASA to reserve extra time to work on your art assignments. This will be the only after school open studio time during Season 2. Weekend options for Open Art Studios are no longer available.
""", dayOfWeek: 2, roomNumber: 101),
        
        ASAStruct(clubName: "Elite Training Club", teacherName: "Mr. Purdy ", groupImage: "ETC", subName: "", description: "Come workout and get faster, stronger, leaner or just to work away the stress of the day. It is entirely up to you.", dayOfWeek: 1, roomNumber: 0, location: "Fitness Center"),
        
        ASAStruct(clubName: "NHD Club", teacherName: "Mr. Kaschub", groupImage: "NHD", subName: "", description: "National History Day Club will give students an opportunity to participate in National History Day, learn about the NHD process and work on their project. NHD Club is intended for students that are interested in completing an NHD project and would like some direction, assistance and time to complete a quality project. National History Day is a research-based historical inquiry project that culminates in the NHD Korea competition in the spring. Top qualifiers from the NHD Korea competition then have the opportunity to compete in the international NHD competition in the United States in the summer. NHD Club for Trimester 3 will only be open to students that qualify for the final NHD competition.", dayOfWeek: 2, roomNumber: 310),
        
        ASAStruct(clubName: "MS/HS Korean Language & Social Studies", teacherName: "Korean Studies Teachers", groupImage: "n/a", subName: "", description: "MS/HS Korean Languages & Social Studies (중/고등 한국교과수업)", dayOfWeek: 3, roomNumber: 0, location: "Various"),
        
        ASAStruct(clubName: "Fitness Club", teacherName: "Mr. Faille", groupImage: "SaC", subName: "", description: "Do you want to work on any personal objectives fitness-wise? Come and join the Fitness Club! We will be learning about how to train specific muscle groups and how to be able to plan for your objectives!", dayOfWeek: 4, roomNumber: 0, location: "Fitness Center"),
        
        ASAStruct(clubName: "Painting Club", teacherName: "Ms. Wang", groupImage: "PC", subName: "", description: "Let's do pipo painting! Pipo painting is a slogan for 'Drawing it easy!' and also called a 'Puzzle painting'. Pipo painting is a type of DIY painting where you color in the numbers with the designated colors. Depending on what you choose, you don't actually color with paint when it comes to Diamond painting. Instead, you glue in small colored diamonds according to designated numbers/letters. Let's have a relaxing fun together with some nice music in Ms. Wang's room! If you want to see a nice example of pipo painting, feel free to visit Ms. Wang's room! We will work individually in a very safe environment and there will be some extra costs to purchase your pipo painting materials and that will cost about 10,000-15,000 won! Anybody can be an artist in this club!", dayOfWeek: 4, roomNumber: 202),
        
        ASAStruct(clubName: "Independent Study", teacherName: "Ms. Nagy", groupImage: "IndS", subName: "", description: "This is a goal-based Independent Study where students create goals (e.g. academic, activity-based, etc.), discover ways to achieve their goals, and have a space to work towards them. MS/HS students need administration approval.", dayOfWeek: 4, roomNumber: 306),
        
        ASAStruct(clubName: "Jets Flyover", teacherName: "Mr. Lipsky", groupImage: "JF", subName: "Journalism", description: "Students will research and report on school-wide news and events, explore graphic design, and piece together the official DIS newspaper and yearbook. They will write articles on topics such as past and future events, sports, arts, food, media, and any fun topics of their choice. They also take photographs, conduct interviews, and design cool games and contests that will be published in the newspaper and yearbook. This is a full-year commitment. Students that sign up 1st trimester will be automatically enrolled in 2nd and 3rd and it will be closed to new members after 1st trimester.", dayOfWeek: 4, roomNumber: 309),
        
        ASAStruct(clubName: "Chess & Game Club", teacherName: "Mr. Coleman", groupImage: "ChessC", subName: "", description: "Come learn competition chess and flex your chess skills against your friends every Thursday in Mr. Coleman's classroom. Every week there will be mini competitions between students and chances to learn and improve your chess game. Come see Mr. Coleman for more info.", dayOfWeek: 4, roomNumber: 201),
        
        ASAStruct(clubName: "High School Visual Arts Club", teacherName: "Mr. Gum", groupImage: "n/a", subName: "", description: "Are you interested in art? Do you want to help promote visual arts around our campus and community while practicing a wide range of visual art skills? Visual Arts Club would like to invite you to participate in a variety of collaborative art related activities. This club will also be associated with our official chapter of National Art Honors Society (NAHS).", dayOfWeek: 4, roomNumber: 101),
        
        ASAStruct(clubName: "Thursday Rock Band", teacherName: "Mr. Hutchings", groupImage: "HSRB", subName: "", description: "Join the High School Rock Band Club and unleash your inner rock star! Whether you're a seasoned musician or just starting out, our club offers a fun and supportive environment to jam, learn new skills, and rock out with friends. From classic rock to modern hits, come join us as we make music, build friendships, and rock the school stage!", dayOfWeek: 4, roomNumber: 406),
        
        ASAStruct(clubName: "MS/HS Club Nintendo", teacherName: "Mr. Hinkle", groupImage: "MHCN", subName: "", description: "Join us for fun games of Mario Kart 8, Mario Strikers, Splatoon 2 & 3, Super Smash Bros, Switch Sports, and Overcooked 2 among other games.", dayOfWeek: 4, roomNumber: 313),
        
        ASAStruct(clubName: "Writing Club", teacherName: "Ms. Loustch", groupImage: "WC", subName: "", description: "This club is designed for those who want to write, develop, workshop, and share their writing. We will meet in a relaxed environment to write and to encourage each other with the pieces we are working on. You can write anything: novels, news columns, memoirs, short stories, poems, song lyrics, movie scripts, creative essays, letters, jokes, fanfiction, and everything in-between. If you want to join a community of writers, come check us out!", dayOfWeek: 5, roomNumber: 314),
        
        ASAStruct(clubName: "String Orchestra Club", teacherName: "Mr. Hutchings", groupImage: "SOC", subName: "", description: "Immerse yourself in the enchanting world of music with our String Orchestra!", dayOfWeek: 5, roomNumber: 406),
        
        ASAStruct(clubName: "Jets Media 101", teacherName: "Mr. Lipsky", groupImage: "n/a", subName: "", description: "Jets Media 101 is where students will produce any type of media content they choose. They can make Jet Stream videos, write Jets Flyover articles, record podcasts, learn photography and photo editing, or do graphic design for the yearbook. Students that can't join the official Jet Stream or Jets Flyover ASA into their schedule now have this option to be a part of the Jets media team. Student editors and leaders in any DIS media class, ASA, or Lunch Club are encouraged to join so they can get extra time to work on their media projects.", dayOfWeek: 5, roomNumber: 309),
        
        ASAStruct(clubName: "Prom Committee ASA", teacherName: "Mr. Jolly", groupImage: "n/a", subName: "", description: "The Prom Committee will be the planning team for the 24/25 Prom.", dayOfWeek: 5, roomNumber: 104),
        
        ASAStruct(clubName: "Busking Club", teacherName: "Mr. Park", groupImage: "BuskC", subName: "", description: "Step into the spotlight with the Busking Club! Every week, we'll be taking our musical talents outdoors to perform for the community. Whether you love singing your heart out or playing instruments, this is the ideal club for those who have a passion for making music and want to share it with the world. If you've been honing your skills at home and itching for the perfect opportunity to showcase your talents, look no further. Join the Busking Club and let your confidence shine as we create magical moments through music for all to enjoy!", dayOfWeek: 5, roomNumber: 408),
        
        ASAStruct(clubName: "DAWG", teacherName: "Mr. Jolly", groupImage: "DAWG", subName: "Dog Assistance and Walking Group", description: "The Dog Assistance and Walking Group (DAWG) is an after school activity designed for students from grades 3-12 to learn dog walking skills and promote care for canines.", dayOfWeek: 5, roomNumber: 0, location: "Off-campus"),
        
        ASAStruct(clubName: "HS Girls Futsal", teacherName: "Mr. Gall & Mr. Faille", groupImage: "HGF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments on Monday’s and Friday’s. They will be coached by Mr. Gall and Mr. Faille.", dayOfWeek: 5, roomNumber: 0, location: "DIS Futsal Fields", quarter: "3", sports: "futsal"),
        
        ASAStruct(clubName: "HS Boys Futsal", teacherName: "Mr. Purdy", groupImage: "HBF", subName: "", description: "This is the SKAC/KISAC team for high school futsal.  The teams will train to compete in SKAC and KISAC tournaments. They will be coached by Mr. Purdy.", dayOfWeek: 5, roomNumber: 0, location: "DIS Futsal Fields", quarter: "3", sports: "futsal"),
        
        ASAStruct(clubName: "HS Boy Volleyball", teacherName: "Mr. Bergan", groupImage: "HSBVBALL", subName: "", description: "This is the SKAIS/KISAC team for high school volleyball. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 1, roomNumber: 0, location: "DIS Gym", quarter: "1", sports: "volleyball", championship: true),
        
        ASAStruct(clubName: "HS Boy Volleyball", teacherName: "Mr. Bergan", groupImage: "HSBVBALL", subName: "", description: "This is the SKAIS/KISAC team for high school volleyball. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 5, roomNumber: 0, location: "DIS Gym", quarter: "1", sports: "volleyball"),
        
        ASAStruct(clubName: "HS Boys Basketball", teacherName: "Mr. Kaschub", groupImage: "HBB", subName: "", description: """
This is the SKAIS/KISAC team for high school basketball.  The teams will train to compete in SKAIS and KISAC tournaments. They also will compete once again DMHS at Camp Walker.

Note: They will practice on Mondays from 4:30-6:00 pm and on Fridays from 2:50-4:20 pm.
""", dayOfWeek: 5, roomNumber: 0,location: "DIS Gym", socialMedia: true, instagramLink: "https://www.instagram.com/dis_basketball/", instagramID: "@dis_basketball", quarter: "2", sports: "basketball"),
        
        ASAStruct(clubName: "HS Cross Country", teacherName: "Mr. Coleman", groupImage: "HSCC", subName: "", description: "This is the SKAIS team for middle school and high school cross country. The teams will train to compete in SKAIS tournaments", dayOfWeek: 1, roomNumber: 0, location: "Bongmu Lake", quarter: "1"),
        
        ASAStruct(clubName: "HS Cross Country", teacherName: "Mr. Coleman", groupImage: "HSCC", subName: "", description: "This is the SKAIS team for middle school and high school cross country. The teams will train to compete in SKAIS tournaments", dayOfWeek: 5, roomNumber: 0, location: "Bongmu Lake", quarter: "1"),
        
        ASAStruct(clubName: "HS Girls Volleyball", teacherName: "Mrs. Jolly", groupImage: "HSGVBALL", subName: "", description: "This is the SKAIS/KISAC team for high school volleyball. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 1, roomNumber: 0, location: "DIS Gym", quarter: "1", sports: "volleyball"),
        
        ASAStruct(clubName: "HS Girls Volleyball", teacherName: "Mrs. Jolly", groupImage: "HSGVBALL", subName: "", description: "This is the SKAIS/KISAC team for high school volleyball. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 5, roomNumber: 0, location: "DIS Gym", quarter: "1", sports: "volleyball"),
        
        ASAStruct(clubName: "TEDx Youth" , teacherName: "Dr. White", groupImage: "TEDX", subName: "", description: "Do you enjoy public speaking and listening to TED talks? How about organizing, designing, and promoting these thrilling events? In our ASA, we will plan and implement a schoolwide TEDx event. This is your chance to take part in organizing a massive speech gathering with diverse people and topics to hear from during ASA Season 1 and 2. Come and join us!", dayOfWeek: 5, roomNumber: 307),
        
        ASAStruct(clubName: "Yoga", teacherName: "Ms. Spaeth", groupImage: "n/a", subName: "", description: "Join us for a relaxing and rejuvenating experience after school doing yoga! Open to students 6-12 who are interested in exploring the benefits of yoga, from improving flexibility and strength to reducing stress and enhancing mindfulness. Whether you're a beginner or have some experience, our sessions will guide you through a variety of poses and breathing techniques in a supportive and welcoming environment. (Ms. Spaeth is not a certified yoga teacher. We will watch videos and practice yoga skills together!)", dayOfWeek: 5, roomNumber: 0, location: "Yoga Studio"),
        
        ASAStruct(clubName: "Esports: League of Legends", teacherName: "Mr. Hinkle", groupImage: "n/a", subName: "", description: " While League of Legends has been around for some time, it is finally joining the ranks of Esports offered at DIS. No prior skills are needed; however, you will need to sign up for Riot games account. The game is playable on either a laptop PC or Macbook. MInimum specs for a PC Laptop is Windows 10 (64 bit), Intel Core i3 530 or AMD A6 3650, 2GB RAM, GPU: AMD Radeon HD 6570 or Nvidia GeForce 9600 GT or Intel HD 400, and Storage of 16 GB HDD.", dayOfWeek: 4, roomNumber: 313),
        
        ASAStruct(clubName: "Tuesday Rock Band", teacherName: "Mr. Hutchings", groupImage: "HSRB", subName: "", description: "Join the High School Rock Band Club and unleash your inner rock star! Whether you're a seasoned musician or just starting out, our club offers a fun and supportive environment to jam, learn new skills, and rock out with friends. From classic rock to modern hits, come join us as we make music, build friendships, and rock the school stage!", dayOfWeek: 2, roomNumber: 406),
        
        ASAStruct(clubName: "Cheer Team", teacherName: "Mrs. Kaschub", groupImage: "n/a", subName: "", description: "Do you have school spirit?! Do you have experience with cheer or dance? Join the MS/HS Cheer Team! The cheer team will perform at school assemblies and a variety of sporting events hosted at DIS. We will begin the season by perfecting the basics and then work toward more advanced skills, jumps, and stunts. In order to grow our skills as a team, this will be a yearlong commitment :)", dayOfWeek: 4, roomNumber: 404),
        
        ASAStruct(clubName: "MODEL UNITED NATIONS PROGRAM", teacherName: "Ms. Downie", groupImage: "MUN", subName: "", description: """
The Model United Nations is a series of programs run throughout the country and the world with the goals of furthering understanding about the United Nations, educating participants about world issues and promoting peace and the work of the United Nations through cooperation and diplomacy. Model UN conferences help students develop public speaking, writing, and research skills. In addition, they often provide students with their first entry point into international affairs and concepts. These affairs and concepts include peace and security, human rights, development, and rule of law issues. Joining a Model UN team will give you the experience needed to be successful in your future academic life and career. The skills acquired during the MUN process will be invaluable. The places you go and the people you meet will leave lasting impressions. Model UN is unlike any other high school activity. If you want to meet students from all over the world, overcome your fear of public speaking, become acquainted with diplomacy and international issues, enhance your leadership skills, and potentially enjoy high school more than ever before- then MUN might just be for you!

""", dayOfWeek: 2, roomNumber: 101),
        
        ASAStruct(clubName: "Drama Club", teacherName: "Ms. Nagy", groupImage: "n/a", subName: "", description: "Do you like acting? Would you like to be part of a production? Come to Drama Club to showcase your passion for storytelling! This club is led by Ms. Nagy along with student support. We are seeking young actors from grades 6-12. Students will have the opportunity to practice acting, composing a play, and work in groups. For the duration of the trimester, our ultimate goal is to hold a performance at the assembly for our DIS community to enjoy!", dayOfWeek: 1, roomNumber: 306),
        
        ASAStruct(clubName: "High School Open Ceramics Studio", teacherName: "Mr. Gum", groupImage: "n/a", subName: "", description: "This ASA is OPEN TO ALL HS students and will have a focus on pottery and ceramics. Additionally, this ASA optionally provides High School Visual Arts students extra time in the art studio to work on their in-class art projects. If you're a HS art student it is highly encouraged that you sign up for this ASA to reserve extra time to work on your art assignments. This will be the only after school open studio time during Season 1. Weekend options for Open Art Studios are no longer available.", dayOfWeek: 2, roomNumber: 101),
        
        ASAStruct(clubName: "Cooking and Games ASA", teacherName: "Ms. Zhu", groupImage: "n/a", subName: "", description: "Learn to cook from scratch! Bring your own board games to play with friends in between!", dayOfWeek: 2, roomNumber: 0, location: "Dorm Kitchen"),
        
        ASAStruct(clubName: "MS/HS Club Nintendo", teacherName: "Mr. Hinkle", groupImage: "MHCN", subName: "", description: "Join us for fun games of Mario Kart 8, Mario Strikers, Splatoon 2 & 3, Super Smash Bros, Switch Sports, and Overcooked 2 among other games.", dayOfWeek: 2, roomNumber: 313),
        
    ASAStruct(clubName: "Podcast Production", teacherName: "Mr. Lipsky", groupImage: "n/a", subName: "", description: "Students will write, record, and edit audio podcast episodes. They will learn how to create original series and find unique stories. Students will use professional quality recording equipment and editing software. Finished podcasts will be published on the Jets Flyover website, along with logos, graphics, and writing to market and promote their shows.", dayOfWeek: 2, roomNumber: 309),
        
        ASAStruct(clubName: "HS Girls Basketball", teacherName: "Mr. Park", groupImage: "n/a", subName: "", description: """
This is the SKAIS/KISAC team for high school basketball.  The teams will train to compete in SKAIS and KISAC tournaments. They also will compete once again DMHS at Camp Walker.

Note: They will practice on Mondays from 4:30-6:00 pm and on Fridays from 2:50-4:20 pm.
""", dayOfWeek: 5, roomNumber: 0,location: "DIS Gym", quarter: "2", sports: "basketball"),
        
        ASAStruct(clubName: "HS Girls Basketball", teacherName: "Mr. Park", groupImage: "n/a", subName: "", description: """
This is the SKAIS/KISAC team for high school basketball.  The teams will train to compete in SKAIS and KISAC tournaments. They also will compete once again DMHS at Camp Walker.

Note: They will practice on Mondays from 4:30-6:00 pm and on Fridays from 2:50-4:20 pm.
""", dayOfWeek: 1, roomNumber: 0,location: "DIS Gym", quarter: "2", sports: "basketball")
        
        
        
    ]
    
    static let Middle: Array = [
        // Monday
        ASAStruct(clubName: "Middle School Movie Club", teacherName: "Ms. Loustch", groupImage: "n/a", subName: "", description: "Do you love MOVIES, laughing, and having fun with your friends? Well then, Middle School Movie Club is the right ASA for you. In Movie Club, we watch different genres of movies and have lively discussions following the movie. If you’re interested in watching movies, and sign up for the Middle School Movie Club!", dayOfWeek: 1, roomNumber: 314),
        ASAStruct(clubName: "MS/HS Club Nintendo", teacherName: "Mr. Hinkle", groupImage: "MHCN", subName: "", description: "Join us for fun games of Mario Kart 8, Mario Strikers, Splatoon 2 & 3, Super Smash Bros, Switch Sports, and Overcooked 2 among other games.", dayOfWeek: 1, roomNumber: 313),
        ASAStruct(clubName: "Jets Stream", teacherName: "Mr. Lipsky", groupImage: "JS", subName: "", description: "Jet Streamers will produce news broadcasts. They become journalists, find and report news stories, and broadcast their work on the DISTV YouTube channel", dayOfWeek: 1, roomNumber: 309),
        ASAStruct(clubName: "FAB LAB", teacherName: "Mr. Gum", groupImage: "FL", subName: "Fabrication LAB", description: "Join DIS FAB LAB, a student managed club for students in grades 6 to 12. Make an impact in our school community by assisting teachers with essential services. Use state of the art technology from a professional, wide format printer to 3D printers and an automated vinyl cutter. Collaborate with peers, to provide teacher services such as printing, photocopying, 3D designing and printing.", dayOfWeek: 1,roomNumber: 410),
        ASAStruct(clubName: "Drama Club", teacherName: "Ms. Nagy", groupImage: "n/a", subName: "", description: "Do you like acting? Would you like to be part of a production? Come to Drama Club to showcase your passion for storytelling! This club is led by Ms. Nagy along with student support. We are seeking young actors from grades 6-12. Students will have the opportunity to practice acting, composing a play, and work in groups. For the duration of the trimester, our ultimate goal is to hold a performance at the assembly for our DIS community to enjoy!", dayOfWeek: 1, roomNumber: 306),
        ASAStruct(clubName: "Rummikub Club", teacherName: "Ms. Wang", groupImage: "RC", subName: "", description: "Do you want to have a lot of fun with your friends and Ms. Wang by playing a very exciting board game called Rummikub? Rummikub is a very fun and easy number board game which you can learn easily if you don't know how to play! Ms. Wang is an expert Rummikub player and will help you learn and enjoy a lot. Join and let's have fun together!!!", dayOfWeek: 1, roomNumber: 202),
        ASAStruct(clubName: "MS Girls Futsal", teacherName: "Mr. Faille", groupImage: "MSGF", subName: "", description: "This is the SKAIS/KISAC team for middle school futsal. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 1, roomNumber: 0, location: "DIS Futsal Field", quarter: "1", sports: "futsal"),
        ASAStruct(clubName: "MS Boys Futsal", teacherName: "Mr. Gall", groupImage: "MSBF", subName: "", description: "This is the SKAIS/KISAC team for middle school futsal. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 1, roomNumber: 0, location: "DIS Futsal Field", quarter: "1", sports: "futsal"),
        ASAStruct(clubName: "MS Cross Country", teacherName: "Mr. Coleman", groupImage: "HSCC", subName: "", description: "This is the SKAIS team for middle school and high school cross country. The teams will train to compete in SKAIS tournaments", dayOfWeek: 1, roomNumber: 0, location: "Bongmu Lake", quarter: "1"),
        
        // Tuesday
        ASAStruct(clubName: "Middle School Dance Team", teacherName: "Ms. Medina", groupImage: "n/a", subName: "", description: "Hey, I have been hearing you are looking for a chance to dance! This is your chance! Join the Middle School Dance Team and learn choreographies and rhythms from different parts of the world. Be ready to work hard but to also have fun with your friends!", dayOfWeek: 2, roomNumber: 0, location: "Yoga Studio"),
        ASAStruct(clubName: "MS Badminton", teacherName: "Mr. Zhao", groupImage: "BBB", subName: "", description: "In this ASA, students will have an opportunity to show their badminton talent. They will be coached in playing the game and have internal matches with their friends.", dayOfWeek: 2, roomNumber: 0, location: "DIS Gym"),
        ASAStruct(clubName: "NHD Club", teacherName: "Mr. Kaschub", groupImage: "NHD", subName: "", description: "National History Day Club will give students an opportunity to participate in National History Day, learn about the NHD process and work on their project. NHD Club is intended for students that are interested in completing an NHD project and would like some direction, assistance and time to complete a quality project. National History Day is a research-based historical inquiry project that culminates in the NHD Korea competition in the spring. Top qualifiers from the NHD Korea competition then have the opportunity to compete in the international NHD competition in the United States in the summer. NHD Club for Trimester 3 will only be open to students that qualify for the final NHD competition.", dayOfWeek: 2, roomNumber: 310),
        ASAStruct(clubName: "Tuesday Rock Band", teacherName: "Mr. Hutchings", groupImage: "MSRB", subName: "", description: "Genres range from pop to rock and anything in between. Instruments played include: Guitar, Bass, Keyboard, Drums, Vocals, and some wind instruments such as Trumpet, Trombone, and Saxophone (depending on the current covid situation).", dayOfWeek: 2, roomNumber: 406),
        ASAStruct(clubName: "Jets Media 101", teacherName: "Mr. Lipsky", groupImage: "n/a", subName: "", description: "Jets Media 101 is where students will produce any type of media content they choose. They can make Jet Stream videos, write Jets Flyover articles, record podcasts, learn photography and photo editing, or do graphic design for the yearbook. Students that can't join the official Jet Stream or Jets Flyover ASA into their schedule now have this option to be a part of the Jets media team. Student editors and leaders in any DIS media class, ASA, or Lunch Club are encouraged to join so they can get extra time to work on their media projects.", dayOfWeek: 2, roomNumber: 309),
        ASAStruct(clubName: "Crochet Club", teacherName: "Ms. Wang", groupImage: "CrochetC", subName: "", description: "Have you ever experienced with crocheting? Ms. Wang's crochet club invites students who have any experience with crocheting or want to learn how to crochet. We can make nice and useful items like decoration items or accessory for ourselves. We will buy our own kit and crochet together in my classroom! For more clarification, come to Ms. Wang and I'd love to talk with you more!", dayOfWeek: 2, roomNumber: 202),
        ASAStruct(clubName: "Cooking and Games ASA", teacherName: "Ms. Zhu", groupImage: "n/a", subName: "", description: "Learn to cook from scratch! Bring your own board games to play with friends in between!", dayOfWeek: 2, roomNumber: 0, location: "Dorm Kitchen"),
        ASAStruct(clubName: "CSCC", teacherName: "Mr. Gall", groupImage: "CSCC", subName: "Computer Science Competition Club", description: "Come and join the Computer Science Competition Club! High school Students will work with Bolt and David in 12th grade to participate in coding competitions such as USACO (United States of America Computing Olympiad), ACSL (American Computer Science League), and other competitions throughout the year as a team representing DIS. Middle school students will work with Kevin and Tommy in 11th grade to gain coding experience and knowledge to participate in the junior divisions of these competitions. The competitions generally take place online at the weekends and there is a registration fee for this.", dayOfWeek: 2, roomNumber: 301),
        ASAStruct(clubName: "MS/HS Club Nintendo", teacherName: "Mr. Hinkle", groupImage: "MHCN", subName: "", description: "Join us for fun games of Mario Kart 8, Mario Strikers, Splatoon 2 & 3, Super Smash Bros, Switch Sports, and Overcooked 2 among other games.", dayOfWeek: 2, roomNumber: 313),
        ASAStruct(clubName: "Podcast Production", teacherName: "Mr. Lipsky", groupImage: "n/a", subName: "", description: "Students will write, record, and edit audio podcast episodes. They will learn how to create original series and find unique stories. Students will use professional quality recording equipment and editing software. Finished podcasts will be published on the Jets Flyover website, along with logos, graphics, and writing to market and promote their shows.", dayOfWeek: 2, roomNumber: 309),
        
        // Wednesday
        ASAStruct(clubName: "MS/HS Korean Language & Social Studies", teacherName: "Korean Studies Teachers", groupImage: "n/a", subName: "", description: "MS/HS Korean Languages & Social Studies (중/고등 한국교과수업)", dayOfWeek: 3, roomNumber: 0, location: "Various"),
        
        // Thursday
        ASAStruct(clubName: "Thursday Rock Band", teacherName: "Mr. Hutchings", groupImage: "MSRB", subName: "", description: "Genres range from pop to rock and anything in between. Instruments played include: Guitar, Bass, Keyboard, Drums, Vocals, and some wind instruments such as Trumpet, Trombone, and Saxophone (depending on the current covid situation).", dayOfWeek: 2, roomNumber: 406),
        
        ASAStruct(clubName: "Chess & Game Club", teacherName: "Mr. Coleman", groupImage: "ChessC", subName: "", description: "Come learn competition chess and flex your chess skills against your friends every Thursday in Mr. Coleman's classroom. Every week there will be mini competitions between students and chances to learn and improve your chess game. Come see Mr. Coleman for more info.", dayOfWeek: 4, roomNumber: 201),
        
        ASAStruct(clubName: "Jets Flyover", teacherName: "Mr. Lipsky", groupImage: "JF", subName: "Journalism", description: "Students will research and report on school-wide news and events, explore graphic design, and piece together the official DIS newspaper and yearbook. They will write articles on topics such as past and future events, sports, arts, food, media, and any fun topics of their choice. They also take photographs, conduct interviews, and design cool games and contests that will be published in the newspaper and yearbook. This is a full-year commitment. Students that sign up 1st trimester will be automatically enrolled in 2nd and 3rd and it will be closed to new members after 1st trimester.", dayOfWeek: 4, roomNumber: 309),
        
        ASAStruct(clubName: "Painting Club", teacherName: "Ms. Wang", groupImage: "PC", subName: "", description: "Let's do pipo painting! Pipo painting is a slogan for 'Drawing it easy!' and also called a 'Puzzle painting'. Pipo painting is a type of DIY painting where you color in the numbers with the designated colors. Depending on what you choose, you don't actually color with paint when it comes to Diamond painting. Instead, you glue in small colored diamonds according to designated numbers/letters. Let's have a relaxing fun together with some nice music in Ms. Wang's room! If you want to see a nice example of pipo painting, feel free to visit Ms. Wang's room! We will work individually in a very safe environment and there will be some extra costs to purchase your pipo painting materials and that will cost about 10,000-15,000 won! Anybody can be an artist in this club!", dayOfWeek: 4, roomNumber: 202),
        
        ASAStruct(clubName: "Cheer Team", teacherName: "Mrs. Kaschub", groupImage: "n/a", subName: "", description: "Do you have school spirit?! Do you have experience with cheer or dance? Join the MS/HS Cheer Team! The cheer team will perform at school assemblies and a variety of sporting events hosted at DIS. We will begin the season by perfecting the basics and then work toward more advanced skills, jumps, and stunts. In order to grow our skills as a team, this will be a yearlong commitment :)", dayOfWeek: 4, roomNumber: 404),
        
        ASAStruct(clubName: "Independent Study", teacherName: "Ms. Nagy", groupImage: "IndS", subName: "", description: "This is a goal-based Independent Study where students create goals (e.g. academic, activity-based, etc.), discover ways to achieve their goals, and have a space to work towards them. MS/HS students need administration approval.", dayOfWeek: 4, roomNumber: 306),
        
        // Friday
        ASAStruct(clubName: "Costume Club", teacherName: "Mrs. Gum", groupImage: "n/a", subName: "", description: "Are you interested in creating your own costumes for Spirit Week and Halloween? Get ready with Mrs Gum! We will plan and make costumes or costume pieces for you to wear and use during Spirit Week!", dayOfWeek: 5, roomNumber: 104),
        ASAStruct(clubName: "String Orchestra Club", teacherName: "Mr. Hutchings", groupImage: "SOC", subName: "", description: "Immerse yourself in the enchanting world of music with our String Orchestra!", dayOfWeek: 5, roomNumber: 406),
        ASAStruct(clubName: "Jets Media 101", teacherName: "Mr. Lipsky", groupImage: "n/a", subName: "", description: "Jets Media 101 is where students will produce any type of media content they choose. They can make Jet Stream videos, write Jets Flyover articles, record podcasts, learn photography and photo editing, or do graphic design for the yearbook. Students that can't join the official Jet Stream or Jets Flyover ASA into their schedule now have this option to be a part of the Jets media team. Student editors and leaders in any DIS media class, ASA, or Lunch Club are encouraged to join so they can get extra time to work on their media projects.", dayOfWeek: 5, roomNumber: 309),
        ASAStruct(clubName: "Writing Club", teacherName: "Ms. Loustch", groupImage: "WC", subName: "", description: "This club is designed for those who want to write, develop, workshop, and share their writing. We will meet in a relaxed environment to write and to encourage each other with the pieces we are working on. You can write anything: novels, news columns, memoirs, short stories, poems, song lyrics, movie scripts, creative essays, letters, jokes, fanfiction, and everything in-between. If you want to join a community of writers, come check us out!", dayOfWeek: 5, roomNumber: 314),
        ASAStruct(clubName: "Busking Club", teacherName: "Mr. Park", groupImage: "BuskC", subName: "", description: "Step into the spotlight with the Busking Club! Every week, we'll be taking our musical talents outdoors to perform for the community. Whether you love singing your heart out or playing instruments, this is the ideal club for those who have a passion for making music and want to share it with the world. If you've been honing your skills at home and itching for the perfect opportunity to showcase your talents, look no further. Join the Busking Club and let your confidence shine as we create magical moments through music for all to enjoy!", dayOfWeek: 5, roomNumber: 408),
        ASAStruct(clubName: "MS Girls Futsal", teacherName: "Mr. Faille", groupImage: "MSGF", subName: "", description: "This is the SKAIS/KISAC team for middle school futsal. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 5, roomNumber: 0, location: "DIS Futsal Field", quarter: "1", sports: "futsal"),
        ASAStruct(clubName: "MS Boys Futsal", teacherName: "Mr. Gall", groupImage: "MSBF", subName: "", description: "This is the SKAIS/KISAC team for middle school futsal. The teams will train to compete in SKAIS and KISAC tournaments.", dayOfWeek: 5, roomNumber: 0, location: "DIS Futsal Field", quarter: "1", sports: "futsal")
    ]
    
    
}

