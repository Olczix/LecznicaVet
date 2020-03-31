
/*DELETE FROM WIZYTY;
DELETE FROM ZWIERZE;
DELETE FROM WLASCICIEL;
DELETE FROM ADRES;
DELETE FROM DIAGNOZA;
DELETE FROM ZABIEGI;
DELETE FROM LEKARZ;
DELETE FROM LEK;
DELETE FROM GATUNEK;
DELETE FROM BADANIA;
DELETE FROM MATERIALY;*/



INSERT INTO ADRES VALUES ('A_1', 'Kopernika Mikołaja', 19, NULL, '10-512', 'Olsztyn');
INSERT INTO ADRES VALUES ('A_2', 'Bosmańska',21, 3, '76-271', 'Ustka');
INSERT INTO ADRES VALUES ('A_3', 'Przy Wodzie', 11, 4, '03-284', 'Warszawa');
INSERT INTO ADRES VALUES ('A_4', 'Warszawska', 13, NULL, '09-540', 'Sanniki');
INSERT INTO ADRES VALUES ('A_5', 'Wolności',49, 13, '23-200', 'Kraśnik');
INSERT INTO ADRES VALUES ('A_6', 'Norweska', 132,3, '85-158', 'Bydgoszcz');
INSERT INTO ADRES VALUES ('A_7', 'Zwycięstwa', 54, 11, '75-614', 'Koszalin');
/*INSERT INTO ADRES VALUES ('A_8', 'Młynarskiego Emila', 77, NULL, '00-009', 'Warszawa');
INSERT INTO ADRES VALUES ('A_9', 'Kociuszki Tadeusza', '119', '23', '10-504', 'Olsztyn');
INSERT INTO ADRES VALUES ('A_10', 'Wileñska', '77', '12', '45-316', 'Opole');
INSERT INTO ADRES VALUES ('A_11', 'Modrzejewskiej Heleny', '4', '3', '75-736', 'Koszalin');
INSERT INTO ADRES VALUES ('A_12', 'Górska', '12', NULL, '00-740', 'Waraszawa');
INSERT INTO ADRES VALUES ('A_13', 'Bonifacego', '36', '16', '02-940', 'Warszawa');
INSERT INTO ADRES VALUES ('A_14', 'Jagodowa', '71', '56', '41-404', 'Mys³owice');*/


INSERT INTO WLASCICIEL VALUES ('O_1', 'Piotrowska', 'Małgorzata', '799-779-397', 'A_1');
INSERT INTO WLASCICIEL VALUES ('O_2', 'Pawłowski', 'Aleksander', '883-529-341', 'A_4');
INSERT INTO WLASCICIEL VALUES ('O_3', 'Grabowska', 'Maryla', '786-596-978', 'A_6');
INSERT INTO WLASCICIEL VALUES ('O_4', 'Kowalczyk', 'Grażyna', '673-200-028', 'A_5');
INSERT INTO WLASCICIEL VALUES ('O_5', 'Wysocki', 'Bolesław', '607-822-262', 'A_7');
INSERT INTO WLASCICIEL VALUES ('O_6', 'Kowalczyk', 'Asia', '601-977-236', 'A_5');
INSERT INTO WLASCICIEL VALUES ('O_7', 'Kamiński', 'Dominik', '672-588-310', 'A_3');
INSERT INTO WLASCICIEL VALUES ('O_8', 'Zając', 'Bogumiła', '793-681-086', 'A_2');


INSERT INTO LEKARZ VALUES ('L_1', 'Szczepański', 'Bazyli', 'Chirurgia weterynaryjna', '2017-01-04',NULL);
INSERT INTO LEKARZ VALUES ('L_2', 'Sobczak', 'Maciej', 'Radiologia weterynaryjna', '2017-03-03', NULL);
INSERT INTO LEKARZ VALUES ('L_3', 'Sobczak', 'Michalina', 'Prewencja weterynaryjna', '2017-10-30', '2019-12-20');
INSERT INTO LEKARZ VALUES ('L_4', 'Wieczorek', 'Justyna', 'Rozród zwierząt', '2018-08-21', NULL);
INSERT INTO LEKARZ VALUES ('L_5', 'Kalinowska', 'Jadwiga', 'Chirurgia weterynaryjna', '2019-06-21', NULL);
INSERT INTO LEKARZ VALUES ('L_6', 'Sadowska', 'Milena', 'Prewencja weterynaryjna', '2016-12-13', NULL);


