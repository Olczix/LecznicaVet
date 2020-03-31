
/* USUWANIE TABELI */
/*DROP TABLE WIZYTY
DROP TABLE DIAGNOZA
DROP TABLE ZABIEGI
DROP TABLE ZWIERZE
DROP TABLE GATUNEK
DROP TABLE WLASCICIEL
DROP TABLE ADRES
DROP TABLE LEKARZ
DROP TABLE LEK
DROP TABLE BADANIA
DROP TABLE MATERIALY

DROP FUNCTION dbo.DobreDane */


/* Utworzenie tablicy zawierajacej adresy zameldowania klientow */
CREATE TABLE ADRES(
IdAdresu		VARCHAR(10) primary key,
CONSTRAINT PoprawneIdAdresu CHECK (IdAdresu LIKE 'A_[0-9]%'), /*postaci A_x, gdzie x to dowolna liczba*/
NazwaUlicy		VARCHAR(100) NOT NULL,
NumerDomu		INTEGER NOT NULL,
CONSTRAINT PoprawnyNumerDomu CHECK (NumerDomu > 0),
NumerLokalu		INTEGER,
CONSTRAINT PoprawnyNumerLokalu CHECK (NumerLokalu > 0),
KodPocztowy		VARCHAR(7),
CONSTRAINT PoprawnyKodPocztowy CHECK (KodPocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]'), /*postaci xx-xxx, zgodny z ogóln¹ konwencj¹ numeru kodu pocztowego */
Miejscowosc		VARCHAR(50) NOT NULL,
CONSTRAINT PoprawnaNazwaMiejscowosci CHECK (Miejscowosc NOT LIKE '%[0-9]%')
);


