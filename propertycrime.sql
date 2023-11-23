CREATE TABLE "public.Seller" (
	"SellerID" serial NOT NULL,
	"FirstName" VARCHAR(255) NOT NULL,
	"LastName" VARCHAR(255) NOT NULL,
	"e_mail" varchar,
	"Address" VARCHAR(255),
	"CityID" VARCHAR(255),
	"StateID" VARCHAR(255),
	CONSTRAINT "Seller_pk" PRIMARY KEY ("SellerID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Bayer" (
	"BuyerID" serial NOT NULL,
	"FirstName" VARCHAR(255) NOT NULL,
	"LastName" VARCHAR(255) NOT NULL,
	"e_mail" varchar,
	"Address" VARCHAR(255),
	"CityID" VARCHAR(255),
	"StateID" VARCHAR(255),
	CONSTRAINT "Bayer_pk" PRIMARY KEY ("BuyerID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.City" (
	"City" VARCHAR(255) NOT NULL,
	"CityID" serial NOT NULL,
	"CityID1" serial NOT NULL,
	"CityID2" serial NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.State" (
	"StateID" serial NOT NULL,
	"StateID1" serial NOT NULL,
	"StatdeID2" serial NOT NULL,
	"State" VARCHAR(255) NOT NULL,
	CONSTRAINT "State_pk" PRIMARY KEY ("StateID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Transaction" (
	"PropID" integer NOT NULL,
	"TransID" integer,
	"TransDate" DATETIME,
	"SellerID" integer,
	"BuyerID" integer,
	"SellingPrice" integer,
	CONSTRAINT "Transaction_pk" PRIMARY KEY ("PropID","TransID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Property" (
	"PropID" serial NOT NULL,
	"AreaID" VARCHAR(255) NOT NULL,
	"Address" VARCHAR(255) NOT NULL,
	"CityID" VARCHAR(255) NOT NULL,
	"StateID" VARCHAR(255) NOT NULL,
	"SellingPrice" integer NOT NULL,
	"TypeID" VARCHAR(255) NOT NULL,
	"YearID" integer NOT NULL,
	"BedroomNum" integer NOT NULL,
	"BathNum" integer NOT NULL,
	"FirePlace" BOOLEAN NOT NULL,
	"Field" BOOLEAN NOT NULL,
	CONSTRAINT "Property_pk" PRIMARY KEY ("PropID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Area" (
	"AreaID" serial NOT NULL,
	"AreaID1" serial NOT NULL,
	"AreaName" VARCHAR(255) NOT NULL,
	"CategoryType" VARCHAR(255) NOT NULL,
	"Field" BOOLEAN NOT NULL,
	CONSTRAINT "Area_pk" PRIMARY KEY ("AreaID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Types" (
	"TypeID" serial NOT NULL,
	"PropertyType" VARCHAR(255) NOT NULL,
	CONSTRAINT "Types_pk" PRIMARY KEY ("TypeID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.YearID" (
	"YearBuildD" serial NOT NULL,
	"YearBuild" integer NOT NULL,
	CONSTRAINT "YearID_pk" PRIMARY KEY ("YearBuildD")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.DailyCrime" (
	"DailyCRimeID" serial NOT NULL,
	"CrimeID" integer NOT NULL,
	"CrimeCount" integer NOT NULL,
	"AreaID" integer NOT NULL,
	"CrimeDate" DATETIME NOT NULL,
	CONSTRAINT "DailyCrime_pk" PRIMARY KEY ("DailyCRimeID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Crime" (
	"CrimeID" integer NOT NULL,
	"CrimeType" VARCHAR(255) NOT NULL,
	CONSTRAINT "Crime_pk" PRIMARY KEY ("CrimeID")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Seller" ADD CONSTRAINT "Seller_fk0" FOREIGN KEY ("SellerID") REFERENCES "Transaction"("SellerID");

ALTER TABLE "Bayer" ADD CONSTRAINT "Bayer_fk0" FOREIGN KEY ("BuyerID") REFERENCES "Transaction"("BuyerID");

ALTER TABLE "City" ADD CONSTRAINT "City_fk0" FOREIGN KEY ("CityID") REFERENCES "Seller"("CityID");
ALTER TABLE "City" ADD CONSTRAINT "City_fk1" FOREIGN KEY ("CityID1") REFERENCES "Bayer"("CityID");
ALTER TABLE "City" ADD CONSTRAINT "City_fk2" FOREIGN KEY ("CityID2") REFERENCES "Property"("CityID");

ALTER TABLE "State" ADD CONSTRAINT "State_fk0" FOREIGN KEY ("StateID") REFERENCES "Bayer"("StateID");
ALTER TABLE "State" ADD CONSTRAINT "State_fk1" FOREIGN KEY ("StateID1") REFERENCES "Seller"("StateID");
ALTER TABLE "State" ADD CONSTRAINT "State_fk2" FOREIGN KEY ("StatdeID2") REFERENCES "Property"("StateID");


ALTER TABLE "Property" ADD CONSTRAINT "Property_fk0" FOREIGN KEY ("PropID") REFERENCES "Transaction"("PropID");

ALTER TABLE "Area" ADD CONSTRAINT "Area_fk0" FOREIGN KEY ("AreaID") REFERENCES "Property"("AreaID");
ALTER TABLE "Area" ADD CONSTRAINT "Area_fk1" FOREIGN KEY ("AreaID1") REFERENCES "DailyCrime"("AreaID");

ALTER TABLE "Types" ADD CONSTRAINT "Types_fk0" FOREIGN KEY ("TypeID") REFERENCES "Property"("TypeID");

ALTER TABLE "YearID" ADD CONSTRAINT "YearID_fk0" FOREIGN KEY ("YearBuildD") REFERENCES "Property"("YearID");


ALTER TABLE "Crime" ADD CONSTRAINT "Crime_fk0" FOREIGN KEY ("CrimeID") REFERENCES "DailyCrime"("CrimeID");