INSERT INTO GATUNEK VALUES ('Owczarek Niemiecki', 'Pies');
INSERT INTO GATUNEK VALUES ('Bulldog', 'Pies');
INSERT INTO GATUNEK VALUES ('Pug', 'Pies');
INSERT INTO GATUNEK VALUES ('Labrador Retriever', 'Pies');
INSERT INTO GATUNEK VALUES ('Shiba Inu', 'Pies');
INSERT INTO GATUNEK VALUES ('Brytyjczyk', 'Kot');
INSERT INTO GATUNEK VALUES ('Rosyjski', 'Kot');
INSERT INTO GATUNEK VALUES ('Ragdoll', 'Kot');
INSERT INTO GATUNEK VALUES ('Angielski Baran', 'Królik');
INSERT INTO GATUNEK VALUES ('Szynszyl Wielki', 'Królik');
INSERT INTO GATUNEK VALUES ('Francuski', 'Królik');


INSERT INTO ZWIERZE VALUES ('Z_1', 'Bora', 'O_2', 'Shiba Inu', '2015-12-16', '2018-09-10', 'F', 'Dysplazja', 'N', NULL);
INSERT INTO ZWIERZE VALUES ('Z_2', 'Fado', 'O_5', 'Pug', '2016-12-13', '2019-09-18', 'M', NULL, 'N', NULL);
INSERT INTO ZWIERZE VALUES ('Z_3', 'Impuls', 'O_4', 'Owczarek Niemiecki', '2016-10-06', NULL, 'M', 'Nadpobudliwość', 'T', NULL);
INSERT INTO ZWIERZE VALUES ('Z_4', 'Piksel', 'O_1', 'Bulldog', '2017-01-26', NULL, 'M', 'Przewlekłe Zapalenie Uszu', 'T', NULL);
INSERT INTO ZWIERZE VALUES ('Z_5', 'Jack', 'O_3', 'Angielski baran', '2017-05-31', NULL, 'M', NULL, 'N', NULL);
INSERT INTO ZWIERZE VALUES ('Z_6', 'Rex', 'O_6', 'Owczarek Niemiecki', '2016-12-28', NULL, 'M', 'Nadpobudliwość', 'N', 'Niebieskie oczy');
INSERT INTO ZWIERZE VALUES ('Z_7', 'Milo', 'O_7', 'Ragdoll', '2018-04-20', NULL, 'M', NULL, 'N', NULL);
INSERT INTO ZWIERZE VALUES ('Z_8', 'Blusia', 'O_5', 'Brytyjczyk', '2018-05-07' , NULL, 'F', 'Choroba Krwii', 'T', 'Biała plamka na prawej, tylnej łapie');
INSERT INTO ZWIERZE VALUES ('Z_9', 'Urban', 'O_8', 'Labrador Retriever', '2018-06-05', NULL, 'M', 'Nadpobudliwość', 'T', NULL);
INSERT INTO ZWIERZE VALUES ('Z_10', 'Zeus', 'O_6', 'Owczarek Niemiecki', '2018-08-23', NULL, 'M', 'Bolerioza', 'T', 'Zakręcony ogon');
INSERT INTO ZWIERZE VALUES ('Z_11', 'Wenus', 'O_3', 'Szynszyl Wielki', '2018-12-03', NULL, 'F', 'Nadpobudliwość', 'N', NULL);
INSERT INTO ZWIERZE VALUES ('Z_12', 'Sonia', 'O_1', 'Rosyjski', '2018-08-30', NULL, 'F', 'Koci katar', 'T', NULL);


INSERT INTO ZABIEGI VALUES ('Komputerowa tomografia jamy brzusznej', 'Radiologia weterynaryjna', 'L_2', '75', 'N');
INSERT INTO ZABIEGI VALUES ('Rekonstrukcja ogona', 'Chirurgia weterynaryjna', 'L_5', '300', 'T');
INSERT INTO ZABIEGI VALUES ('Operacja jamy brzusznej', 'Chirurgia weterynaryjna', 'L_1', '500', 'T');
INSERT INTO ZABIEGI VALUES ('Operacja łapy', 'Chirurgia weterynaryjna', 'L_1', '250', 'T');
INSERT INTO ZABIEGI VALUES ('Chirurgiczne usuwanie kamieni nerkowych', 'Chirurgia weterynaryjna', 'L_5', '300', 'N');
INSERT INTO ZABIEGI VALUES ('Usuwanie kamienia nazębnego', 'Prewencja weterynaryjna', 'L_3', '100', 'N');
INSERT INTO ZABIEGI VALUES ('Obcinanie pazurów', 'Prewencja weterynaryjna', 'L_6', '70', 'N');
INSERT INTO ZABIEGI VALUES ('Czyszczenie uszu', 'Prewencja weterynaryjna', 'L_6', '40', 'N');
INSERT INTO ZABIEGI VALUES ('Odrobaczanie', 'Prewencja weterynaryjna', 'L_3', '150', 'N');
INSERT INTO ZABIEGI VALUES ('Kastracja', 'Rozród zwierząt', 'L_4', '500', 'T');


