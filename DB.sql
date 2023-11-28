<<<<<<< HEAD
﻿CREATE DATABASE prj301_database722;
=======
<<<<<<< HEAD
﻿CREATE DATABASE prj301_database24
=======
﻿CREATE DATABASE prj301_database30;
>>>>>>> 14b77cf494ed3b1139f3677fc546eac1467d9632
>>>>>>> aef8e0caf1da47b1e8dac49d390718c6babdf917


USE [prj301_database722]
GO


CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(191) NOT NULL,
    email VARCHAR(191) NOT NULL,
    password VARCHAR(191) NOT NULL,
    created_at DATETIME DEFAULT NULL,
    address NVARCHAR(191) NOT NULL,
    phonenumber VARCHAR(20) NULL,
	avatar_link NVARCHAR(MAX)
);
CREATE TABLE Pets (
    pet_id INT PRIMARY KEY ,
    user_id INT NOT NULL,
    pet_name VARCHAR(255) NOT NULL,
    pet_age INT,
	allergy VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    order_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE ServiceProvider (
    provider_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    service_type VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
	price_ServiceProvider FLOAT NOT NULL,
	date DATE NOT NULL,
	status bit NOT NULL
<<<<<<< HEAD
);
CREATE TABLE PurchasedServices (
    user_id INT NOT NULL,
    provider_id INT NOT NULL,
    purchase_date DATETIME DEFAULT NULL,
    status bit NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (provider_id) REFERENCES ServiceProvider(provider_id)
);
CREATE TABLE Pets (
    pet_id INT PRIMARY KEY ,
    user_id INT NOT NULL,
    pet_name VARCHAR(255) NOT NULL,
    pet_age INT,
	allergy VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    order_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY ,
    user_id INT,
    provider_id INT,
    pet_id INT,
    date DATE NOT NULL,
    time TIME NOT NULL,
    status VARCHAR(255) NOT NULL,
=======
);
CREATE TABLE PurchasedServices (
    user_id INT IDENTITY(1,1) NOT NULL,
    provider_id INT NOT NULL,
    purchase_date DATETIME DEFAULT NULL,
    status bit NOT NULL,
>>>>>>> aef8e0caf1da47b1e8dac49d390718c6babdf917
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (provider_id) REFERENCES ServiceProvider(provider_id)
);






CREATE TABLE Resources (
    resource_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(MAX) NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
    content_resources NVARCHAR(MAX) NOT NULL,
    category NVARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    author_name NVARCHAR(255) NOT NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP NULL,
    image_link NVARCHAR(MAX),
    FOREIGN KEY (author_id) REFERENCES Users(user_id)
);


CREATE TABLE Comment (
    comment_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    content_comment VARCHAR(MAX) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Contact(
   lineadd INT NOT NULL,
   cname VARCHAR(191) NOT NULL,
     email VARCHAR(191) NOT NULL,
	message NVARCHAR(MAX) NOT NULL
);


	INSERT INTO Users (name, email, password, created_at, address, phonenumber)
VALUES
    ('Huu Bao', 'huubao@email.com', 'password123', GETDATE(), '123 Fake St.', '0912325434'),
    ('Van Son', 'vanson@email.com', 'password456', GETDATE(), '456 Main St.', '0912325435'),
    ('Anh Khoa', 'anhkhoa@email.com', 'password789', GETDATE(), '789 Elm St.', '0912325436'),
	('admin', 'admin', 'admin','', '', '');
INSERT INTO Resources (title, description, content_resources, category, author_id, author_name,created_date,image_link)
VALUES
	(N'Learn about Rickettsia in dogs – 9 things to know', 'Rickettsia', N'Lets find out what is rickettsia bacteria? Is rickettsial infection in dogs dangerous? What are the causative signs of rickettsia in dogs? All will be in the following article. What is Rickettsia bacteria ?
Rickettsial microorganisms are small, intracellular and obligate bacteria in the order Rickettsiales. Two families – Anaplasmataceae and Rickettsiaceae – contain species that infect dogs. These pathogens are transmitted by a variety of parasitic ticks and are maintained in wild animals and domestic sources, and can cause clinical disease in humans, dogs, and other animal species. This article discusses the basic epidemiology, clinical presentation, diagnosis, and treatment of rickettsia in dogs.
What is Rickettsia Infection? 
Rickettsia infections in dogs are caused by bacteria of the genus Rickettsia, which are often carried by arthropods such as ticks and fleas. There are several different types of infections, with two commonly seen in dogs. Infections can be treated with antibiotics, but treatment needs to start as soon as possible, which is why an early and accurate diagnosis is so important for a better outcome. 
Rickettsia bacteria are responsible for a number of infections, including Ehrlichiosis, Anaplasmosis, and Rocky Mountain spotted fever in canines. Ticks are absolutely the most common bacterial vector for dogs, with three species being the most common. Rickettsia infection in dogs can lead to serious clinical signs if the disease is allowed to progress to a chronic stage. Causes of Rickettsia Infection in Dogs 
Rickettsia is spread to dogs by ticks, specifically the brown dog tick, the American dog tick and the Rocky Mountain wood tick, along with several other related species depending on the country of residence. reside. When a tick bites a dog, the bite can become contaminated with the arthropod saliva, leading to a bacterial infection. This causes Rickettsia in dogs. Summary
Rickettsial pathogens in dogs are an important medical problem for the health of dogs. Altering tick distribution and nonspecific clinical signs can make it difficult to identify infected pets. becomes difficult and the diagnostic tests available should be interpreted on the basis of clinical presentation.
Antibiotic therapy continues to be an essential diagnostic option, especially for critically ill dogs. Based on medical and diagnostic challenges, all dogs are recommended to be checked for ticks year-round. Acaricide is currently the only way to prevent Rickettsia infection in dogs.', N'Dog',1,N'Huu Bao',GETDATE(),N''),
(N'6 health problems, the most common diseases in cats', N'Health problems', N'Cats are very good at maintaining their own health. But even your picky feline can not prevent some of the most common cat diseases and health problems. Vomit
Vomiting is a very common problem in cats with a multitude of causes. These range from eating something poisonous or inedible (like string), infection, urinary tract disease or diabetes to hairballs.
Symptoms are often obvious, including drooling and a distended abdomen. Vomiting can dehydrate a cat quickly, so if the kitten continues to vomit or appears ill, call your veterinarian immediately. It can be helpful to collect samples of your cat vomit and bring them to the vet.
See more articles on How to prevent and treat cat "Hairball" hairballs: Here
Feline Lower Urinary Tract Diseases (FLUTD)
Some estimates say up to 3% of cats a veterinarian sees have feline lower urinary tract disease (FLUTD), which is actually a group of feline illnesses with multiple causes.
Male and female cats can get FLUTD, and it usually occurs in cats who are overweight or disproportionate or eat dry food. Stress, a large family, and sudden changes can all increase your cat risk of developing FLUTD, and treatment depends on the type of FLUTD your cat has. FLUTD symptoms include: Drink more water, Stress while urinating, Blood in urine, .... Vermin Fleas are a very common external health problem for cats. But it is one of those diseases you can easily treat. Signs your cat has fleas include:
Flea dirt on your cat  skin (they look like little black dots)
Constantly scratching
Frequent licking
Red or irritated skin
Hair loss
Skin infections or hot spots
Fleas can live for more than a year and your cat is at risk of anemia if the problem becomes severe, so make sure to deal with a cat flea problem and prevent future infestations.
Talk to your veterinarian about what flea control is best for your cat. Treatment is with oral medications, powders, foams and topicals. Eye problems
Eye problems in cats can be caused by a number of causes, including conjunctivitis, corneal ulcers, cataracts, glaucoma, trauma, viruses, inflammation, and retinopathy.
Some of the symptoms that could mean your cat has an eye problem include watery eyes, tear-stained fur, cloudiness, red or white eyelids, discharge at the corners of the eyes, squinting, bulging of the eye or visible third eyelid.
Unless you know what is causing your cat eye problems, there is nothing you can do but call the vet. Eye problems should be treated as an emergency so make an appointment with a veterinarian immediately.', N'Cat',2,N'Van Son',GETDATE(),N''),
(N'Food for Dogs and Cats – A guide to nutrition facts and labels', N'FoodGuide', N'Babesiosis is caused by protozoa in red blood cells of the genus Babesia. Transmitted by ticks, babesiosis affects a wide variety of wild and domestic animals and sometimes people. Although the main economic impact of babesiosis is on the livestock industry, infections in other domestic animals, including horses, sheep, goats, pigs and dogs, have varying degrees of importance. all over the world.
Two important cattle species – B bigemina and B bovis – are common in tropical and subtropical areas and are the focus of this discussion. However, because there are many common features of the different Babesia diseases, much of this information can be applied to other species. Infectious and epidemiological
The main vectors of B bigemina and B bovis are the 1-host tick Rhipicephalus (Boophilus), in which transmission occurs by transovarial route (the pattern of arthropod virus transmission from parent to progeny) ). Although the parasite can be easily transmitted experimentally by blood transfusion, mechanical transmission by insects or during surgery is of no practical significance. Intrauterine infection has also been reported but is very rare.
In the Rhipicephalus tick, the blood stages of the parasite are consumed during stasis and undergo sexual and asexual reproduction in the female, infecting the eggs and subsequent parasitic stages. according to. Transmission to the host occurs when larvae (in the case of B bovis) or pupae and adults (in the case of B bigemina) eat. The percentage of larvae infected can vary from 0–50% or more, depending mainly on the level of parasitemia in the host blood at the time the female tick is engorged. Under field conditions, tick transmission rates were generally higher for B bigemina than for B bovis.
In endemic areas, three features are important in determining clinical disease risk:
1) Calves with a degree of immunity (involving both colostrum-derived antibodies and age-specific factors) persists for ~6 months.
2) Animals recovering from Babesia infection are generally immune to their commercial life (4 years).
3) The susceptibility of cattle breeds to ticks and Babesia infections varies; for example, Bos indicus cattle tend to be more resistant to ticks and the effects of B bovis and B bigemina infections than are Bos taurus-derived breeds.
At high levels of tick transmission, almost all calves are infected with Babesia by the age of 6 months, show little clinical signs and subsequently become immune. This condition can be irritating because natural (e.g., climate) or man-made (eg, acaricide treatments or changes in flock composition) reduce tick populations to a transmissible level. of Babesia ticks to calves is not enough to ensure all are infected during this critical early stage. Other circumstances that may lead to clinical outbreaks include the introduction of susceptible livestock to endemic areas and the entry of Babesia-infected ticks into previously tick-free areas. Strain variation in immunity has been demonstrated but probably has no practical significance in the field.
Clinical findings and pathogenesis
B bovis is a much more venomous creature than B bigemina. With most strains of B bigemina, the pathogenic effect is more directly related to erythrocyte destruction. With extremely virulent strains of B bovis, a hypotensive shock syndrome, combined with systemic nonspecific inflammation, coagulopathy, and erythrocyte stasis in capillaries, contributes to the pathogenesis.
Acute illness usually lasts ~1 week. The first sign is fever (frequently ≥106°F [41°C]), which persists and is followed by dyspnea, increased respiratory rate, muscle tremors, anemia, jaundice, and weight loss ; hemoglobinemia and hemoglobinuria occur in the late stages. CNS involvement by adhesion of parasitic erythrocytes in cerebral capillaries may occur with B bovis infection. Constipation or diarrhea may occur. Late gestation cows may have miscarriages, and temporary febrile infertility may be observed for a short time in bulls.
Animals recovering from acute illness remain infected with B bovis for a number of years and for several months with B bigemina. There are no obvious clinical signs in this carrier state.
hurt
Lesions (especially with B bovis) include an enlarged and fragile spleen; enlarged liver with an enlarged gallbladder containing thick granular bile; congested, darkened kidneys; and systemic anemia and jaundice. Most clinical cases of B bigemina present with hemoglobinuria, but this is not always the case with B bovis. Other organs, including the brain and heart, may present with obstruction or petechiae.
Diagnose
Clinically, babesiosis can be confused with other conditions that cause fever, anemia, hemolysis, jaundice, or red urine. Therefore, confirmation of the diagnosis by microscopic examination of Giemsa-stained blood or organ specimens is necessary. From live animals, thick and thin smears of blood should be prepared, preferably from the capillaries of the ears or tip of the tail.', N'OtherAnimal',2,N'Anh Khoa',GETDATE(),N'');


INSERT INTO ServiceProvider (provider_id, name, service_type, location, description, price_ServiceProvider, date, status)
VALUES
(1, 'PetCare Center', 'Pet Care', 'Thu Duc', 'We provide complete pet care services, including grooming, training, and veterinary care.', 50.00, '2023-07-21', 1),
(2, 'Paws Paradise', 'Pet Boarding', 'Quan 2', 'Leave your pets in a paradise of their own with our top-notch pet boarding services.', 35.00, '2023-07-21', 1),
(3, 'Healthy Pets Clinic', 'Veterinary Care', 'Quan 1', 'Quality veterinary care for your beloved pets to keep them happy and healthy.', 75.00, '2023-07-21', 1),
(4, 'Furry Friends Grooming', 'Pet Grooming', 'Quan 4', 'Expert grooming services to pamper your furry friends and make them look their best.', 40.00, '2023-07-21', 1),
(5, 'Pet Whisperer Training', 'Pet Training', 'Quan 5', 'Unlock the full potential of your pets with our professional pet training sessions.', 60.00, '2023-07-21', 1),
(6, 'Pawsitive Pet Sitters', 'Pet Sitting', 'Quan 6', 'Reliable and caring pet sitters to ensure your pets are in safe hands while you are away.', 30.00, '2023-07-21', 1),
(7, 'Cat & Dog Spa', 'Pet Spa', 'Quan 7', 'Indulge your pets in a spa-like experience with our soothing pet spa services.', 45.00, '2023-07-21', 1),
(8, 'Pet Photography Studio', 'Pet Photography', 'Quan 9', 'Capture timeless memories with our pet photography services.', 55.00, '2023-07-21', 1),
(9, 'Exotic Pet Haven', 'Exotic Pet Care', 'Quan 8', 'Specialized care for exotic pets to meet their unique needs.', 65.00, '2023-07-21', 1),
(10, 'Pet-Friendly Adventures', 'Pet Adventure', 'Quan 10', 'Embark on exciting adventures with your pets by your side.', 70.00, '2023-07-21', 1),
(11, 'Whiskers & Tails', 'Pet Accessories', 'Quan 1', 'Browse our selection of high-quality pet accessories and products.', 25.00, '2023-07-21', 1),
(12, 'Pet Health First', 'Pet Health', 'Quan 2', 'Promoting pet health through educational resources and preventive care.', 20.00, '2023-07-21', 1),
(13, 'Feathered Friends Aviary', 'Bird Care', 'Quan 3', 'Comprehensive care for pet birds, from diet to habitat setup.', 45.00, '2023-07-21', 1),
(14, 'Rabbit Retreat', 'Rabbit Boarding', 'Quan 4', 'Specially designed boarding services for your adorable rabbits.', 30.00, '2023-07-21', 1),
(15, 'Aquatic Wonders', 'Aquarium Services', 'Quan 5', 'Aquarium setup, maintenance, and fish care services for aquatic enthusiasts.', 50.00, '2023-07-21', 1),
(16, 'Reptile Realm', 'Reptile Care', 'Quan 6', 'Specialized care for reptiles, including terrarium setup and dietary advice.', 55.00, '2023-07-21', 1),
(17, 'Fluffy Paws', 'Pet Grooming', 'Quan 7', 'Expert grooming services for all breeds of dogs and cats.', 40.00, '2023-07-21', 1),
(18, 'Pet Express', 'Pet Transportation', 'Quan 8', 'Safe and comfortable transportation services for your pets.', 35.00, '2023-07-21', 1),
(19, 'Tail Waggers', 'Dog Walking', 'Quan 9', 'Regular and energetic walks to keep your dogs happy and active.', 25.00, '2023-07-21', 1),
(20, 'Feline Friends', 'Cat Sitting', 'Quan 1', 'Caring cat sitters to provide love and attention to your feline companions.', 30.00, '2023-07-21', 1);


INSERT INTO contact (lineadd, cname, email, message) VALUES ('1', 'sass', 'dfdd@cc','ddd' )
SELECT MAX(lineadd) FROM contact
SELECT * FROM contact

	 
<<<<<<< HEAD
>>>>>>> f0975a78e7a632976a7a2d36192f361e7fc7f668
INSERT INTO ServiceProvider (provider_id, name, service_type, location, description, price_ServiceProvider, status, date)
VALUES
  (1, 'ABC Services', 'Plumbing', 'New York', 'We provide plumbing services.', 50.99, 1, '2023-07-20'),
  (2, 'XYZ Repairs', 'Electrical', 'Los Angeles', 'We offer electrical repair services.', 65.50, 1, '2023-07-21'),
  (3, 'Best Cleaners', 'Cleaning', 'Chicago', 'We specialize in residential and commercial cleaning.', 35.00, 1, '2023-07-22'),
  (4, 'Quick Fix IT', 'IT Services', 'San Francisco', 'We provide IT solutions for businesses.', 80.00, 1, '2023-07-23'),
  (5, 'Garden Gurus', 'Landscaping', 'Miami', 'We create beautiful landscapes for homes and businesses.', 75.99, 1, '2023-07-24'),
  (6, 'Fresh Paint', 'Painting', 'Seattle', 'We offer professional painting services.', 55.00, 1, '2023-07-25'),
  (7, 'Chef s Delight', 'Catering', 'Houston', 'We provide catering services for all occasions.', 100.00, 1, '2023-07-26'),
  (8, 'Tech Solutions', 'IT Consulting', 'Dallas', 'We offer IT consulting services for businesses.', 95.00, 1, '2023-07-27'),
  (9, 'Secure Locks', 'Locksmith', 'Atlanta', 'We provide locksmith services for residential and commercial properties.', 45.50, 1, '2023-07-28'),
  (10, 'Express Courier', 'Courier Services', 'New York', 'We offer reliable and speedy courier services.', 30.00, 1, '2023-07-29');
  

  SELECT * FROM Pets WHere user_id = 1
  SELECT * FROM Users
  SELECT * FROM ServiceProvider
=======
	  SELECT * FROM Resources where category = N'Dog' and description = N'Rickettsia'
	  SELECT * FROM Author
	
	   SELECT * FROM Resources;

	   SELECT * FROM Pets
	   SELECT * FROM Resources WHERE created_date > '2023-07-18 20:19:15.000' ORDER BY created_date DESC
	  --(5, N'Vi khuẩn Rickettsia là gì?', N'', N'', N'Rickettsia'),
<<<<<<< HEAD
=======

>>>>>>> 14b77cf494ed3b1139f3677fc546eac1467d9632
>>>>>>> aef8e0caf1da47b1e8dac49d390718c6babdf917
