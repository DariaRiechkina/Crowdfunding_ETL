create database crowdfunding_db;

create type outcome as enum ('failed', 'successful', 'canceled', 'live');


 create table if not exists category(
    --"id" int  primary key not null,
    "category_id" varchar(10) primary key  NOT NULL,
    "category" varchar(25)   NOT NULL
);

 create table if not exists subcategory(
   -- "id" int primary key not null,
    "subcategory_id" varchar(10)  primary key NOT NULL,
    "subcategory" varchar(25)   NOT NULL
);

 create table if not exists campaign(
    "cf_id" int primary key not null,
    "contact_id" int   NOT NULL,
    "company_name" varchar(35)   NOT NULL,
    "description" varchar(225)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" outcome  NOT NULL,
    "backers_count" int   NOT NULL,
    "country" char(6)   NOT NULL,
    "currency" char(6)   NOT NULL,
    "luanch_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT null,
    foreign key (category_id) references category(category_id),
    foreign key (subcategory_id) references subcategory(subcategory_id)
);

 create table if not exists contacts(
    "contact_id" int primary key not null,
    "first_name" char(15)   NOT NULL,
    "last_name" char(15)   NOT NULL,
    "email" varchar(45)   NOT NULL
);


ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

--ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
--REFERENCES "category" ("category_id");

--ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
--REFERENCES "subcategory" ("subcategory_id");

-- fillout tables with the data

COPY category
from '/Users/dariareichkina/Projects/Bootcamp/Crowdfunding_ETL/Resources/category.csv' DELIMITER ',' CSV HEADER;

COPY subcategory
FROM  '/Users/dariareichkina/Projects/Bootcamp/Crowdfunding_ETL/Resources/subcategory.csv' DELIMITER ',' CSV HEADER;

COPY campaign
FROM '/Users/dariareichkina/Projects/Bootcamp/Crowdfunding_ETL/Resources/campaign.csv'  DELIMITER ',' CSV HEADER;

COPY contacts
FROM '/Users/dariareichkina/Projects/Bootcamp/Crowdfunding_ETL/Resources/contacts.csv' DELIMITER ',' CSV HEADER;

select * from category;
select * from subcategory;
select * from campaign;
select * from contacts;