INSERT INTO LEK VALUES ('Luminalum Unia', 'Przeciwpadaczkowy', '1-dzień', 'Tabletki', '30');
INSERT INTO LEK VALUES ('Encorton', 'Steryd', '1-dzień', 'Krople', '28');
INSERT INTO LEK VALUES ('Auriceum', 'Pielęgnacyjny', '2-dzień', 'Płyn',  '35');
INSERT INTO LEK VALUES ('Relaxer VET PLUS', 'Uspokajający', '2-dzień', 'Tabletki',  '64');
INSERT INTO LEK VALUES ('ArthroScan', 'Poprawiający kondycję', '1-dzień', 'Maść',  '43');
INSERT INTO LEK VALUES ('Revertor', 'Uspokajający', '3-dzień', 'Krople',  '15');
INSERT INTO LEK VALUES ('Loxicom', 'Przeciwbólowy', '3-dzień', 'Tabletki',  '120');
INSERT INTO LEK VALUES ('Penillin', 'Pourazowe dolegliwości', '4-dzień', 'Płyn', '79');
INSERT INTO LEK VALUES ('CleanTabs', 'Odrobaczający', '2-dzień', 'Tabletki',  '50');


INSERT INTO DIAGNOZA VALUES ('Złamany ogon', 'Ogon w złym stanie, wiotki, bez reakcji na bodźce.', 'Rekonstrukcja ogona', 'Penillin');
INSERT INTO DIAGNOZA VALUES ('Złamana łapa', 'Łapa złamana, wyczuwalne odłamki kości.', 'Operacja łapy', 'ArthroScan');
INSERT INTO DIAGNOZA VALUES ('Nadmierny kamień nazębny', 'Na kłach widnieje ciemnoszary osad.', 'Usuwanie kamienia nazębnego', 'Auriceum');
INSERT INTO DIAGNOZA VALUES ('Wrastające pazury', 'Pazury znacznie za długie, postrzępione końce. ', 'Obcinanie pazurów', 'Loxicom');
INSERT INTO DIAGNOZA VALUES ('Zanieczyszczone uszy', 'Dużo wosku w kanalikach usznych', 'Czyszczenie uszu', 'Auriceum');
INSERT INTO DIAGNOZA VALUES ('Zanieczyszczony przewód pokarmowy', 'W odchodach widoczne białe larwy.', 'Odrobaczanie', 'CleanTabs');
INSERT INTO DIAGNOZA VALUES ('Guz w narządach rozrodczych', 'Wyczuwalne zgrubienie w okolicy narządów rozrodczych.', 'Kastracja', 'Loxicom');
INSERT INTO DIAGNOZA VALUES ('Przedmiot w jamie brzusznej', 'Wyczuwalne zgrubienie w okolicy jamy brzusznej, znaczny dyskomfort u pacjenta.', 'Komputerowa tomografia jamy brzusznej', 'Loxicom');
INSERT INTO DIAGNOZA VALUES ('Kamienie nerkowe', 'Wyczuwalne zgrubienie w okolicy nerek, krwiomocz.', 'Chirurgiczne usuwanie kamieni nerkowych', 'Revertor');


INSERT INTO MATERIALY VALUES ('Igła', '1-g');
INSERT INTO MATERIALY VALUES ('Woda Utleniona', '1-g');
INSERT INTO MATERIALY VALUES ('Żel do badania RTG', '2-g');
INSERT INTO MATERIALY VALUES ('Lupa', '0-0');
INSERT INTO MATERIALY VALUES ('Latarka', '0-0');


INSERT INTO BADANIA VALUES ('Badanie RTG jamy brzusznej', '00:30', 'Żel do badania RTG');
INSERT INTO BADANIA VALUES ('Badanie RTG ogona', '00:20', 'Żel do badania RTG');
INSERT INTO BADANIA VALUES ('Badanie RTG kończyny', '00:30', 'Żel do badania RTG');
INSERT INTO BADANIA VALUES ('Obdukcja kanałów usznych', '00:15', 'Latarka');
INSERT INTO BADANIA VALUES ('Badanie stanu kamienia nazębnego', '00:45', 'Lupa');
INSERT INTO BADANIA VALUES ('Obdukcja pazurów', '00:10', 'Lupa');



