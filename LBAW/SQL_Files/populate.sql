DELETE FROM auctions;
DELETE FROM bans;
DELETE FROM bids;
DELETE FROM categories;
DELETE FROM emails;
DELETE FROM users;
DELETE FROM cities;
DELETE FROM countries;
DELETE FROM closed_auctions;
DELETE FROM reports;
DELETE FROM messages;
DELETE FROM qas;
DELETE FROM reviews;
DELETE FROM wishlists;
DELETE FROM won_auctions;

-- reset serial
ALTER SEQUENCE countries_id_seq RESTART WITH 1;
ALTER SEQUENCE cities_id_seq RESTART WITH 1;
ALTER SEQUENCE auctions_id_seq RESTART WITH 1;
ALTER SEQUENCE categories_id_seq RESTART WITH 1;
ALTER SEQUENCE users_id_seq RESTART WITH 1;


INSERT INTO "public"."categories" ("id","name") VALUES (1,'car');
INSERT INTO "public"."categories" ("id","name") VALUES (2,'laptop');
INSERT INTO "public"."categories" ("id","name") VALUES (3,'smartphone');
INSERT INTO "public"."categories" ("id","name") VALUES (4,'headphones');
INSERT INTO "public"."categories" ("id","name") VALUES (5,'motorcycle');
INSERT INTO "public"."categories" ("id","name") VALUES (6,'computer');
INSERT INTO "public"."categories" ("id","name") VALUES (7,'monitor');
INSERT INTO "public"."categories" ("id","name") VALUES (8,'television');


INSERT INTO "public"."countries" ("country") VALUES ('Portugal');
INSERT INTO "public"."countries" ("country") VALUES ('United States');
INSERT INTO "public"."countries" ("country") VALUES ('Brazil');
INSERT INTO "public"."countries" ("country") VALUES ('United Arab Emirates');
INSERT INTO "public"."countries" ("country") VALUES ('Syria');
INSERT INTO "public"."countries" ("country") VALUES ('Germany');
INSERT INTO "public"."countries" ("country") VALUES ('France');
INSERT INTO "public"."countries" ("country") VALUES ('Russia');
INSERT INTO "public"."countries" ("country") VALUES ('Mali');
INSERT INTO "public"."countries" ("country") VALUES ('China');
INSERT INTO "public"."countries" ("country") VALUES ('Finland');
INSERT INTO "public"."countries" ("country") VALUES ('Japan');
INSERT INTO "public"."countries" ("country") VALUES ('Russian Federation');
INSERT INTO "public"."countries" ("country") VALUES ('Canada');

INSERT INTO "public"."cities" ("city","country_id") VALUES ('Lisbon',1);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Faro',1);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Porto',1);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Braga',1);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Nizhny Novgorod', 2);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Weifang', 2);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Taiyuan',2);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Dallas (TX)',3);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('TEHRAN',4);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Pueblade Zaragoza',4);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Quezon City',5);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Fulin',5);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('Kunming',5);
INSERT INTO "public"."cities" ("city","country_id") VALUES ('BUDAPEST',6);


INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (1,'Qj8aixfPmTeMcNnAN1' ,'Another messahgedwa wdwa ','11/26/2000 10:21:00');
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (2,'U0ncfZbDVOHZThv2dGnDfmmZKeerlzQU6XcaMLlebWbtDw3UVuwUZpJSI8rAlfCqsr43puJ61U1NKUHAq5CENUby3zUmK7nORM3Q6Hi0eJuLOGktujJloZyqvLb55ILlAVqrkSJWK5mvXrYFMBFcSmenT81UsVc6BoVSRbjAZcOvAghHTNmvWmuY48ZRQn8r2','ZziNgQ7tHjsIIj1dGPo8VVfFwyv0YZa2f0ttLgkzkIvoOdkc6FnJk2e8fORR35WHEnQAQTIQlGC8F7OlZLgbcGwiaytQzgtAFIAsZ6JCweB5hXwFvv4lQaNdiViHe32BVcf7GRSNp8SS8ROIrA88SGoTZZmrT6jqMlfmNfhuV0yTPKUX44gkS','10/26/2009 06:19:00');
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (3,'huyRPnXkUEOhn3625CNS8kLmCHqiWUCUqZZyZwlKJLT7MzD4','G0qarV2iZwcXlgnS7al3eOu','07/03/2005 08:02:00');
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (4,'OsuIQhtwOk0bPfaX3rDXiPVYjcWshH5uPURx63GkDYz0Enw6qWsTpprnj267SXcDAA5pdKIJPCAfLjDdEy2BP0eLUeP','irYQr5kTno5GjAbgpgCG2vGJp1mjN21TMnWVgzexxOYMMdILDeogZMiFdjcyfgPc78tCfPQanscoBmsTuMnAhsPGG7nEiRDwLQ','07/04/2000 01:55:00');
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (5,'deX8ZPbDdpdUhyjqBD7jHaSWL2Op8UmjPPpUkgglr8hTqvTzYTELIUdUhLlWOdmKkQr3NM2xLmL2IM4fJ8e1bj6ECYRg4WOIuIQ4Xzj652ckpHA70RrWdp6VR67XD85rZkUKiZ','IB1FysKucmBpRPinp3LmtmkotBE2ZDWLUNL2IdEIXSzhvBxQkqnftuRjqZbkBP4','08/19/2012 04:51:00');
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (6,'fOoHZTVXph5iIOTLm716XXw624ZhltQ82jeDkzB8pew6Hv2nGvgHVDNcjIdDOnEIalOWDmCGywRGjxDbWijyoRqeaRIrZmvSbMQ82XcA5mlLL54oCnJg0pG24JOq8dRWSP38SOAj2RFrQmNah3NwYXfQrfplbDwmSHNt0xBCkRF4KZaflNIliHWMkeldqxqw01DZyMKMZJAeNKGu51xCuIm5Ofe','NKz6TbzWfyj0wnNWqNMB7lgrnjIa8BYHM4A8Q5REGvN0i3ZDEbeW000DxeAD503H42nygNk8fheRfI0QlEQ','10/29/2013 08:47:00');
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (7,'De5EUi6zelaVEufO2rKGZyF1wLD3Lo3JeVZKZsXGK2gocCvvJYdSegTfGz8EyTYjO2kL7Ey','bauHM21euQRZR3208LizEtZfh7LSL4HL2J',NULL);
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (8,'nsnstrOE1YX2','Zlqo0A2d4dgyzXzohQKEKb','10/18/2000 02:05:00');
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (9,'OIAxjji3gO3WjaToLM5nyzhGFBtZWqgLpJQXGMTQbf6PAmUAbGjU2Tp0pJzvEXQKdGMFTokJjcGdEL2DnUNHZfqBbME5c27WmnY1ufFqa0k77wwLriBy4i0t6Iqj1D1QiXSFoV6GR','wkrce1a7Mx8R5fUUb2Sv0GaTXxSdB6FbwxR2XAaIwsMfJVM26iwAvFwh8GMQqhfiQeNqL2ep1ZX1ZmKouex7TQKI0PEuI1VSkoIipzcwbchF6GroyEGkiINBlkREAsrKDyM2q5hkwPhvva0aaw1EXtPcXkaWAPBDmiNe2kW4Hz6YhOa3OtZPFOLcyxsPiQ07PjbEaRkMJK4feYinbXN0LoS4FQRr8aaZqjgf2iSM1oednH4tXqYFHnpe',NULL);
INSERT INTO "public"."messages" ("id","subject","message","send_date") VALUES (10,'ywlD5byLg0nJVjs3eZs5GNzjdTsGQuP3Cw','Some message , ttuut', '08/24/2007 02:48:00');





-- ALL passwords are '123456'

INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (1,'a','Ross',NULL,'$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','a@a.a','94167','31 Stewart Ave','04/04/2011 06:48:00',1,1.58,True, False); -- admin
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (2,'Mads9','Marie','Katsekes','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','Mick.Byrnes5@telfort.cc','42767','8 Brooke Valley Drive','06/25/2013 03:26:00', 1,1.1,FALSE, False); -- well tested
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (3,'Richard889',NULL,'Morton','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','Dave.Petterson@dolfijn.dk','84063',NULL,NULL, 1,4.01,False, False); -- banned
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (4,'Dave3','Isabel','Bloom','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','JohanDepew@libero.be','39927','4235 Serang Place','12/04/2006 00:22:00', 2,3.73,True, False);
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (5,'Magnus420','Olivia','Stewart','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','E.King3@dolfijn.fr','73108','20 Devonshire Rd','12/06/2016 06:23:00', 2,3.21,True, False);
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (6,'Sophia812','Olivia','Swaine','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','YLamere@excite.us',NULL,'0 Melrose Ave',NULL, 3,1.22,FALSE, False);
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (7,'Tim16',NULL,'Bernstein','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','Trees.King@hotmail.gov','94588','991 East MacArthur','11/29/2006 04:42:00', 3,4.91,FALSE, False);
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (8,'Louise00','Nahay', 'Pelosi','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','LindsyBrown@weboffice.no','71654','2024 Melrose Ave','11/30/2011 01:07:00', 3,3.48,False, False);
INSERT INTO "public"."users" ("id","username","first_name","last_name","password","email","zip_code","address","registration_date","location","rating","is_administrator", verified) VALUES (9,'Guestlbaw','Guest', 'Lbaw','$2y$10$iZp1uAimUgGSJ/mqLbqoouPk5lhQQfhJWw1xzTF7/kppazpSXBogy','guest123@gmail.com','21934','Adress','11/30/2011 01:07:00', 3,2,False, False);

