-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8FiUr6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "category" (
    "id" int   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "category" varchar(25)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "subcategory" (
    "id" int   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory" varchar(25)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(35)   NOT NULL,
    "description" varchar(45)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" unem   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" char(6)   NOT NULL,
    "currency" char(6)   NOT NULL,
    "luanch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" char(15)   NOT NULL,
    "last_name" char(15)   NOT NULL,
    "email" varchar(45)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

