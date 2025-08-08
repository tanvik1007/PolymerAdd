CREATE DATABASE postgres;
CREATE USER postgres WITH PASSWORD '123';
GRANT ALL PRIVILEGES ON DATABASE testdb TO postgres;
CREATE TABLE "com_table" (
    Id SERIAL PRIMARY KEY,
  "COMPANY NAME" text,
  "REFERENCE" text NULL,
  "CONTACT PERSON" text NULL,
  "POSITION" text NULL,
  "EMAIL-1" text NULL,
  "EMAIL-2" text NULL,
  "TEL" text NULL,
  "MOBILE-1" text NULL,
  "MOBILE-2" text NULL,
  "ADDRESS LINE1" text NULL,
  "ADDRESS LINE 2" text NULL,
  "ADDRESS LINE 3" text NULL,
  "PIN CODE" double precision NULL,
  "CITY" text NULL,
  "COUNTRY" text NULL
);

INSERT INTO "com_table" ("COMPANY NAME","REFERENCE","CONTACT PERSON","POSITION","EMAIL-1","EMAIL-2","TEL ","MOBILE-1","MOBILE-2","ADDRESS LINE1","ADDRESS LINE 2","ADDRESS LINE 3","PIN CODE","CITY","COUNTRY")
VALUES
('Grupa Azoty Polyolefins S.A. ',NULL,'Dr. Andreas. Goeldel','Commercial Technology Director','andreas.goeldel@grupaazoty.com',NULL,'+48-725400418',NULL,NULL,'ul. Kuźnicka 1, Police',NULL,NULL,72010,'Police','Poland'),
('National Metal and Materials Technology Center (MTEC)',NULL,'Ms Suphakan Kijamnajsuk                                               ','Technical Head','suphakk@mtec.or.th',NULL,'+66-025646500 ext 4395','+66-616611400',NULL,'114 Thailand Science Park, Phahonyothin Road','Khlong Nueng, Khlong Luang, Pathum Thani',NULL,12120,'Pathum Thani','Thailand'),
('National Metal and Materials Technology Center (MTEC)',NULL,'Ms Waraporn Ketmayoon',NULL,'warapok@mtec.or.th',NULL,NULL,NULL,NULL,'114 Thailand Science Park, Phahonyothin Road','Khlong Nueng, Khlong Luang, Pathum Thani',NULL,12120,'Pathum Thani','Thailand'),
('National Metal and Materials Technology Center (MTEC)',NULL,'Mr Sarmart Nutsai',NULL,'sarmartn@mtec.or.th',NULL,NULL,NULL,NULL,'114 Thailand Science Park, Phahonyothin Road','Khlong Nueng, Khlong Luang, Pathum Thani',NULL,12120,'Pathum Thani','Thailand'),
('National Metal and Materials Technology Center (MTEC)',NULL,'Mr Arintarached Sirinantawittaya',NULL,'arintars@mtec.or.th',NULL,NULL,NULL,NULL,'114 Thailand Science Park, Phahonyothin Road','Khlong Nueng, Khlong Luang, Pathum Thani',NULL,12120,'Pathum Thani','Thailand'),
('CTEC ( Whiteness testing)',NULL,NULL,NULL,'ctec@nstda.or.th',NULL,'+66-025646500 ext 4215',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('QES Consultancy','Testing -Dust Explosive Values','Thin  ','Sales Executive','salesops2@qesafety.com',NULL,'+65-60187926 ',NULL,NULL,'7030 Ang Mo Kio Ave 5, ','NorthStar @Amk #01-28 ',NULL,569880,'Singapore','Singapore'),
('Scientific and Technological Research Equipment Centre Chulalongkorn University (STREC)','Testing-Moisture, LOI, PSD, WDXRF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('TUCSEAR at Thammasart University ','Testing-Moisture, LOI, PSD, WDXRF',NULL,NULL,'tucsear@tu.ac.th',NULL,'+66-9-4954-2882',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('Modi Laboratory','GPC testing','Mr Alpesh Modi','Owner / Proprietor','info@modilaboratory.co.in','modilaboratory@gmail.com',NULL,'+91-9974046442','+91-9998070265','Shop No.1,2nd Floor Agrawal Mall,Opp.Bhagwad Vidya Pith','Nr.Gota Chokdi,S.G.Highway,',NULL,380061,'Ahmedabad','India'),
('National Metal and Materials Technology Center (MTEC)','DSC','Ms Siriporn Kitchaicharoenporn','Thermal Analysis Technique Lab','siripork@mtec.or.th',NULL,'+66-2564 6500 ext. 4374',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('Thai Parkerizing Co., Ltd','Testing-XRF','Ms.Kotchakorn Pedthong (Joon)',NULL,NULL,NULL,NULL,NULL,NULL,'570 Moo 4, Bangpoo Industrial Estate','Soi 12B, Sukhumvit Rd','Prakasa',10280,'Muang, Samutprakarn ','Thailand'),
('Thongfoo (1991) Co., Ltd. (บริษัท ทองฟู (1991) จำกัด)',NULL,NULL,NULL,'thongfoo1991@gmail.com',NULL,NULL,NULL,NULL,'295 Pattanakarn Road, Prawet, Bangkok 10250, Thailand',NULL,NULL,NULL,'Bangkok','Thailand');
SELECT * FROM com_table ORDER BY id;

ALTER TABLE com_table RENAME TO company;

SELECT* from company ORDER BY id;

UPDATE company
SET country_code = CASE
    WHEN "COUNTRY" = 'India' THEN 'IN'
    WHEN "COUNTRY" = 'Poland' THEN 'PL'
    WHEN "COUNTRY" = 'Thailand' THEN 'TH'
    WHEN "COUNTRY" = 'Singapore' THEN 'SG'
    WHEN "COUNTRY" = 'Japan' THEN 'JP'
    ELSE NULL
END;
