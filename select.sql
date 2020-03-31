-- ZAPYTANIA OD KAROLINY STĘPIEŃ 
-- 1. Jaka ilość materiału X -> (Żel do badania RTG) została zużyta przez lekarza Y -> (L_3) w ciągu ostatnich Z -> (3) miesięcy? 
-- CEL: Patrząc na bieżące materiału, właściciel lecznicy może zamówić odpowiednią ilość, aby danego materiału zawsze było pod dostatkiem.

SELECT WIZYTY.IdLekarza, count(*) AS IloscUzytegoMaterialu
	FROM(( WIZYTY 
		INNER JOIN LEKARZ ON WIZYTY.IdLekarza = LEKARZ.IdLekarza)
		INNER JOIN BADANIA ON WIZYTY.PrzeprowadzoneBadanie = BADANIA.NazwaBadania )
	WHERE WIZYTY.DataRejestracji<=GETDATE()  AND WIZYTY.DataRejestracji>=GETDATE()-90 AND LEKARZ.IdLekarza ='L_3'
			and Badania.UżytyMateriał = 'Żel do badania RTG'
		GROUP BY  WIZYTY.IdLekarza;


-- 2. Ile średnio kosztuje właściciela (leki+zabieg) leczenie zwierzaka chorego na chorobę X -> (Nadpobudliwość) ? */
-- CEL: Jest to statystyczna wiedza pozwalająca ocenić, czy właściciela stać na dalsze leczenie zwierzaka chorego na daną chorobę.

CREATE VIEW V1 AS
SELECT ZWIERZE.IdZwierzecia , SUM(ZABIEGI.Cena)+SUM(LEK.Cena) as Koszt
	FROM ((((WIZYTY 
		INNER JOIN ZWIERZE ON WIZYTY.IdPacjentaWizyty = ZWIERZE.IdZwierzecia) 
		INNER JOIN DIAGNOZA ON WIZYTY.WystawionaDiagnoza = DIAGNOZA.NazwaDiagnoza)
		INNER JOIN LEK ON DIAGNOZA.PrzepisanyLek = LEK.NazwaLeku)
		INNER JOIN ZABIEGI ON WIZYTY.ZaleconyZabieg = ZABIEGI.NazwaZabiegu)
		WHERE ZWIERZE.Choroba = 'Nadpobudliwość'
	GROUP BY ZWIERZE.IdZwierzecia;

SELECT * FROM V1;

--WYNIK
SELECT AVG(V1.Koszt) as Średnia 
	FROM V1;

DROP VIEW V1; 

-- 3. Dla każdej specjalności wskaż po X lekarzy -> (jednego lekarza), który w ostatnim roku przyjął największą liczbę różnych pacjentów.  (róznych=wielokrotne wizyty jednego pacjenta liczone są jako 1)  
-- CEL: Jest to przydatne dla właściciela lecznicy, który z każdej specjalności na podstawie rocznej oceny, wybiera najlepszego lekarza i daje mu nagrodę pieniężną (za solidną pracę).

--ZestawienieBadanychPacjentów bez duplikatów
CREATE VIEW K3_1
AS SELECT DISTINCT LEKARZ.IdLekarza,LEKARZ.Specjalnosc, WIZYTY.IdPacjentaWizyty
			FROM WIZYTY JOIN LEKARZ
				ON WIZYTY.IdLekarza = LEKARZ.IdLekarza;

--ZestawienieIlosciRoznychPacjentowDlaKazdegoLekarza+SPECJALNOSC
CREATE VIEW K3_2
AS SELECT K3_1.IdLekarza, K3_1.Specjalnosc, COUNT(*) AS IlośćRóżnychPacjentów
	FROM K3_1 
	GROUP BY IdLekarza,Specjalnosc;

--ZestawienieSpecjalnosc+MaksymalnaLiczbaRoznychPacjentów
CREATE VIEW K3_3 AS
SELECT  K3_2.Specjalnosc,  MAX(K3_2.IlośćRóżnychPacjentów) AS MaksDlaSpecjalnosci
	FROM K3_2 JOIN LEKARZ
			ON K3_2.IdLekarza = LEKARZ.IdLekarza
			GROUP BY K3_2.Specjalnosc;