ALTER SEQUENCE users_id_seq RESTART WITH 10;

INSERT INTO "public"."bans" ("id","banned_id","admin","ban_start_date","ban_expiration_date","ban_reason") VALUES (1, 3, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + '1 month','6LgRbEbX3RBWeGZsNIhVgaA1bXEdcfTVaNrgkjzYo3wnu8DhLgWSy4faOWd1Y8IuGLCQ2BmbfNdqZNIjwV3DyhvnkPZRlMZXfUykHWN1wY33Eb7zE86hASKPo2tIX0Cpugm1kgarlD3wvr');
INSERT INTO "public"."bans" ("id","banned_id","admin","ban_start_date","ban_expiration_date","ban_reason") VALUES (2, 3, 5, '05/07/2015 08:47:00', '05/07/2016 08:47:00', 'bxIYx5OjvL5V6rR4AAKxxDsRuj2hB6wCe11uwNwPgwKo');


INSERT INTO "public"."emails" ("id","has_been_opened","receiver_id","sender_id") VALUES (6,False, 1, 2);
INSERT INTO "public"."emails" ("id","has_been_opened","receiver_id","sender_id") VALUES (7,False, 1, 5);
INSERT INTO "public"."emails" ("id","has_been_opened","receiver_id","sender_id") VALUES (8,False, 2, 3);
INSERT INTO "public"."emails" ("id","has_been_opened","receiver_id","sender_id") VALUES (9,True, 3, 4);
INSERT INTO "public"."emails" ("id","has_been_opened","receiver_id","sender_id") VALUES (10,True, 5, 1);


INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('Orange Volkswagen Polo','The Volkswagen Polo is a car produced by the German manufacturer Volkswagen since 1975. It is sold in Europe and other markets worldwide in hatchback, sedan and estate variants. The Polo has been produced in six generations. Related Volkswagen Group models include the Škoda Fabia, SEAT Ibiza and Audi A1.',0,'Used',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + '2 days','PayPal','No shipping',494.59,1, 1,1);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('HP Spectre x360 - 15t Touch Laptop','
Imagination meets the height of performance. This sleek laptop was engineered to deliver incredible graphics and speed to empower you when inspiration strikes. Reinvent your creative process with four unique modes and bring your vision to life with a laptop designed around you.
The pinnacle of performance
Whether it''s photo or video editing, rewrite the meaning of speed with unquestionable performance. With a quad-core processor[3] and dedicated graphics. Power through your most demanding days with long-lasting battery life[4] and HP Fast Charge.[5]
A creative revolution
Stretch creativity to its limits with our 15.6” diagonal 4K micro-edge touch display. Compatible with a digital pen[2] to evolve your vision and with a scratch-resistant Corning® Gorilla® Glass 4 – your talent has met its perfect canvas.
Smart technology. Designed around you.
We’ve designed this PC around you, with four unique modes that convert from a powerful laptop to get things done to a beautiful canvas in tablet mode. We then added an IR camera and fingerprint reader for easy and secure login.
',0,'Used',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + '10 hours','PayPal','No shipping',4.63, 1, 2,2);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('Samsung S8',NULL,0,'Used','02/19/2018 10:06:00',CURRENT_TIMESTAMP + '2 months','PayPal','No shipping',269.93, 2, 3,3);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ( 'Blue Senheiser heaphones', 'Description number 7219436',0,'Used','05/07/2015 08:47:00','08/20/2016 10:51:00','PayPal','No shipping',95704.75, 3, 1,1);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('HP 24 inch monitor','FullHD monitor, 24 inches. LCD display',6.37,'Used','1/20/2018 01:06:00',CURRENT_TIMESTAMP + '1 minute','PayPal','No shipping',0.2, 2, 7,2);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('Zo2lhsYyEMylLoYwhrtspCAkN5GSDNbAFZW5yylNX1FUnAJ54LVq8mIii5aKJqa6hfpt68FDkBfygZeaAE666lIMZ7XGQwjOQjzFTD8j1oeOywGOQbiibWJjOJF3ybiwo7hbh1It5dVByUMwFqXcQrCHqJRdfhn6cViVYKsMQjF5K8tnOjxjyQk4ynnOHm5edPpuWkY43RscZCySIWhksrmcmp7fKxB3MSW','This is a description 8815846',0, 'Used', '1/16/2018 10:07:00','3/16/2018 10:07:00','PayPal','No shipping',0.15, 4, 3,3);
INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ( 'Toyota', 'Nice car',5230,'New','05/07/2015 08:47:00','08/20/2016 10:51:00','PayPal','No shipping',95, 9, 1,1);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('iPhone 7','TOP from apple',314,'Used','1/20/2018 01:06:00',CURRENT_TIMESTAMP + '1 minute','PayPal','No shipping',4, 9, 7,2);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('Mouse and Keyboard','For gamers',0, 'New', '1/16/2018 10:07:00','3/16/2018 10:07:00','PayPal','No shipping',0.15, 9, 3,3);


INSERT INTO "public"."bids" ("id","bidder_id","bid_amount") VALUES (1 ,6,123);
INSERT INTO "public"."bids" ("id","bidder_id","bid_amount") VALUES (2,7,3.2);
INSERT INTO "public"."bids" ("id","bidder_id","bid_amount") VALUES (3,8,0.2);
INSERT INTO "public"."bids" ("id","bidder_id","bid_amount") VALUES (5,6,1.2);
INSERT INTO "public"."bids" ("id","bidder_id","bid_amount") VALUES (7,7,900);


INSERT INTO "public"."reviews" ("id","rating","review_text") VALUES (5,2,'Description number 3028653');
INSERT INTO "public"."reviews" ("id","rating","review_text") VALUES (6,3,'Description number 3261390');
INSERT INTO "public"."reviews" ("id","rating","review_text") VALUES (1,4,'This is a description 7010386');


INSERT INTO "public"."closed_auctions" ("id") VALUES (4);
INSERT INTO "public"."closed_auctions" ("id") VALUES (6);

INSERT INTO "public"."won_auctions" ("id","winner_id") VALUES (4,9);
INSERT INTO "public"."won_auctions" ("id","winner_id") VALUES (6,9);

INSERT INTO "public"."qas" ("id","question","answer","auction_id","questioner_id") VALUES (9632424,'Ent06pXYTtewJ0vZTvvqjZQIZ2ikuNCRB6wv42jKMex6','ojBOa',1,3);
INSERT INTO "public"."qas" ("id","question","answer","auction_id","questioner_id") VALUES (9624332,'bEfgYqkriLX0aypAYrkaWAPxgAaEcWM0Nfga5u5jPWj','J23duGx40axM7tpzQyDVwdgfwRpKHSqafibQKITo0Tjkr5yyNRCrWxRB2oCWVw7Wz',3,2);
INSERT INTO "public"."qas" ("id","question","answer","auction_id","questioner_id") VALUES (9843233,'OfHrDhswL0GR3NVQC51VFRgUjZFiGQEqfcBizHyxeCSfKjl4YVxNs6KiEyCVkJrQvhU01xUHRoorGftx2ykDaJ1lZSyybDb','lCtzqQXqOAQXMxUz',2,7);
INSERT INTO "public"."qas" ("id","question","answer","auction_id","questioner_id") VALUES (9732424,'What is the colour',NULL,7,3);
INSERT INTO "public"."qas" ("id","question","answer","auction_id","questioner_id") VALUES (9634424,'What is the colour','red',6,1);


INSERT INTO "public"."wishlists" ("auction_id","id") VALUES (1,2);
INSERT INTO "public"."wishlists" ("auction_id","id") VALUES (2,3);
INSERT INTO "public"."wishlists" ("auction_id","id") VALUES (3,1);
INSERT INTO "public"."wishlists" ("auction_id","id") VALUES (5,1);




-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------
-- EXTRAS
-- --------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------



INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('HP zen - 17t Touch Laptop','
Imagination meets the height of performance. This sleek laptop was engineered to deliver incredible graphics and speed to empower you when inspiration strikes. Reinvent your creative process with four unique modes and bring your vision to life with a laptop designed around you.
The pinnacle of performance
Whether it''s photo or video editing, rewrite the meaning of speed with unquestionable performance. With a quad-core processor[3] and dedicated graphics. Power through your most demanding days with long-lasting battery life[4] and HP Fast Charge.[5]
A creative revolution
Stretch creativity to its limits with our 15.6” diagonal 4K micro-edge touch display. Compatible with a digital pen[2] to evolve your vision and with a scratch-resistant Corning® Gorilla® Glass 4 – your talent has met its perfect canvas.
Smart technology. Designed around you.
We’ve designed this PC around you, with four unique modes that convert from a powerful laptop to get things done to a beautiful canvas in tablet mode. We then added an IR camera and fingerprint reader for easy and secure login.
',0,'Used',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + '10 days','PayPal','No shipping',4.63, 1, 2,2);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('Asus zen - 15t Touch Laptop','A+ laptop',0,'Used',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + '10 days','PayPal','No shipping',4.63, 1, 2,2);

INSERT INTO "public"."auctions" ("item_name","description","starting_price","condition","publication_date","end_date","payment_type","shipping_options","shipping_cost","owner_id","category_id","city_id") VALUES ('Asus zen - 17t Touch Laptop','A+ laptop',0,'Used',CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + '10 days','PayPal','No shipping',4.63, 1, 3,3);
