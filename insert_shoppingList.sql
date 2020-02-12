


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";






INSERT INTO users (first_name, lastName, city, street, house_number, phone_number, login, password) VALUES ('Lamorski', 'philippe', 'Lapugnoy', 'residence la roseraie', 29, '06.59.61.37.85', 'parshimipopeli', 'lam62122phil'),('Sagan', 'Peter', 'Monaco', 'Rue du maillot vert', 657, '06.22.64.77.85', 'psagan', '1234'),('Alaphilippe', 'Julian', 'marseille', 'residence la roseraie', 5, '06.13.22.55.84', 'jallaphil', '1234'),('Pinot', 'Thibault', 'Grenoble', 'due du tour de france', 29, '06.13.22.44.66', 'Tpinot', '4321');
                                                                                                            
SELECT @users := last_insert_id();


INSERT INTO category (category_name) VALUES ('Vélos'), ('Roues'), ('Transmission'),('Pneus'), ('FReinage'), ('Composant périphérique') ;
                                                                                                            
SELECT @category := last_insert_id();

INSERT INTO articles (id_category, nom, prix_article) VALUES (@category, 'Cube Agree c:62 sl', 2229 ), (@category+1, 'Mavic Aksium', 169 ), (@category+1, 'Campagnolo Zonda c17', 389 ), (@category+2, 'pédalier shimano 105 r7000', 109.99 ), (@category+2, 'dérailleur arriére Shimano 105 5700', 39.99 ), (@category+3, 'michelin pro race 4', 42 ), (@category+3, 'Continental pro', 47 ), (@category+4, 'Etrier frein shimano 105', 65 ), (@category+5, 'Cintre ZIPP sl-70 carbone', 229.99 ), (@category+5, 'Cintre FSA k-force carbone', 239.99 );
                                                                                                            
SELECT @article := last_insert_id();
                                                                                                            
                                                                                                            


INSERT INTO liste(`name`,`id_user`)VALUES('liste 1 philippe',@users),('liste 1 peter',@users+1),('liste 1 julian',@users+2),('liste 1 thibault',@users+3),('liste 2 philippe',@users),('liste 2 peter',@users+1),('liste 2 julian',@users+2),('liste 2 thibault',@users+3);
                                                                                                            
     SELECT @liste := last_insert_id();
                                                                                                       
                                                                                                            
                                                                                                            
                                                                                                            

INSERT INTO listes_articles (`id_article`,`id_liste`,`quantites`) VALUES(@article+3,@liste,5),(@article+4,@liste+2,6),(@article+2,@liste+1,8),(@article+2,@liste+5,9),(@article+5,@liste,4),(@article,@liste+3,10);

COMMIT;