/* Utworzenie tabeli z danymi klientów (wlascicieli zwierzat) lecznicy */
CREATE TABLE WLASCICIEL(
IdWlasciciela	VARCHAR(10)	PRIMARY KEY,
CONSTRAINT PoprawneIdWlasciciela CHECK (IdWlasciciela LIKE 'O_[0-9]%'), /*postaci O_x, gdzie x to dowolna liczba*/
Nazwisko		VARCHAR(40)	NOT NULL,
CONSTRAINT PoprawneNazwiskoWlasciciela CHECK (Nazwisko NOT LIKE '%[0-9]%'),
Imie			VARCHAR(40)	NOT NULL,
CONSTRAINT PoprawneImieWlasciciela CHECK (Imie NOT LIKE '%[0-9]%'),
Telefon			VARCHAR(11),
CONSTRAINT PoprawnzNumerTelefonuWlasciciela CHECK (Telefon LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'), /*postaci xxx-xxx-xxx, gdzie x to dowolna cyfra*/
IdAdresu		VARCHAR(10) REFERENCES ADRES
);


/* Utworzenie tabeli z danymi lekarzy pracujacych w lecznicy */
CREATE TABLE LEKARZ(
IdLekarza				VARCHAR(10)	PRIMARY KEY,
CONSTRAINT PoprawneIdLekarya CHECK (IdLekarza LIKE 'L_[0-9]%'), /*postaci L_x, gdzie x to dowolna liczba*/
Nazwisko				VARCHAR(40)	NOT NULL,
CONSTRAINT PoprawneNazwiskoLekarza CHECK (Nazwisko NOT LIKE '%[0-9]%'),
Imie					VARCHAR(40)	NOT NULL,
CONSTRAINT PoprawneImieLekarza CHECK (Imie NOT LIKE '%[0-9]%'),
Specjalnosc				VARCHAR(100),
DataZatrudnienia		DATE NOT NULL,
CONSTRAINT PoprawnaDataZatrudnienia CHECK (DataZatrudnienia LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
DataZakonczeniaPracy	DATE,
CONSTRAINT PoprawnaDataZakonczeniaPracy CHECK ( DataZakonczeniaPracy LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]' AND (DataZakonczeniaPracy = NULL OR LEKARZ.DataZakonczeniaPracy >= LEKARZ.DataZatrudnienia))
);


/* Utworzenie tabeli z danymi gatunkow zwierzat dopuszczonych do leczenia oraz do wizyt w lecznicy */
CREATE TABLE GATUNEK(
Rasa				VARCHAR(200) PRIMARY KEY NOT NULL,
CONSTRAINT PoprawnaRasa CHECK (Rasa NOT LIKE '%[0-9]%'),
NazwaGatunku		VARCHAR(200) NOT NULL,
CONSTRAINT PoprawnyGatunek CHECK (NazwaGatunku NOT LIKE '%[0-9]%')

);


/* Utworzenie tabeli z danymi zwierzat korzystajacych z uslug lecznicy */
CREATE TABLE ZWIERZE(
IdZwierzecia		VARCHAR(10)	PRIMARY KEY,
CONSTRAINT PoprawneIdZwierzecia CHECK (IdZwierzecia LIKE 'Z_[0-9]%'),
NadaneImie			VARCHAR(40) NOT NULL,
IdWlasciciela		VARCHAR(10)	NOT NULL REFERENCES WLASCICIEL,
Rasa				VARCHAR(200) NOT NULL REFERENCES GATUNEK,
DataUrodzenia		DATE NOT NULL,
CONSTRAINT PoprawnaDataUrodzeniaZwierzecia CHECK (DataUrodzenia LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
DataSmierci			DATE,
CONSTRAINT PoprawnaDataSmierci CHECK (DataSmierci LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]' AND ( DataSmierci = NULL OR ZWIERZE.DataSmierci > ZWIERZE.DataUrodzenia)),
Plec				VARCHAR(1) NOT NULL,
CONSTRAINT PoprawnyFormatPlci check (Plec = 'M' or Plec = 'F'), /*M-male, F-Female*/
Choroba				VARCHAR(100),
CzyZaszczepione		VARCHAR(1) NOT NULL,
CONSTRAINT PoprawnyFormatCzyZaszczepione check(CzyZaszczepione = 'T' or CzyZaszczepione = 'N'),	/*(T-tak, N-nie)*/
ZnakiSzczegolne		VARCHAR(100)
);


/* Utworzenie tabeli z danymi zabiegów przeprowadzanych w lecznicy */
CREATE TABLE ZABIEGI(
NazwaZabiegu		VARCHAR(100) PRIMARY KEY,
Dziedzina			VARCHAR(100),
LekarzProwadzacy	VARCHAR(10)	REFERENCES LEKARZ,
Cena				INT check(Cena>=0),
DlaZaszczepionych	VARCHAR(1)  NOT NULL,
CONSTRAINT PoprawnyFormatDlaZaszczepionych check(DlaZaszczepionych = 'T' or DlaZaszczepionych = 'N')	/* T-tak, N-nie */
);


/* Utworzenie tabeli z lekami przepisywanymi podczas diagnozy */
CREATE TABLE LEK(
NazwaLeku			VARCHAR(200) PRIMARY KEY,
RodzajLeku			VARCHAR(100) NOT NULL, 
CzestoscZazywania	VARCHAR(10),
CONSTRAINT PoprawnyFormatCzestosciZazywania CHECK( CzestoscZazywania LIKE '[0-9]-%'),	/* x - y, gdzie x to liczba, y to czêœæ dnia, np. 3-dzieñ, 1-godzina */
FormaLeku			VARCHAR(10)  NOT NULL,
CONSTRAINT PoprawnyFormatFormyLeku check(FormaLeku = 'Tabletki' or FormaLeku = 'Krople' or FormaLeku = 'P³yn' or FormaLeku = 'Maœæ'), /* Tabletki / Maœæ / Krople / P³yn */
Cena				INT,
CONSTRAINT PoprawnaCenaLeku check(Cena>=0)
);


/* Utworzenie tabeli z diagnozami wystawianymi przez lekarzy */
CREATE TABLE DIAGNOZA(
NazwaDiagnoza		VARCHAR(100) PRIMARY KEY,
Opis				VARCHAR(500),
ZaleconyZabieg		VARCHAR(100) REFERENCES ZABIEGI,
PrzepisanyLek		VARCHAR(200) REFERENCES LEK
);


/* Utworzenie tabeli z materialami uzywanymi podczas badan wykonywanych w trakcie wizyt  */
CREATE TABLE MATERIALY(
NazwaMaterialu		VARCHAR(100)	PRIMARY KEY,
CONSTRAINT PoprawnaNazwaMaterialu CHECK (NazwaMaterialu NOT LIKE '%[0-9]%'),
CzasPrzydatnosci	VARCHAR(4),
CONSTRAINT PoprawnyFormatCzasuPrzydatnosci check( CzasPrzydatnosci LIKE '[0-9]-%' )	/* LICZBA-CZAS, np. g-godzina, d-dzieñ, t-tydzieñ, m-miesiac */
);


/* Utworzenie tabeli z danymi badan przeprowadzanych podczas wizyt */
CREATE TABLE BADANIA(
NazwaBadania		VARCHAR(500)	PRIMARY KEY,
CONSTRAINT PoprawnaNazwaBadania CHECK (NazwaBadania NOT LIKE '%[0-9]%'),
CzasTrwania			VARCHAR(5)  NOT NULL,
CONSTRAINT PoprawnyFormatCzasuTrwania check( CzasTrwania LIKE '[0-9][0-9]:[0-9][0-9]' ),		/* w formacie GG:MM */
U¿ytyMateria³		VARCHAR(100) REFERENCES MATERIALY
);


-- Funkcja sprawdzaj¹ca czy mo¿liwa jest wizyta danego zwierzecia z danym lekarzem, a nie ¿e np
--  wizyta obejmuje zmar³e zwierzê oraz lekarza który ju¿ nie pracuje

GO
	CREATE FUNCTION dbo.DobreDane(	@IdZwierzaka VARCHAR(10), @IdLek VARCHAR(10), @data_rejestracji date )
	RETURNS BIT
	AS BEGIN
		IF(	
			(SELECT DataUrodzenia FROM ZWIERZE WHERE @IdZwierzaka=IdZwierzecia)	< @data_rejestracji
			AND (SELECT DataZatrudnienia FROM LEKARZ WHERE @IdLek=IdLekarza)		< @data_rejestracji 
			)
		BEGIN
			return 1
		END
		return 0
	END
GO



/* Utworzenie tabeli z danymi wizyty przeprowadzanych w lecznicy */
CREATE TABLE WIZYTY(
IdWizyty				VARCHAR(10)		PRIMARY KEY, /* postaci W_x, gdzie x to dowolna liczba */
DataRejestracji			DATE NOT NULL,
CONSTRAINT PoprawnyFormatDatyRejestracji CHECK (DataRejestracji LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
DataWizyty				DATE NOT NULL,
CONSTRAINT PoprawnyFormatDatyWizyty CHECK (DataWizyty LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
CONSTRAINT DobreDatyWizyty CHECK ( WIZYTY.DataRejestracji<WIZYTY.DataWizyty),
GodzinaWizyty			VARCHAR(5) NOT NULL,
CONSTRAINT PoprawnyFormatGodzinyWizyty check( GodzinaWizyty LIKE '[0-9][0-9]:[0-9][0-9]' ),	 /*GG:MM*/
CzyOdbylaSie			VARCHAR(1) NOT NULL,
CONSTRAINT PoprawnyFormatCzyOdbylaSie check(CzyOdbylaSie = 'T' or CzyOdbylaSie = 'N'),	/* T-tak, N-nie */
IdPacjentaWizyty		VARCHAR(10) NOT NULL REFERENCES ZWIERZE,
IdLekarza				VARCHAR(10)		REFERENCES LEKARZ,
CONSTRAINT DobreDaneDoWizyty CHECK ( dbo.DobreDane(WIZYTY.IdPacjentaWizyty, WIZYTY.IdLekarza, WIZYTY.DataRejestracji)=1),
PrzeprowadzoneBadanie	VARCHAR(500)	REFERENCES BADANIA,
WystawionaDiagnoza		VARCHAR(100)	REFERENCES DIAGNOZA,
ZaleconyZabieg			VARCHAR(100)	REFERENCES ZABIEGI
);


--SELECT IdPacjentaWizyty FROM WIZYTY, ZWIERZE WHERE WIZYTY.IdPacjentaWizyty=ZWIERZE.IdZwierzecia