SELECT * FROM K3_1;
SELECT * FROM K3_2;
SELECT * FROM K3_3;

-- WYNIK --
SELECT K3_3.Specjalnosc, K3_2.IdLekarza
	FROM K3_2 JOIN K3_3
		ON K3_2.Specjalnosc = K3_3.Specjalnosc
		WHERE IlośćRóżnychPacjentów = MaksDlaSpecjalnosci;

DROP VIEW K3_1;
DROP VIEW K3_2;
DROP VIEW K3_3;



-- ZAPYTANIA OD KUBY FEDOROWICZA 
-- 1. Najdroższy w leczeniu gatunek zwierzęcia (na podstawie historii zawartej w bazie). 
-- CEL: Dzięki takiemu zestawieniu właściciel lecznicy jest w stanie stwierdzić leczenie jakich zwierząt jest dla niego najbardziej opłacalne i z ogromną chęcią przyjmować takie zwierzęta na wizyty. 

SELECT TOP 1 GATUNEK.NazwaGatunku, SUM(ZABIEGI.Cena)+SUM(LEK.Cena) as CałkowityKosztLeczenia
	FROM (((((WIZYTY 
		INNER JOIN ZWIERZE ON WIZYTY.IdPacjentaWizyty = ZWIERZE.IdZwierzecia) 
		INNER JOIN GATUNEK ON ZWIERZE.Rasa=GATUNEK.Rasa )
		INNER JOIN DIAGNOZA ON WIZYTY.WystawionaDiagnoza = DIAGNOZA.NazwaDiagnoza)
		INNER JOIN LEK ON DIAGNOZA.PrzepisanyLek = LEK.NazwaLeku)
		INNER JOIN ZABIEGI ON WIZYTY.ZaleconyZabieg = ZABIEGI.NazwaZabiegu)
	GROUP BY GATUNEK.NazwaGatunku
	ORDER BY 2 DESC;


-- 2. Który lekarz [wykonał -> zlecił] najwięcej zabiegów w ostatnim miesiącu (GRUDNIU) ? 
-- CEL: Bonus pieniężny dla najlepszego pracownika miesiąca.

SELECT TOP 1 WIZYTY.IdLekarza AS ID_LEKARZA, COUNT(*) AS LiczbaZleconychZbiegow
	FROM WIZYTY JOIN LEKARZ 
		ON WIZYTY.IdLekarza = LEKARZ.IdLekarza
	WHERE WIZYTY.DataRejestracji<=GETDATE()  AND WIZYTY.DataRejestracji>=GETDATE()-30  AND  WIZYTY.ZaleconyZabieg IS NOT NULL
	GROUP BY WIZYTY.IdLekarza
	ORDER BY 2 DESC


-- 3. Jaki procent wszystkich przepisanych leków stanowi lek najczęściej przepisywany przez lekarza X -> (L_..)?
-- CEL: Dzięki temu zapytaniu właściciel lecznicy jest w stanie oszacować procentową ilość leku, który powinien zamówić z hurtowni, tak by leków nigdy nie zabrakło.

CREATE VIEW V2
AS  select DIAGNOZA.PrzepisanyLek, COUNT(*) AS IloscPrzepisanychLekow
	from WIZYTY join DIAGNOZA
		ON WIZYTY.WystawionaDiagnoza = DIAGNOZA.NazwaDiagnoza
		WHERE WIZYTY.IdLekarza = 'L_3'
		GROUP BY DIAGNOZA.PrzepisanyLek;

SELECT * FROM V2;

-- WYNIK
SELECT MAX(IloscPrzepisanychLekow)*100/SUM(IloscPrzepisanychLekow) as wynik_procentowy
FROM V2;

DROP VIEW V2;
		


