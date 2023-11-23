CREATE TABLE "public.Seller" (
	"Seller_ID" serial NOT NULL,
	"Name" varchar NOT NULL,
	"Email" varchar NOT NULL,
	"City_ID" integer NOT NULL,
	"State_ID" integer NOT NULL,
	"Address" varchar NOT NULL,
	CONSTRAINT "Seller_pk" PRIMARY KEY ("Seller_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Transaction" (
	"Transaction_ID" serial NOT NULL,
	"Transaction_date" DATE NOT NULL,
	"Seller_ID" integer NOT NULL,
	"Buyer_ID" integer NOT NULL,
	"Property_ID" integer NOT NULL,
	CONSTRAINT "Transaction_pk" PRIMARY KEY ("Transaction_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Buyer" (
	"Buyer_ID" serial NOT NULL,
	"Name" varchar NOT NULL,
	"Email" varchar NOT NULL,
	"Address" varchar NOT NULL,
	"City_ID" integer NOT NULL,
	"State_ID" integer NOT NULL,
	CONSTRAINT "Buyer_pk" PRIMARY KEY ("Buyer_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.City" (
	"City" varchar NOT NULL,
	"City_ID" serial NOT NULL,
	CONSTRAINT "City_pk" PRIMARY KEY ("City_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.State" (
	"State_ID" serial NOT NULL,
	"State" varchar NOT NULL,
	CONSTRAINT "State_pk" PRIMARY KEY ("State_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Area" (
	"Area_ID" serial NOT NULL,
	"Area_name" varchar NOT NULL,
	"Category_Type" varchar NOT NULL,
	"Field" integer NOT NULL,
	CONSTRAINT "Area_pk" PRIMARY KEY ("Area_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Property" (
	"Property_ID" serial NOT NULL,
	"Area_ID" integer NOT NULL,
	"Address" varchar NOT NULL,
	"City_ID" integer NOT NULL,
	"State_ID" integer NOT NULL,
	"Sqft" integer NOT NULL,
	"Listing_price" integer NOT NULL,
	"Type_ID" integer NOT NULL,
	"Year_build_ID" integer NOT NULL,
	"No_of_bedroom" integer NOT NULL,
	"Fireplace" integer NOT NULL,
	"No_of_bathroom" integer NOT NULL,
	CONSTRAINT "Property_pk" PRIMARY KEY ("Property_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Type" (
	"Type_ID" serial NOT NULL,
	"Property_type" varchar NOT NULL,
	CONSTRAINT "Type_pk" PRIMARY KEY ("Type_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Year_Build" (
	"Year_Build_ID" serial NOT NULL,
	"Year_build" integer NOT NULL,
	CONSTRAINT "Year_Build_pk" PRIMARY KEY ("Year_Build_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Daily_Crime" (
	"Daily_crime_ID" serial NOT NULL,
	"Crime_ID" integer NOT NULL,
	"Crime_count" integer NOT NULL,
	"Area_ID" integer NOT NULL,
	"Date" DATE NOT NULL,
	CONSTRAINT "Daily_Crime_pk" PRIMARY KEY ("Daily_crime_ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Crime" (
	"Crime_ID" serial NOT NULL,
	"Crime_type" varchar NOT NULL,
	CONSTRAINT "Crime_pk" PRIMARY KEY ("Crime_ID")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Seller" ADD CONSTRAINT "Seller_fk0" FOREIGN KEY ("City_ID") REFERENCES "City"("City_ID");
ALTER TABLE "Seller" ADD CONSTRAINT "Seller_fk1" FOREIGN KEY ("State_ID") REFERENCES "State"("State_ID");

ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_fk0" FOREIGN KEY ("Seller_ID") REFERENCES "Seller"("Seller_ID");
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_fk1" FOREIGN KEY ("Buyer_ID") REFERENCES "undefined"("undefined");
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_fk2" FOREIGN KEY ("Property_ID") REFERENCES "Property"("Property_ID");

ALTER TABLE "Buyer" ADD CONSTRAINT "Buyer_fk0" FOREIGN KEY ("Buyer_ID") REFERENCES "Transaction"("Buyer_ID");
ALTER TABLE "Buyer" ADD CONSTRAINT "Buyer_fk1" FOREIGN KEY ("City_ID") REFERENCES "City"("City_ID");
ALTER TABLE "Buyer" ADD CONSTRAINT "Buyer_fk2" FOREIGN KEY ("State_ID") REFERENCES "State"("State_ID");

ALTER TABLE "City" ADD CONSTRAINT "City_fk0" FOREIGN KEY ("City_ID") REFERENCES "Property"("City_ID");

ALTER TABLE "State" ADD CONSTRAINT "State_fk0" FOREIGN KEY ("State_ID") REFERENCES "Property"("State_ID");


ALTER TABLE "Property" ADD CONSTRAINT "Property_fk0" FOREIGN KEY ("Area_ID") REFERENCES "Area"("Area_ID");
ALTER TABLE "Property" ADD CONSTRAINT "Property_fk1" FOREIGN KEY ("City_ID") REFERENCES "Untitled"("City_ID");
ALTER TABLE "Property" ADD CONSTRAINT "Property_fk2" FOREIGN KEY ("State_ID") REFERENCES "undefined"("undefined");
ALTER TABLE "Property" ADD CONSTRAINT "Property_fk3" FOREIGN KEY ("Type_ID") REFERENCES "undefined"("undefined");
ALTER TABLE "Property" ADD CONSTRAINT "Property_fk4" FOREIGN KEY ("Year_build_ID") REFERENCES "undefined"("undefined");

ALTER TABLE "Type" ADD CONSTRAINT "Type_fk0" FOREIGN KEY ("Type_ID") REFERENCES "Property"("Type_ID");

ALTER TABLE "Year_Build" ADD CONSTRAINT "Year_Build_fk0" FOREIGN KEY ("Year_Build_ID") REFERENCES "Property"("Year_build_ID");

ALTER TABLE "Daily_Crime" ADD CONSTRAINT "Daily_Crime_fk0" FOREIGN KEY ("Crime_ID") REFERENCES "undefined"("undefined");
ALTER TABLE "Daily_Crime" ADD CONSTRAINT "Daily_Crime_fk1" FOREIGN KEY ("Area_ID") REFERENCES "Area"("Area_ID");

ALTER TABLE "Crime" ADD CONSTRAINT "Crime_fk0" FOREIGN KEY ("Crime_ID") REFERENCES "Daily_Crime"("Crime_ID");