INSERT INTO WIZYTY VALUES('W_1', '2018-05-21', '2018-05-25', '14:30', 'T', 'Z_1', 'L_3', 'Obdukcja kanałów usznych', 'Zanieczyszczone uszy', 'Czyszczenie uszu');
INSERT INTO WIZYTY VALUES('W_2', '2018-12-02', '2018-12-05', '14:00', 'T', 'Z_12', 'L_3','Obdukcja kanałów usznych', 'Zanieczyszczone uszy', 'Czyszczenie uszu');
INSERT INTO WIZYTY VALUES('W_3', '2018-11-03', '2018-11-12', '16:15', 'N', 'Z_6' , 'L_1',NULL,NULL,NULL);
INSERT INTO WIZYTY VALUES('W_4', '2018-04-07', '2018-04-12', '10:15', 'T', 'Z_2', 'L_2','Badanie stanu kamienia nazębnego', 'Nadmierny kamień nazębny', 'Usuwanie kamienia nazębnego');
INSERT INTO WIZYTY VALUES('W_5', '2017-09-23', '2017-09-25', '17:45', 'T', 'Z_3', 'L_6','Badanie stanu kamienia nazębnego', 'Nadmierny kamień nazębny', 'Usuwanie kamienia nazębnego');
INSERT INTO WIZYTY VALUES('W_6', '2018-10-13', '2018-10-17', '13:30', 'N', 'Z_7', 'L_2', NULL,NULL,NULL);
INSERT INTO WIZYTY VALUES('W_7', '2018-08-31', '2018-09-05', '14:15', 'T', 'Z_1', 'L_4','Badanie RTG kończyny', 'Złamana łapa', 'Operacja łapy');
INSERT INTO WIZYTY VALUES('W_8', '2019-12-03', '2019-12-12', '15:00', 'T', 'Z_3', 'L_5','Badanie RTG jamy brzusznej', 'Przedmiot w jamie brzusznej', 'Operacja jamy brzusznej');
INSERT INTO WIZYTY VALUES('W_9', '2018-07-24', '2018-07-27', '16:15', 'T', 'Z_8', 'L_6','Badanie RTG ogona', 'Złamany ogon', 'Rekonstrukcja ogona');
INSERT INTO WIZYTY VALUES('W_10', '2018-11-03', '2018-11-12', '16:05', 'T', 'Z_8', 'L_1','Badanie RTG ogona', 'Złamany ogon', 'Rekonstrukcja ogona');
INSERT INTO WIZYTY VALUES('W_11', '2018-05-04', '2018-05-10', '14:00', 'T', 'Z_5', 'L_3','Obdukcja pazurów', 'Wrastające pazury', 'Obcinanie pazurów');
INSERT INTO WIZYTY VALUES('W_12', '2019-10-23', '2019-10-27', '18:00', 'N', 'Z_3', 'L_1', NULL,NULL,NULL);
INSERT INTO WIZYTY VALUES('W_13', '2018-12-07', '2018-12-12', '16:15', 'T', 'Z_9', 'L_4','Obdukcja pazurów', 'Wrastające pazury', 'Obcinanie pazurów');
INSERT INTO WIZYTY VALUES('W_14', '2019-01-31', '2019-02-10', '11:15', 'T', 'Z_11', 'L_3','Obdukcja pazurów', 'Wrastające pazury', 'Obcinanie pazurów');
INSERT INTO WIZYTY VALUES('W_15', '2018-12-13', '2018-12-20', '17:00', 'T', 'Z_10', 'L_2','Badanie RTG jamy brzusznej', 'Zanieczyszczony przewód pokarmowy', 'Odrobaczanie');
INSERT INTO WIZYTY VALUES('W_16', '2019-06-13', '2019-06-17', '14:15', 'T', 'Z_12', 'L_2','Obdukcja pazurów', 'Wrastające pazury', 'Obcinanie pazurów');
INSERT INTO WIZYTY VALUES('W_17', '2018-03-21', '2018-04-25', '18:15', 'N', 'Z_6', 'L_1', NULL,NULL,NULL);
INSERT INTO WIZYTY VALUES('W_18', '2019-04-12', '2019-04-16', '16:15', 'T', 'Z_5', 'L_4','Obdukcja pazurów', 'Wrastające pazury', 'Obcinanie pazurów');
INSERT INTO WIZYTY VALUES('W_19', '2019-11-23', '2019-11-27', '14:15', 'T', 'Z_12', 'L_5','Obdukcja pazurów', 'Wrastające pazury', 'Obcinanie pazurów');
INSERT INTO WIZYTY VALUES('W_20', '2018-11-23', '2018-11-26', '15:15', 'N', 'Z_6', 'L_4', NULL,NULL,NULL);
INSERT INTO WIZYTY VALUES('W_21', '2019-12-08', '2019-12-15', '14:00', 'T', 'Z_8', 'L_3','Badanie RTG jamy brzusznej', 'Przedmiot w jamie brzusznej', 'Operacja jamy brzusznej');
INSERT INTO WIZYTY VALUES('W_22', '2019-12-20', '2019-12-30', '11:15', 'T', 'Z_11', 'L_3','Obdukcja pazurów', 'Wrastające pazury', 'Obcinanie pazurów');
INSERT INTO WIZYTY VALUES('W_23', '2019-11-08', '2019-11-15', '14:00', 'T', 'Z_8', 'L_3','Badanie RTG jamy brzusznej', 'Przedmiot w jamie brzusznej', 'Operacja jamy brzusznej');