-- ZAPYTANIA ODE MNIE !! (6)
-- 1. Wypisz zwierzęta, które nie odbyły ani jednej wizyty u lekarza L_4.
-- CEL: Można zacząć polecać lekarza L_4 właścicielom tych zwierząt, gdyby zaszła potrzeba zmiany lekarza prowadzącego.

SELECT IdZwierzecia--, NadaneImie 
FROM ZWIERZE 
WHERE IdZwierzecia NOT IN  
( SELECT DISTINCT ZWIERZE.IdZwierzecia--, ZWIERZE.NadaneImie
	FROM WIZYTY JOIN ZWIERZE
	ON WIZYTY.IdPacjentaWizyty = ZWIERZE.IdZwierzecia
	where IdLekarza = 'L_3');


-- 2. Dla każdego właściciela utwórz zestawienie, które pokaże ile razy był on na wizycie ze swoim pupilem.
-- CEL: Dowiemy się, który właściciel zasługuje na zniżki ( np. co 10 wizytya gratis ).

SELECT Imie, Nazwisko, count(*) AS IloscWizyt
	FROM ((WIZYTY 
		INNER JOIN ZWIERZE ON WIZYTY.IdPacjentaWizyty = ZWIERZE.IdZwierzecia) 
		INNER JOIN WLASCICIEL ON ZWIERZE.IdWlasciciela=WLASCICIEL.IdWlasciciela )
	GROUP BY Nazwisko,Imie
	order by 3 desc;


-- 3. Wyświetl właścicieli mieszkających pod tym samym adresem + adres (czyli przynajmniej 2 osoby zamieszkujące pod tym samym adresem).
-- CEL: Pomocne przy korespondencji, tzn. można wysłać tylko jeden pod dany adres.

SELECT Nazwisko, Imie, Miejscowosc,KodPocztowy, NazwaUlicy, NumerDomu, NumerLokalu
	FROM WLASCICIEL JOIN ADRES
	ON WLASCICIEL.IdAdresu = ADRES.IdAdresu
	WHERE WLASCICIEL.IdAdresu IN
		(SELECT ADRES.IdAdresu
			FROM WLASCICIEL 
				INNER JOIN ADRES ON WLASCICIEL.IdAdresu = ADRES.IdAdresu
			group by ADRES.IdAdresu, Miejscowosc,NazwaUlicy
			HAVING COUNT(*) >=2);


-- 4. Czy istnieje lek w bazie, który nie został ani razu przepisany? Jeśli tak - jaki(e) to lek(i)?
-- CEL: Zapytanie utowrzone w celu kontroli dat przydatności nieużywyanych leków.

SELECT NazwaLeku
	FROM LEK
	WHERE NazwaLeku NOT IN (
		SELECT DISTINCT NazwaLeku
		FROM ((WIZYTY
			INNER JOIN DIAGNOZA ON WIZYTY.WystawionaDiagnoza = DIAGNOZA.NazwaDiagnoza)
			INNER JOIN LEK ON DIAGNOZA.PrzepisanyLek = LEK.NazwaLeku));


-- 5. Jaki zabieg cieszy się największą popularnością wśród pacjentów?
-- CEL: Lecznica tonie w długach - czas podnieść cenę najpopularniejszego zabiegu.

SELECT top 1 NazwaZabiegu, COUNT(*) AS IlośćPrzeprowadzonychZabiegów
	FROM (WIZYTY
		INNER JOIN ZABIEGI ON WIZYTY.ZaleconyZabieg = ZABIEGI.NazwaZabiegu)
	GROUP BY NazwaZabiegu
	ORDER BY 2 DESC;


-- 6. Jakie są dwie najrzadziej wystawiane diagnozy? 
-- CEL: Dane statystyczne.

SELECT top 2 NazwaDiagnoza, COUNT(*) AS ile
	FROM (WIZYTY
		INNER JOIN DIAGNOZA ON WIZYTY.WystawionaDiagnoza = DIAGNOZA.NazwaDiagnoza)
	GROUP BY NazwaDiagnoza
	ORDER BY 2 ;
