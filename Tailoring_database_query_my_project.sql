--################# Table creation section #################

Create database Taoloring_database
use [Taoloring_database]

backup database [Taoloring_database]
to disk ='D:\CODES\SQL\project_file_of_database\Project_backup.bak'

----------------------           project tables  section --------------------------

------------------------------- Company 
Create Table Companies(
Com_number int primary key,
Com_Name varchar (max) not null,
Com_address varchar (max) not null,
Phone varchar(10),

)

------------------------ Branches
Create Table Branches(
Br_ID int primary key identity(1,1),
Br_Name varchar(50) not null,
Br_address varchar(max) not null,
Br_manag_Name varchar(50),
Com_numF int,
foreign key (Com_numF) references Companies(Com_number)

)
set identity_insert Branches off

------------------- -------         Manager 

Create Table Managers(
Manag_ID int primary key,
Manag_Name varchar(50) not null,
Manag_F_Name varchar(50),
Manag_address varchar(max)not null,
Manag_salary decimal,
Manag_gender varchar(7),
Manag_phone varchar(10)
)

---------------------------------- relationship table 
Create Table Branch_has_Manager (
has_ID int primary key,
branch_id int,
manager_id int,
foreign key (branch_id) references Branches(Br_ID),
foreign key (manager_id) references Managers(Manag_ID)

)


---------------------------     Employee  
Create Table Employees(
Emp_ID int identity(1,1) primary key,
Emp_Name varchar (50) not null,
Emp_gender varchar(7) not null,
Emp_phone varchar(10),
Emp_job_stat_date date not null,
Emp_address varchar (max) not null,
Emp_bra_Name varchar(max) not null,
Emp_salary decimal,
branch_idF int,
manager_idF int,
foreign key (branch_idF) references Branches(Br_ID),
foreign key (manager_idF) references Managers(Manag_ID)

)
set identity_insert Employees off

---------------------------     Feedback

Create Table Feedback(
Feed_Number int primary key identity(1,1),
Feed_title varchar (max),
Feed_comment varchar (max),
Feed_date date,
managerIdF int,
foreign key (managerIdF) references Managers(Manag_ID)

)
set identity_insert Feedback off


---------------------------     Customer

Create Table Customers(
Cus_ID int primary key identity(1,1),
Cus_Name varchar (50) not null,
Cus_Phone varchar (50),
Cus_address varchar(max) not null,
Cus_gender varchar (7)not null,
employee_idF int ,
manag_idF int,
feedback_idF int,
foreign key (employee_idF) references Employees(Emp_ID),
foreign key (manag_idF) references Managers(Manag_ID),
foreign key (feedback_idF) references Feedback(Feed_Number)

)
set identity_insert Customers off

-----------------------        table for multivalued attrubutes Cloth type
Create Table Cloth_type(
Cloth_type_ID int primary key,
Cloth_type_Name varchar(50),
)


-----------------------        table for multivalued attrubutes Cloth type attrubures

CREATE TABLE CloutAttributes (
  attribute_id INT PRIMARY KEY IDENTITY(1,1),
  C_name VARCHAR(50),
  lenght decimal,
  sholder decimal,
  sleeve decimal,
  sides decimal , 
  trouser decimal,
  foot_neck decimal,
  neck decimal,
  Head_measure decimal,
  cap_height decimal,

);

set identity_insert CloutAttributes off

---------------------------     Bell


 Create Table Bells
(
Bell_number int primary key identity (1,1),
Bringing_date date not null,
Slice_date date not null,
Bran_Name  varchar (max),
Descout decimal,
Main_rate decimal not null,
Cloth_type_IDF int,
Cloth_attrub_IDF int,
foreign key (Cloth_type_IDF) references Cloth_type(Cloth_type_ID),
foreign key (Cloth_attrub_IDF) references CloutAttributes(attribute_id)

)

set identity_insert Bells off


Create Table Cus_has_Bell(
Cus_B_has_id int primary key,
Customer_idF int,
Bell_idF int,
foreign key (Customer_idF) references Customers(Cus_ID),
foreign key (Bell_idF) references Bells(Bell_number)
)



--#################################################### Value insertion section #######################################

------------------------------- Company 

INSERT INTO Companies values(1,'Almadena Tailoring Shop','Shahre Now Kabul Afghnistan','0789558914')



------------------------ Branches

INSERT INTO Branches values('First Almadena Tailoring Shop','Kandahar Afghanistan','Farid Shakir',1)
INSERT INTO Branches values('Second Almadena Tailoring Shop','Helmand Afghanistan','Siddiqullah',1)
INSERT INTO Branches values('Therd Almadena Tailoring Shop','Wardak Afghanistan','Hasibullah',1)
select * from Branches

------------------- -------         Manager 

INSERT INTO Managers VALUES(1,'Farid Ahmad','Zamin Gul','Wardak Afghanistan',40000,'Male','0765501626')
INSERT INTO Managers VALUES(2,'Siddiqullah','Najebullah','Helmand',30000,'Male','0782304578')
INSERT INTO Managers VALUES(3,'Hasibullah','Yar mohammad','Wardak Afghanistan',25000,'Male','07348534')
select* from Managers

---------------------------     Employee  

INSERT INTO Employees VALUES ('Ahmad','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('Mahmood','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('Ali','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('abdulNafi','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',40000,1,1)
INSERT INTO Employees VALUES ('abdullah','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('mansoor','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4005,3,3)
INSERT INTO Employees VALUES ('hashim','Male','08927438','2023-4-5','kabul afgahnistan','First Almadena Tailoring Shop',5000,1,1)
INSERT INTO Employees VALUES ('rashid','Male','84738975','2020-8-9','helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('nabee','Male','384783','2022-7-15','tajkjhaer  afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('yaseen','Male','384758345','2023-4-5','balkh afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('ahmad','Male','83748534','2020-8-9','neemroz afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('ahmad wali','Male','3847534353','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('alam','Male','349835745','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',6000,1,1)
INSERT INTO Employees VALUES ('khan','Male','348578375','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',3000,2,2)
INSERT INTO Employees VALUES ('jan','Male','387475384','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',2000,3,3)
INSERT INTO Employees VALUES ('amrullah','Male','78347534','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',8000,1,1)
INSERT INTO Employees VALUES ('amanullah','Male','38475345','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',9000,2,2)
INSERT INTO Employees VALUES ('amran','Male','43876583','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',5000,3,3)
INSERT INTO Employees VALUES ('anas','Male','87436358','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',7000,1,1)
INSERT INTO Employees VALUES ('anayatullah','Male','378458736','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',7000,2,2)
INSERT INTO Employees VALUES ('ffatima','Female','8439798534','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',7000,3,3)
INSERT INTO Employees VALUES ('Ahmad','Male','89437835','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('arif','Male','384973545','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('aziz','Male','3453453','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('ayar','Male','345352346','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('atimad','Male','5676576','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('asa','Male','345656','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('atiqullah','Male','345756','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('badam','Male','23435','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('bilal','Male','4564567','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('abdullha','Male','24356','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('baitullah','Male','2324567','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('shams','Male','345676789','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('zaki','Male','324567','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('masihullah','Male','234567','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('shirgul','Male','2345678','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('saddiqullah','Male','345678','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('shiob','Male','2345678','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('sbdulwahab','Male','87675644','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('ahmadyar','Male','8765876','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('farid','Male','98776544','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('hasib','Male','987654','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hijratullah','Male','8765432','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('islamkhan','Male','8765432367','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('aisha','Famale','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hasibullah','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('ismail','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('mohammaullah','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('matiullah','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('muhib','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('mashal','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('muhabbat','Male','23456787','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('dedar','Male','345678984','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('nasir','Male','45678975','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('Ahmad','Male','34567865','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('sesar','Male','09876998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('numan','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('rabani','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('shakoor','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('shaker','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('shahid','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('shafiullah','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('keramatullah','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('ehsan','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('emal','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('wahid','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('Ahmad','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('faisal','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('hafizullah','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hamdam','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('munir','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('wahab','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('fazalrahman','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('hakim','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('hamdard','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hamid','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('hanif','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('heakir','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hoodman','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('ishaq','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('Ali','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('Ahmad','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('Mahmood','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('munir','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('wahab','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('fazalrahman','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('hakim','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('hamdard','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hamid','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('hanif','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('heakir','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hoodman','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('ishaq','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('Ali','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('Ahmad','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('Mahmood','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('abdullah','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('mansoor','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('hashim','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('rashid','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('nabee','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('yaseen','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('ahmad','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('ahmad wali','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('alam','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('khan','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('jan','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('amrullah','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('amanullah','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('amran','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('anas','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('anayatullah','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('ffatima','Female','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('Ahmad','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('arif','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('aziz','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('ayar','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)
INSERT INTO Employees VALUES ('atimad','Male','09384998','2020-8-9','Helmand afgahnistan','Secom Almadena Tailoring Shop',4000,2,2)
INSERT INTO Employees VALUES ('asa','Male','08374374','2022-7-15','Wardak afgahnistan','Therd Almadena Tailoring Shop',4000,3,3)
INSERT INTO Employees VALUES ('atiqullah','Male','09874343','2023-4-5','Mazar afgahnistan','First Almadena Tailoring Shop',4000,1,1)


select * from Employees

---------------------------     Feedback

INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-23',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-23',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuio iwe ioewkafkahjkf hsdaksdhkfajshdf ','2023-2-4',2)
INSERT INTO Feedback VALUES ('About single cloths','woiewoiklas owieuiohjkf hsdaksdhkfajshdf ','2016-2-9',1)
INSERT INTO Feedback VALUES ('About waist coat','woiewoiklas owieu hsdaksdhkfajshdf ','2023-2-23',3)
INSERT INTO Feedback VALUES ('About caps','woiewoiklas owieuio iwe ioewkafkdhkfajshdf ','2020-2-29',2)

select * from Feedback


---------------------------     Customer

INSERT INTO Customers VALUES ('Hashmatullah','08934949','logar afghanistan','Male',1,1,2)
INSERT INTO Customers VALUES ('Mohammad','07838345','Laghman afghanistan','Male',2,2,1)
INSERT INTO Customers VALUES ('Qasim','78398435','Kundoz afghanistan','Male',3,3,3)
INSERT INTO Customers VALUES ('Nazif','7838485','Mazar afghanistan','Male',2,2,4)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',30,1,1)
INSERT INTO Customers VALUES ('Mahmood','09384998','Helmand afgahnistan','Male',110,2,70)
INSERT INTO Customers VALUES ('Ali','08374374','Wardak afgahnistan','Male',109,3,3)
INSERT INTO Customers VALUES ('abdulNafi','09874343','Mazar afgahnistan','Male',108,1,69)
INSERT INTO Customers VALUES ('abdullah','09384998','Helmand afgahnistan','Male',107,2,68)
INSERT INTO Customers VALUES ('mansoor','08374374','Wardak afgahnistan','Male',106,3,67)
INSERT INTO Customers VALUES ('hashim','08927438','kabul afgahnistan','Male',105,1,66)
INSERT INTO Customers VALUES ('rashid','84738975','helmand afgahnistan','Male',104,2,65)
INSERT INTO Customers VALUES ('nabee','384783','tajkjhaer  afgahnistan','Male',103,3,64)
INSERT INTO Customers VALUES ('yaseen','384758345','balkh afgahnistan','Male',102,1,63)
INSERT INTO Customers VALUES ('ahmad','83748534','neemroz afgahnistan','Male',101,2,61)
INSERT INTO Customers VALUES ('ahmad wali','Male','3847534353','Wardak afgahnistan',100,3,60)
INSERT INTO Customers VALUES ('alam','349835745','Mazar afgahnistan','Male',99,1,59)
INSERT INTO Customers VALUES ('khan','348578375','Helmand afgahnistan','Male',98,2,58)
INSERT INTO Customers VALUES ('jan','387475384','Wardak afgahnistan','Male',97,3,57)
INSERT INTO Customers VALUES ('amrullah','78347534','Mazar afgahnistan','Male',96,1,56)
INSERT INTO Customers VALUES ('amanullah','38475345','Helmand afgahnistan','Male',95,2,55)
INSERT INTO Customers VALUES ('amran','43876583','Wardak afgahnistan','Male',94,3,54)
INSERT INTO Customers VALUES ('anas','87436358','Mazar afgahnistan','Male',93,1,53)
INSERT INTO Customers VALUES ('anayatullah','378458736','Helmand afgahnistan','Male',92,2,52)
INSERT INTO Customers VALUES ('fatima','8439798534','Wardak afgahnistan','Female',92,3,51)
INSERT INTO Customers VALUES ('Ahmad','89437835','Mazar afgahnistan','Male',91,1,50)
INSERT INTO Customers VALUES ('arif','384973545','Helmand afgahnistan','Male',90,2,49)
INSERT INTO Customers VALUES ('aziz','3453453','Wardak afgahnistan','Male',89,3,48)
INSERT INTO Customers VALUES ('ayar','345352346','Mazar afgahnistan','Male',88,1,47)
INSERT INTO Customers VALUES ('atimad','5676576','Helmand afgahnistan','Male',87,2,46)
INSERT INTO Customers VALUES ('asa','345656','Wardak afgahnistan','Male',86,3,45)
INSERT INTO Customers VALUES ('atiqullah','345756','Mazar afgahnistan','Male',84,1,44)
INSERT INTO Customers VALUES ('badam','23435','Helmand afgahnistan','Male',83,2,43)
INSERT INTO Customers VALUES ('bilal','4564567','Wardak afgahnistan','Male',82,3,42)
INSERT INTO Customers VALUES ('abdullha','2023-4-5','Mazar afgahnistan','Male',82,1,41)
INSERT INTO Customers VALUES ('baitullah','2324567','Helmand afgahnistan','Male',81,2,40)
INSERT INTO Customers VALUES ('shams','345676789','Wardak afgahnistan','Male',80,3,39)
INSERT INTO Customers VALUES ('zaki','324567','Mazar afgahnistan','Male',79,1,38)
INSERT INTO Customers VALUES ('masihullah','234567','Helmand afgahnistan','Male',78,2,37)
INSERT INTO Customers VALUES ('shirgul','2345678','Wardak afgahnistan','Male',77,3,36)
INSERT INTO Customers VALUES ('saddiqullah','345678','Mazar afgahnistan','Male',76,1,35)
INSERT INTO Customers VALUES ('shiob','2345678','Helmand afgahnistan','Male',75,2,2)
INSERT INTO Customers VALUES ('sbdulwahab','87675644','Wardak afgahnistan','Male',74,3,34)
INSERT INTO Customers VALUES ('ahmadyar','8765876','Mazar afgahnistan','Male',73,1,33)
INSERT INTO Customers VALUES ('farid','98776544','Helmand afgahnistan','Male',72,2,32)
INSERT INTO Customers VALUES ('hasib','987654','Wardak afgahnistan','Male',71,3,3)
INSERT INTO Customers VALUES ('hijratullah','8765432','Mazar afgahnistan','Male',70,1,31)
INSERT INTO Customers VALUES ('islamkhan','8765432367','Helmand afgahnistan','Male',69,2,30)
INSERT INTO Customers VALUES ('aisha','08374374','Wardak afgahnistan','Famale',68,3,29)
INSERT INTO Customers VALUES ('hasibullah','09874343','Mazar afgahnistan','Male',67,1,28)
INSERT INTO Customers VALUES ('ismail','09384998','Helmand afgahnistan','Male',66,2,27)
INSERT INTO Customers VALUES ('mohammaullah','08374374','Wardak afgahnistan','Male',65,3,26)
INSERT INTO Customers VALUES ('matiullah','09874343','Mazar afgahnistan','Male',63,1,25)
INSERT INTO Customers VALUES ('muhib','09384998','Helmand afgahnistan','Male',62,2,24)
INSERT INTO Customers VALUES ('mashal','08374374','Wardak afgahnistan','Male',61,3,23)
INSERT INTO Customers VALUES ('muhabbat','23456787','Mazar afgahnistan','Male',60,1,21)
INSERT INTO Customers VALUES ('dedar','345678984','Helmand afgahnistan','Male',50,2,22)
INSERT INTO Customers VALUES ('nasir','45678975','Wardak afgahnistan','Male',58,3,20)
INSERT INTO Customers VALUES ('Ahmad','34567865','Mazar afgahnistan','Male',57,1,19)
INSERT INTO Customers VALUES ('sesar','09876998','Helmand afgahnistan','Male',56,2,18)
INSERT INTO Customers VALUES ('numan','08374374','Wardak afgahnistan','Male',55,3,17)
INSERT INTO Customers VALUES ('rabani','09874343','Mazar afgahnistan','Male',54,1,16)
INSERT INTO Customers VALUES ('shakoor','09384998','Helmand afgahnistan','Male',53,2,15)
INSERT INTO Customers VALUES ('shaker','08374374','Wardak afgahnistan','Male',52,3,14)
INSERT INTO Customers VALUES ('shahid','09874343','Mazar afgahnistan','Male',52,1,13)
INSERT INTO Customers VALUES ('shafiullah','09384998','Helmand afgahnistan','Male',51,2,12)
INSERT INTO Customers VALUES ('keramatullah','08374374','Wardak afgahnistan','Male',50,3,11)
INSERT INTO Customers VALUES ('ehsan','09874343','Mazar afgahnistan','Male',49,1,10)
INSERT INTO Customers VALUES ('emal','09384998','Helmand afgahnistan','Male',48,2,9)
INSERT INTO Customers VALUES ('wahid','08374374','Wardak afgahnistan','Male',47,3,8)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',46,1,7)
INSERT INTO Customers VALUES ('faisal','09384998','Helmand afgahnistan','Male',45,2,6)
INSERT INTO Customers VALUES ('hafizullah','08374374','Wardak afgahnistan','Male',44,3,5)
INSERT INTO Customers VALUES ('hamdam','09874343','Mazar afgahnistan','Male',43,1,4)
INSERT INTO Customers VALUES ('munir','09384998','Helmand afgahnistan','Male',42,2,3)
INSERT INTO Customers VALUES ('wahab','08374374','Wardak afgahnistan','Male',42,3,3)
INSERT INTO Customers VALUES ('fazalrahman','08374374','Mazar afgahnistan','Male',41,1,1)
INSERT INTO Customers VALUES ('hakim','09384998','Helmand afgahnistan','Male',40,2,79)
INSERT INTO Customers VALUES ('hamdard','08374374','Wardak afgahnistan','Male',40,3,79)
INSERT INTO Customers VALUES ('hamid','09874343','Mazar afgahnistan','Male',39,1,78)
INSERT INTO Customers VALUES ('hanif','09384998','Helmand afgahnistan','Male',38,2,77)
INSERT INTO Customers VALUES ('heakir','08374374','Wardak afgahnistan','Male',37,3,76)
INSERT INTO Customers VALUES ('hoodman','09874343','Mazar afgahnistan','Male',36,1,75)
INSERT INTO Customers VALUES ('ishaq','09384998','Helmand afgahnistan','Male',35,2,74)
INSERT INTO Customers VALUES ('Ali','08374374','Wardak afgahnistan','Male',34,3,73)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',33,1,71)
INSERT INTO Customers VALUES ('Mahmood','09384998','Helmand afgahnistan','Male',32,2,72)
INSERT INTO Customers VALUES ('munir','09384998','Helmand afgahnistan','Male',31,2,70)
INSERT INTO Customers VALUES ('wahab','08374374','Wardak afgahnistan','Male',30,3,3)
INSERT INTO Customers VALUES ('fazalrahman','09874343','Mazar afgahnistan','Male',29,1,1)
INSERT INTO Customers VALUES ('hakim','09384998','Helmand afgahnistan','Male',28,2,2)
INSERT INTO Customers VALUES ('hamdard','08374374','Wardak afgahnistan','Male',27,3,3)
INSERT INTO Customers VALUES ('nasir','45678975','Wardak afgahnistan','Male',58,3,20)
INSERT INTO Customers VALUES ('Ahmad','34567865','Mazar afgahnistan','Male',57,1,19)
INSERT INTO Customers VALUES ('sesar','09876998','Helmand afgahnistan','Male',56,2,18)
INSERT INTO Customers VALUES ('numan','08374374','Wardak afgahnistan','Male',55,3,17)
INSERT INTO Customers VALUES ('rabani','09874343','Mazar afgahnistan','Male',54,1,16)
INSERT INTO Customers VALUES ('shakoor','09384998','Helmand afgahnistan','Male',53,2,15)
INSERT INTO Customers VALUES ('shaker','08374374','Wardak afgahnistan','Male',52,3,14)
INSERT INTO Customers VALUES ('shahid','09874343','Mazar afgahnistan','Male',52,1,13)
INSERT INTO Customers VALUES ('shafiullah','09384998','Helmand afgahnistan','Male',51,2,12)
INSERT INTO Customers VALUES ('keramatullah','08374374','Wardak afgahnistan','Male',50,3,11)
INSERT INTO Customers VALUES ('ehsan','09874343','Mazar afgahnistan','Male',49,1,10)
INSERT INTO Customers VALUES ('emal','09384998','Helmand afgahnistan','Male',48,2,9)
INSERT INTO Customers VALUES ('wahid','08374374','Wardak afgahnistan','Male',47,3,8)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',46,1,7)
INSERT INTO Customers VALUES ('faisal','09384998','Helmand afgahnistan','Male',45,2,6)
INSERT INTO Customers VALUES ('hafizullah','08374374','Wardak afgahnistan','Male',44,3,5)
INSERT INTO Customers VALUES ('hamdam','09874343','Mazar afgahnistan','Male',43,1,4)
INSERT INTO Customers VALUES ('munir','09384998','Helmand afgahnistan','Male',42,2,3)
INSERT INTO Customers VALUES ('wahab','08374374','Wardak afgahnistan','Male',42,3,3)
INSERT INTO Customers VALUES ('fazalrahman','08374374','Mazar afgahnistan','Male',41,1,1)
INSERT INTO Customers VALUES ('hakim','09384998','Helmand afgahnistan','Male',40,2,80)
INSERT INTO Customers VALUES ('hamdard','08374374','Wardak afgahnistan','Male',40,3,79)
INSERT INTO Customers VALUES ('hamid','09874343','Mazar afgahnistan','Male',39,1,78)
INSERT INTO Customers VALUES ('hanif','09384998','Helmand afgahnistan','Male',38,2,77)
INSERT INTO Customers VALUES ('Hashmatullah','08934949','logar afghanistan','Male',1,1,2)
INSERT INTO Customers VALUES ('Mohammad','07838345','Laghman afghanistan','Male',2,2,1)
INSERT INTO Customers VALUES ('Qasim','78398435','Kundoz afghanistan','Male',3,3,3)
INSERT INTO Customers VALUES ('Nazif','7838485','Mazar afghanistan','Male',2,2,4)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',30,1,1)
INSERT INTO Customers VALUES ('Mahmood','09384998','Helmand afgahnistan','Male',110,2,70)
INSERT INTO Customers VALUES ('Ali','08374374','Wardak afgahnistan','Male',109,3,3)
INSERT INTO Customers VALUES ('abdulNafi','09874343','Mazar afgahnistan','Male',108,1,69)
INSERT INTO Customers VALUES ('abdullah','09384998','Helmand afgahnistan','Male',107,2,68)
INSERT INTO Customers VALUES ('mansoor','08374374','Wardak afgahnistan','Male',106,3,67)
INSERT INTO Customers VALUES ('hashim','08927438','kabul afgahnistan','Male',105,1,66)
INSERT INTO Customers VALUES ('rashid','84738975','helmand afgahnistan','Male',104,2,65)
INSERT INTO Customers VALUES ('nabee','384783','tajkjhaer  afgahnistan','Male',103,3,64)
INSERT INTO Customers VALUES ('yaseen','384758345','balkh afgahnistan','Male',102,1,63)
INSERT INTO Customers VALUES ('ahmad','83748534','neemroz afgahnistan','Male',101,2,61)
INSERT INTO Customers VALUES ('ahmad wali','Male','3847534353','Wardak afgahnistan',100,3,60)
INSERT INTO Customers VALUES ('alam','349835745','Mazar afgahnistan','Male',99,1,59)
INSERT INTO Customers VALUES ('khan','348578375','Helmand afgahnistan','Male',98,2,58)
INSERT INTO Customers VALUES ('jan','387475384','Wardak afgahnistan','Male',97,3,57)
INSERT INTO Customers VALUES ('amrullah','78347534','Mazar afgahnistan','Male',96,1,56)
INSERT INTO Customers VALUES ('amanullah','38475345','Helmand afgahnistan','Male',95,2,55)
INSERT INTO Customers VALUES ('amran','43876583','Wardak afgahnistan','Male',94,3,54)
INSERT INTO Customers VALUES ('anas','87436358','Mazar afgahnistan','Male',93,1,53)
INSERT INTO Customers VALUES ('anayatullah','378458736','Helmand afgahnistan','Male',92,2,52)
INSERT INTO Customers VALUES ('fatima','8439798534','Wardak afgahnistan','Female',92,3,51)
INSERT INTO Customers VALUES ('Ahmad','89437835','Mazar afgahnistan','Male',91,1,50)
INSERT INTO Customers VALUES ('arif','384973545','Helmand afgahnistan','Male',90,2,49)
INSERT INTO Customers VALUES ('aziz','3453453','Wardak afgahnistan','Male',89,3,48)
INSERT INTO Customers VALUES ('ayar','345352346','Mazar afgahnistan','Male',88,1,47)
INSERT INTO Customers VALUES ('atimad','5676576','Helmand afgahnistan','Male',87,2,46)
INSERT INTO Customers VALUES ('asa','345656','Wardak afgahnistan','Male',86,3,45)
INSERT INTO Customers VALUES ('atiqullah','345756','Mazar afgahnistan','Male',84,1,44)
INSERT INTO Customers VALUES ('badam','23435','Helmand afgahnistan','Male',83,2,43)
INSERT INTO Customers VALUES ('bilal','4564567','Wardak afgahnistan','Male',82,3,42)
INSERT INTO Customers VALUES ('abdullha','2023-4-5','Mazar afgahnistan','Male',82,1,41)
INSERT INTO Customers VALUES ('baitullah','2324567','Helmand afgahnistan','Male',81,2,40)
INSERT INTO Customers VALUES ('shams','345676789','Wardak afgahnistan','Male',80,3,39)
INSERT INTO Customers VALUES ('zaki','324567','Mazar afgahnistan','Male',79,1,38)
INSERT INTO Customers VALUES ('masihullah','234567','Helmand afgahnistan','Male',78,2,37)
INSERT INTO Customers VALUES ('shirgul','2345678','Wardak afgahnistan','Male',77,3,36)
INSERT INTO Customers VALUES ('saddiqullah','345678','Mazar afgahnistan','Male',76,1,35)
INSERT INTO Customers VALUES ('shiob','2345678','Helmand afgahnistan','Male',75,2,2)
INSERT INTO Customers VALUES ('sbdulwahab','87675644','Wardak afgahnistan','Male',74,3,34)
INSERT INTO Customers VALUES ('ahmadyar','8765876','Mazar afgahnistan','Male',73,1,33)
INSERT INTO Customers VALUES ('farid','98776544','Helmand afgahnistan','Male',72,2,32)
INSERT INTO Customers VALUES ('hasib','987654','Wardak afgahnistan','Male',71,3,3)
INSERT INTO Customers VALUES ('hijratullah','8765432','Mazar afgahnistan','Male',70,1,31)
INSERT INTO Customers VALUES ('islamkhan','8765432367','Helmand afgahnistan','Male',69,2,30)
INSERT INTO Customers VALUES ('aisha','08374374','Wardak afgahnistan','Famale',68,3,29)
INSERT INTO Customers VALUES ('hasibullah','09874343','Mazar afgahnistan','Male',67,1,28)
INSERT INTO Customers VALUES ('ismail','09384998','Helmand afgahnistan','Male',66,2,27)
INSERT INTO Customers VALUES ('mohammaullah','08374374','Wardak afgahnistan','Male',65,3,26)
INSERT INTO Customers VALUES ('matiullah','09874343','Mazar afgahnistan','Male',63,1,25)
INSERT INTO Customers VALUES ('muhib','09384998','Helmand afgahnistan','Male',62,2,24)
INSERT INTO Customers VALUES ('mashal','08374374','Wardak afgahnistan','Male',61,3,23)
INSERT INTO Customers VALUES ('muhabbat','23456787','Mazar afgahnistan','Male',60,1,21)
INSERT INTO Customers VALUES ('dedar','345678984','Helmand afgahnistan','Male',50,2,22)
INSERT INTO Customers VALUES ('nasir','45678975','Wardak afgahnistan','Male',58,3,20)
INSERT INTO Customers VALUES ('Ahmad','34567865','Mazar afgahnistan','Male',57,1,19)
INSERT INTO Customers VALUES ('sesar','09876998','Helmand afgahnistan','Male',56,2,18)
INSERT INTO Customers VALUES ('numan','08374374','Wardak afgahnistan','Male',55,3,17)
INSERT INTO Customers VALUES ('rabani','09874343','Mazar afgahnistan','Male',54,1,16)
INSERT INTO Customers VALUES ('shakoor','09384998','Helmand afgahnistan','Male',53,2,15)
INSERT INTO Customers VALUES ('shaker','08374374','Wardak afgahnistan','Male',52,3,14)
INSERT INTO Customers VALUES ('shahid','09874343','Mazar afgahnistan','Male',52,1,13)
INSERT INTO Customers VALUES ('shafiullah','09384998','Helmand afgahnistan','Male',51,2,12)
INSERT INTO Customers VALUES ('keramatullah','08374374','Wardak afgahnistan','Male',50,3,11)
INSERT INTO Customers VALUES ('ehsan','09874343','Mazar afgahnistan','Male',49,1,10)
INSERT INTO Customers VALUES ('emal','09384998','Helmand afgahnistan','Male',48,2,9)
INSERT INTO Customers VALUES ('wahid','08374374','Wardak afgahnistan','Male',47,3,8)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',46,1,7)
INSERT INTO Customers VALUES ('faisal','09384998','Helmand afgahnistan','Male',45,2,6)
INSERT INTO Customers VALUES ('hafizullah','08374374','Wardak afgahnistan','Male',44,3,5)
INSERT INTO Customers VALUES ('hamdam','09874343','Mazar afgahnistan','Male',43,1,4)
INSERT INTO Customers VALUES ('munir','09384998','Helmand afgahnistan','Male',42,2,3)
INSERT INTO Customers VALUES ('wahab','08374374','Wardak afgahnistan','Male',42,3,3)
INSERT INTO Customers VALUES ('fazalrahman','08374374','Mazar afgahnistan','Male',41,1,1)
INSERT INTO Customers VALUES ('hakim','09384998','Helmand afgahnistan','Male',40,2,79)
INSERT INTO Customers VALUES ('hamdard','08374374','Wardak afgahnistan','Male',40,3,79)
INSERT INTO Customers VALUES ('hamid','09874343','Mazar afgahnistan','Male',39,1,78)
INSERT INTO Customers VALUES ('hanif','09384998','Helmand afgahnistan','Male',38,2,77)
INSERT INTO Customers VALUES ('heakir','08374374','Wardak afgahnistan','Male',37,3,76)
INSERT INTO Customers VALUES ('hoodman','09874343','Mazar afgahnistan','Male',36,1,75)
INSERT INTO Customers VALUES ('ishaq','09384998','Helmand afgahnistan','Male',35,2,74)
INSERT INTO Customers VALUES ('Ali','08374374','Wardak afgahnistan','Male',34,3,73)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',33,1,71)
INSERT INTO Customers VALUES ('Mahmood','09384998','Helmand afgahnistan','Male',32,2,72)
INSERT INTO Customers VALUES ('munir','09384998','Helmand afgahnistan','Male',31,2,70)
INSERT INTO Customers VALUES ('wahab','08374374','Wardak afgahnistan','Male',30,3,3)
INSERT INTO Customers VALUES ('fazalrahman','09874343','Mazar afgahnistan','Male',29,1,1)
INSERT INTO Customers VALUES ('hakim','09384998','Helmand afgahnistan','Male',28,2,2)
INSERT INTO Customers VALUES ('hamdard','08374374','Wardak afgahnistan','Male',27,3,3)
INSERT INTO Customers VALUES ('nasir','45678975','Wardak afgahnistan','Male',58,3,20)
INSERT INTO Customers VALUES ('Ahmad','34567865','Mazar afgahnistan','Male',57,1,19)
INSERT INTO Customers VALUES ('sesar','09876998','Helmand afgahnistan','Male',56,2,18)
INSERT INTO Customers VALUES ('numan','08374374','Wardak afgahnistan','Male',55,3,17)
INSERT INTO Customers VALUES ('rabani','09874343','Mazar afgahnistan','Male',54,1,16)
INSERT INTO Customers VALUES ('shakoor','09384998','Helmand afgahnistan','Male',53,2,15)
INSERT INTO Customers VALUES ('shaker','08374374','Wardak afgahnistan','Male',52,3,14)
INSERT INTO Customers VALUES ('shahid','09874343','Mazar afgahnistan','Male',52,1,13)
INSERT INTO Customers VALUES ('shafiullah','09384998','Helmand afgahnistan','Male',51,2,12)
INSERT INTO Customers VALUES ('keramatullah','08374374','Wardak afgahnistan','Male',50,3,11)
INSERT INTO Customers VALUES ('ehsan','09874343','Mazar afgahnistan','Male',49,1,10)
INSERT INTO Customers VALUES ('emal','09384998','Helmand afgahnistan','Male',48,2,9)
INSERT INTO Customers VALUES ('wahid','08374374','Wardak afgahnistan','Male',47,3,8)
INSERT INTO Customers VALUES ('Ahmad','09874343','Mazar afgahnistan','Male',46,1,7)
INSERT INTO Customers VALUES ('faisal','09384998','Helmand afgahnistan','Male',45,2,6)
INSERT INTO Customers VALUES ('hafizullah','08374374','Wardak afgahnistan','Male',44,3,5)
INSERT INTO Customers VALUES ('hamdam','09874343','Mazar afgahnistan','Male',43,1,4)
INSERT INTO Customers VALUES ('munir','09384998','Helmand afgahnistan','Male',42,2,3)
INSERT INTO Customers VALUES ('wahab','08374374','Wardak afgahnistan','Male',42,3,3)
INSERT INTO Customers VALUES ('fazalrahman','08374374','Mazar afgahnistan','Male',41,1,1)
INSERT INTO Customers VALUES ('hakim','09384998','Helmand afgahnistan','Male',40,2,80)
INSERT INTO Customers VALUES ('hamdard','08374374','Wardak afgahnistan','Male',40,3,79)
INSERT INTO Customers VALUES ('hamid','09874343','Mazar afgahnistan','Male',39,1,78)
INSERT INTO Customers VALUES ('hanif','09384998','Helmand afgahnistan','Male',38,2,77)

select * from Customers


-----------------------        table for multivalued attrubutes Cloth type

INSERT INTO Cloth_type VALUES(1,'Single cloths')
INSERT INTO Cloth_type VALUES(2,'waist caot')
INSERT INTO Cloth_type VALUES(3,'Caps')
select * from Cloth_type

-----------------------        table for multivalued attrubutes Cloth attrubures

INSERT INTO CloutAttributes VALUES ('Atiqullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Shamsurahman',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Noorahmad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('jan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('ali',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mahmood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('shakib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('hamid',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('rahmat',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('jalal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('farman',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasim',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('irfan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('irfanullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('haqyar',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khyal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('arif',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mojeb',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mustafa',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',15,17,null,34,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',23,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',17,14,null,33,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,22,4)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,28,5)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,20,3)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Atiqullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Shamsurahman',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Noorahmad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('jan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('ali',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mahmood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('shakib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('hamid',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('rahmat',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('jalal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('farman',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasim',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('irfan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('irfanullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('haqyar',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khyal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('arif',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mojeb',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mustafa',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',15,17,null,34,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',23,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',17,14,null,33,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,22,4)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,28,5)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,20,3)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Atiqullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Shamsurahman',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Noorahmad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('jan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('ali',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mahmood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('shakib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('hamid',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('rahmat',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('jalal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('farman',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasim',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('irfan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('irfanullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('haqyar',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khyal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('arif',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mojeb',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mustafa',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',15,17,null,34,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',23,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',17,14,null,33,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,22,4)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,28,5)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,20,3)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Atiqullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Shamsurahman',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Noorahmad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('jan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('ali',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mahmood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('shakib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('hamid',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('rahmat',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('jalal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('farman',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasim',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('irfan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('irfanullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Mohammad',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('haqyar',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('Sultan',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khyal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('arif',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mojeb',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('mustafa',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',15,17,null,34,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',23,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',22,20,null,39,null,null,17,null,null)
INSERT INTO CloutAttributes VALUES ('khakid',17,14,null,33,null,null,15,null,null)
INSERT INTO CloutAttributes VALUES ('saidullah',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('saifullah',42,20,21,21,39,7,15,null,null)
INSERT INTO CloutAttributes VALUES ('mashal',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('Nasib',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,22,4)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,28,5)
INSERT INTO CloutAttributes VALUES ('qasimi',null,null,null,null,null,null,null,20,3)
INSERT INTO CloutAttributes VALUES ('myanoor',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('dawood',40,20,22,25,39,8,17,null,null)
INSERT INTO CloutAttributes VALUES ('rashid',40,20,22,25,39,8,17,null,null)


select * from CloutAttributes where attribute_id = 1 --- becouse it is deleted 
---------------------------------------------------------------------------


---------------------------     Bell

INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,3)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,2,2)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,6)
INSERT INTO Bells VALUES('2023-1-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,3)
INSERT INTO Bells VALUES('2023-2-6','2023-6-9','First almadena Tailoring Shop',2,400,3,4)
INSERT INTO Bells VALUES('2023-4-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,6)
INSERT INTO Bells VALUES('2023-5-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,5)
INSERT INTO Bells VALUES('2023-6-6','2023-6-9','First almadena Tailoring Shop',2,400,3,7)
INSERT INTO Bells VALUES('2023-7-8','2023-6-6','First almadena Tailoring Shop',6,400,1,6)
INSERT INTO Bells VALUES('2023-8-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,8)
INSERT INTO Bells VALUES('2023-9-6','2023-6-9','First almadena Tailoring Shop',2,400,1,9)
INSERT INTO Bells VALUES('2023-2-8','2023-6-6','First almadena Tailoring Shop',6,400,1,10)
INSERT INTO Bells VALUES('2023-4-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,11)
INSERT INTO Bells VALUES('2023-5-6','2023-6-9','First almadena Tailoring Shop',2,400,1,12)
INSERT INTO Bells VALUES('2023-7-4','2023-6-5','therd almadena Tailoring Shop',3,400,3,13)
INSERT INTO Bells VALUES('2023-6-12','2023-6-9','First almadena Tailoring Shop',2,400,1,14)
INSERT INTO Bells VALUES('2023-4-8','2023-6-6','First almadena Tailoring Shop',6,400,1,16)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,15)
INSERT INTO Bells VALUES('2023-7-6','2023-6-9','First almadena Tailoring Shop',2,400,3,17)
INSERT INTO Bells VALUES('2023-8-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,18)
INSERT INTO Bells VALUES('2023-5-6','2023-6-9','First almadena Tailoring Shop',2,400,2,19)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,20)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,21)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,1,22)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,23)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,24)
INSERT INTO Bells VALUES('2023-5-6','2023-6-9','First almadena Tailoring Shop',2,400,2,25)
INSERT INTO Bells VALUES('2023-7-8','2023-6-6','Second almadena Tailoring Shop',6,400,2,26)
INSERT INTO Bells VALUES('2023-6-4','2023-6-5','First almadena Tailoring Shop',3,400,2,27)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,28)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,29)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,2,30)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,31)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,32)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,33)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,34)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,35)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','Second almadena Tailoring Shop',3,400,3,36)
INSERT INTO Bells VALUES('2023-3-7','2023-6-9','First almadena Tailoring Shop',2,400,3,37)
INSERT INTO Bells VALUES('2023-3-8','2023-6-5','therd almadena Tailoring Shop',3,400,3,38)
INSERT INTO Bells VALUES('2023-4-6','2023-6-9','First almadena Tailoring Shop',2,400,2,39)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,40)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,1,41)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,2,42)
INSERT INTO Bells VALUES('2023-1-6','2023-6-9','First almadena Tailoring Shop',2,400,3,43)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','Second almadena Tailoring Shop',3,400,3,44)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,45)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,46)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,1,47)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,48)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,49)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,2,50)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,1,51)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,52)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,2,53)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,54)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,3,55)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,56)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','Second almadena Tailoring Shop',2,400,1,57)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,58)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,59)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,60)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,61)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,62)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,63)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,64)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,65)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,66)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','Second almadena Tailoring Shop',6,400,3,67)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,68)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,69)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,70)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,71)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,72)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,73)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,3,74)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,3,75)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,76)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,77)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,77)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','Second almadena Tailoring Shop',6,400,3,78)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,79)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,80)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,81)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,82)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,83)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,84)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,84)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,2,85)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,86)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,3)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,2,2)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,6)

INSERT INTO Bells VALUES('2023-1-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,3)
INSERT INTO Bells VALUES('2023-2-6','2023-6-9','First almadena Tailoring Shop',2,400,3,4)
INSERT INTO Bells VALUES('2023-4-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,6)
INSERT INTO Bells VALUES('2023-5-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,5)
INSERT INTO Bells VALUES('2023-6-6','2023-6-9','First almadena Tailoring Shop',2,400,3,7)
INSERT INTO Bells VALUES('2023-7-8','2023-6-6','First almadena Tailoring Shop',6,400,1,6)
INSERT INTO Bells VALUES('2023-8-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,8)
INSERT INTO Bells VALUES('2023-9-6','2023-6-9','First almadena Tailoring Shop',2,400,1,9)
INSERT INTO Bells VALUES('2023-2-8','2023-6-6','First almadena Tailoring Shop',6,400,1,10)
INSERT INTO Bells VALUES('2023-4-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,11)
INSERT INTO Bells VALUES('2023-5-6','2023-6-9','First almadena Tailoring Shop',2,400,1,12)
INSERT INTO Bells VALUES('2023-7-4','2023-6-5','therd almadena Tailoring Shop',3,400,3,13)
INSERT INTO Bells VALUES('2023-6-12','2023-6-9','First almadena Tailoring Shop',2,400,1,14)
INSERT INTO Bells VALUES('2023-4-8','2023-6-6','First almadena Tailoring Shop',6,400,1,16)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','Second almadena Tailoring Shop',3,400,2,15)
INSERT INTO Bells VALUES('2023-7-6','2023-6-9','First almadena Tailoring Shop',2,400,3,17)
INSERT INTO Bells VALUES('2023-8-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,18)
INSERT INTO Bells VALUES('2023-5-6','2023-6-9','First almadena Tailoring Shop',2,400,2,19)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,20)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,21)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,1,22)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,23)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,24)
INSERT INTO Bells VALUES('2023-5-6','2023-6-9','First almadena Tailoring Shop',2,400,2,25)
INSERT INTO Bells VALUES('2023-7-8','2023-6-6','Second almadena Tailoring Shop',6,400,2,26)
INSERT INTO Bells VALUES('2023-6-4','2023-6-5','First almadena Tailoring Shop',3,400,2,27)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,28)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,29)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,2,30)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,31)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,32)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,33)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,34)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,35)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','Second almadena Tailoring Shop',3,400,3,36)
INSERT INTO Bells VALUES('2023-3-7','2023-6-9','First almadena Tailoring Shop',2,400,3,37)
INSERT INTO Bells VALUES('2023-3-8','2023-6-5','therd almadena Tailoring Shop',3,400,3,38)
INSERT INTO Bells VALUES('2023-4-6','2023-6-9','First almadena Tailoring Shop',2,400,2,39)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,40)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,1,41)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,2,42)
INSERT INTO Bells VALUES('2023-1-6','2023-6-9','First almadena Tailoring Shop',2,400,3,43)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','Second almadena Tailoring Shop',3,400,3,44)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,45)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,1,46)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,1,47)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,48)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,3,49)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','therd almadena Tailoring Shop',3,400,2,50)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,1,51)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,52)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,2,53)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,54)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','therd almadena Tailoring Shop',2,400,3,55)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,2,56)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','Second almadena Tailoring Shop',2,400,1,57)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,58)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,59)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,60)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,61)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,62)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,63)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,64)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,65)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,66)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','Second almadena Tailoring Shop',6,400,3,67)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,68)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,69)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,70)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,71)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,72)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,73)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,3,74)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,3,75)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,76)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,77)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,77)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','Second almadena Tailoring Shop',6,400,3,78)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,79)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,1,80)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,3,81)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,82)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,2,83)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','therd almadena Tailoring Shop',6,400,2,84)
INSERT INTO Bells VALUES('2023-3-4','2023-6-5','First almadena Tailoring Shop',3,400,1,84)
INSERT INTO Bells VALUES('2023-3-6','2023-6-9','First almadena Tailoring Shop',2,400,2,85)
INSERT INTO Bells VALUES('2023-3-8','2023-6-6','First almadena Tailoring Shop',6,400,1,86)

select * from Bells






--#################################################### operation section #############################################

use [Taoloring_database]
---------------------------------        SELECT OPERATOR       ---------------------------------

select * from Employees

select Employees.Emp_Name,Employees.Emp_ID from Employees

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE emp_id = 2

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE Emp_salary = (select max( Emp_salary) from Employees)

SELECT Employees.emp_name,Emp_ID FROM Employees WHERE emp_id = 30

SELECT Employees.emp_name , emp_id,emp_salary,Emp_bra_Name,Employees.manager_idF FROM Employees WHERE emp_id = 34

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000 and
Emp_bra_Name = ' Second Almadena Tailoring Shop'or Emp_bra_Name = 'First Almadena Tailoring Shop'or Emp_bra_Name ='Therd Almadena Tailoring Shop'         --------------upper and lower case is not the problem

select * from Branches

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 2000 

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF,Employees.manager_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3 and Employees.manager_idF = 3 

SELECT Employees.emp_name,Employees.emp_salary FROM Employees 
WHERE emp_salary =(select max(emp_salary) from Employees)

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'First almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Secom almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Therd almadena Tailoring Shop'

select * from Branches

SELECT * FROM Employees WHERE emp_salary >6000 AND emp_salary<= 10000

SELECT * FROM Customers WHERE cus_name = 'AMRULLAH' OR  cus_name = 'FAZALRAHMAN' AND Cus_address   = 'First Almadena Tailoring Shop'

SELECT Employees.emp_name FROM Employees WHERE Employees.manager_idF = 3;

select * from Customers where Customers.feedback_idF= manag_idF

select * from Employees where Emp_ID = manager_idF

-----------------------------------  ORDER BY ---------------------------------------------


SELECT Employees.branch_idF ,Employees.emp_name FROM Employees ORDER BY Employees.emp_name ASC 

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees ORDER BY Employees.emp_name DESC 

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees ORDER BY Employees.Emp_ID ASC 

SELECT Employees.Emp_bra_Name ,Employees.emp_name,emp_salary FROM Employees ORDER BY Employees.emp_salary DESC 


SELECT Employees.Emp_bra_Name ,Employees.branch_idF, Employees.emp_name FROM Employees 
ORDER BY Employees.emp_name ASC 

----------------------      UPDATE SECTION     ----------------------------------

UPDATE Customers SET Cus_address = 'NULL' WHERE cus_id = 63

SELECT * FROM Customers WHERE Customers.Cus_ID = null

update Customers set Cus_address ='nanagarhar afghanistan' where Cus_ID = 63

select * from Customers where Cus_ID = 63


UPDATE Employees SET manager_idF = 1 WHERE Employees.emp_name = 'AHSAN';

update Employees set Emp_salary = 50000 where Emp_ID = 3

select * from Employees where Emp_ID = 3

DELETE FROM Customers WHERE cus_id = 3 

-----------------------------------     TOP SELECTING FROM A TABLE    ---------------------------

select Employees.Emp_Name,Emp_salary from Employees where Emp_salary = (select max(Emp_salary) from Employees);

select managers.Manag_Name,Managers.Manag_address,Managers.Manag_salary from Managers where 
Managers.Manag_salary = (select max(Manag_salary) from Managers)

SELECT TOP 1 emp_salary FROM Employees order by Emp_salary desc;            ---- very important 

SELECT TOP 1 Employees.emp_salary,Employees.emp_name,Emp_ID FROM Employees;

SELECT TOP 550 Employees.emp_salary,Employees.emp_name,Employees.branch_idF FROM Employees  -- i dont have more than 120 so its correct no problem

SELECT TOP 2 Employees.emp_salary,Employees.emp_name,Employees.Emp_address FROM Employees

SELECT TOP 2 * FROM Employees

SELECT TOP 4 * FROM Employees ORDER BY Employees.emp_name ASC

select * from Employees where Emp_gender = 'Female' order by Emp_Name asc

SELECT  * FROM Employees ORDER BY Employees.emp_salary DESC


-------------------------------   JOIN SECTION ---------------------------------

SELECT  Employees.emp_name,Customers.cus_name FROM Customers JOIN Employees ON 
Customers.employee_idF = Employees.emp_id;

select Employees.Emp_Name,Customers.Cus_Name from Customers full join Employees on 
Cus_ID = employee_idF
 
SELECT  * FROM Employees LEFT JOIN Customers ON emp_id = employee_idF

SELECT  * FROM Employees right JOIN Customers ON emp_id = employee_idF


SELECT  Employees.emp_name,Customers.cus_name FROM Customers LEFT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id



SELECT  Employees.emp_name,cus_name FROM Customers RIGHT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers INNER JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers FULL JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name ,Employees.emp_salary,Employees.branch_idF FROM Customers SELF JOIN Employees ON 
Employees.emp_id = Employees.branch_idF


---------------------------------   UNION CREATING SECTION -----------------------------------

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees UNION  ------ IT most HAVE EQUAL NUMBER OF EXPRESSIONS 
SELECT Customers.cus_id,Customers.cus_name FROM Customers

SELECT Employees.branch_idF,emp_name FROM Employees---TO SHOW THE ARE THAT IS CORRECR OR NOT 

SELECT * FROM Branches UNION   ---------------   THIS IS AN ERORR BECOUSE THE NUMBER OF EXPRESSIONS IS NOT EQUAL OF BRANCH AND Customers TABLE
SELECT * FROM Customers

SELECT Branches.Br_Name ,Branches.Br_manag_Name FROM Branches UNION 
SELECT Managers.Manag_Name,Managers.Manag_address FROM Managers UNION 
SELECT Customers.cus_name,Customers.Cus_address FROM Customers;

select Employees.Emp_Name,Emp_salary from Employees where Employees.Emp_Name = 'Ahmad'

---eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrooooooooooooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
select * from Employees

select max(Cus_id) from Customers

group by Cus_ID 

having count(Cus_ID)>5
order by count (Cus_ID)desc;


---eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrooooooooooooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr;

create view select_view as 
select * from Employees;

-----#########################################         COMPLET VIEW SECTION            #############################################

create view compelte_view as 

select * from Employees

-------------     total operation of view taht i can do every one of it 

select Employees.Emp_Name,Employees.Emp_ID from Employees

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE emp_id = 2

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE Emp_salary = (select max( Emp_salary) from Employees)

SELECT Employees.emp_name,Emp_ID FROM Employees WHERE emp_id = 30

SELECT Employees.emp_name , emp_id,emp_salary,Emp_bra_Name,Employees.manager_idF FROM Employees WHERE emp_id = 34

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000 and
Emp_bra_Name = ' Second Almadena Tailoring Shop'or Emp_bra_Name = 'First Almadena Tailoring Shop'or Emp_bra_Name ='Therd Almadena Tailoring Shop'         --------------upper and lower case is not the problem

select * from Branches

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 2000 

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF,Employees.manager_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3 and Employees.manager_idF = 3 

SELECT Employees.emp_name,Employees.emp_salary FROM Employees 
WHERE emp_salary =(select max(emp_salary) from Employees)

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'First almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Secom almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Therd almadena Tailoring Shop'

select * from Branches

SELECT * FROM Employees WHERE emp_salary >6000 AND emp_salary<= 10000

SELECT * FROM Customers WHERE cus_name = 'AMRULLAH' OR  cus_name = 'FAZALRAHMAN' AND Cus_address   = 'First Almadena Tailoring Shop'

SELECT Employees.emp_name FROM Employees WHERE Employees.manager_idF = 3


UPDATE Customers SET Cus_address = 'NULL' WHERE cus_id = 63

SELECT * FROM Customers WHERE Customers.Cus_ID = null

update Customers set Cus_address ='nanagarhar afghanistan' where Cus_ID = 63

select * from Customers where Cus_ID = 63


UPDATE Employees SET manager_idF = 1 WHERE Employees.emp_name = 'AHSAN';

update Employees set Emp_salary = 50000 where Emp_ID = 3

select * from Employees where Emp_ID = 3

DELETE FROM Customers WHERE cus_id = 3 

-----------------------------------     TOP SELECTING FROM A TABLE    ---------------------------

select Employees.Emp_Name,Emp_salary from Employees where Emp_salary = (select max(Emp_salary) from Employees);

select managers.Manag_Name,Managers.Manag_address,Managers.Manag_salary from Managers where 
Managers.Manag_salary = (select max(Manag_salary) from Managers)

SELECT TOP 1 emp_salary FROM Employees order by Emp_salary desc;            ---- very important 

SELECT TOP 1 Employees.emp_salary,Employees.emp_name,Emp_ID FROM Employees;

SELECT TOP 550 Employees.emp_salary,Employees.emp_name,Employees.branch_idF FROM Employees  -- i dont have more than 120 so its correct no problem

SELECT TOP 2 Employees.emp_salary,Employees.emp_name,Employees.Emp_address FROM Employees

SELECT TOP 2 * FROM Employees

SELECT TOP 4 * FROM Employees ORDER BY Employees.emp_name ASC

select * from Employees where Emp_gender = 'Female' order by Emp_Name asc

SELECT  * FROM Employees ORDER BY Employees.emp_salary DESC


-------------------------------   JOIN SECTION ---------------------------------

SELECT  Employees.emp_name,Customers.cus_name FROM Customers JOIN Employees ON 
Customers.employee_idF = Employees.emp_id;

select Employees.Emp_Name,Customers.Cus_Name from Customers full join Employees on 
Cus_ID = employee_idF
 
SELECT  * FROM Employees LEFT JOIN Customers ON emp_id = employee_idF

SELECT  * FROM Employees right JOIN Customers ON emp_id = employee_idF


SELECT  Employees.emp_name,Customers.cus_name FROM Customers LEFT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id



SELECT  Employees.emp_name,cus_name FROM Customers RIGHT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers INNER JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers FULL JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name ,Employees.emp_salary,Employees.branch_idF FROM Customers SELF JOIN Employees ON 
Employees.emp_id = Employees.branch_idF


---------------------------------   UNION CREATING SECTION -----------------------------------

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees UNION  ------ IT most HAVE EQUAL NUMBER OF EXPRESSIONS 
SELECT Customers.cus_id,Customers.cus_name FROM Customers

SELECT Employees.branch_idF,emp_name FROM Employees---TO SHOW THE ARE THAT IS CORRECR OR NOT 

SELECT * FROM Branches UNION   ---------------   THIS IS AN ERORR BECOUSE THE NUMBER OF EXPRESSIONS IS NOT EQUAL OF BRANCH AND Customers TABLE
SELECT * FROM Customers

SELECT Branches.Br_Name ,Branches.Br_manag_Name FROM Branches UNION 
SELECT Managers.Manag_Name,Managers.Manag_address FROM Managers UNION 
SELECT Customers.cus_name,Customers.Cus_address FROM Customers

-- ####################################################   end of view   #############################################



create procedure select_procedure  as 
select * from Employees;

----      complet operation of procedure  
create procedure select_from_bell as 

select * from Bells

create procedure order_procedure as 
SELECT Employees.Emp_bra_Name ,Employees.emp_name,emp_salary FROM Employees ORDER BY Employees.emp_salary DESC 


SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE emp_id = 2

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE Emp_salary = (select max( Emp_salary) from Employees)

SELECT Employees.emp_name,Emp_ID FROM Employees WHERE emp_id = 30

SELECT Employees.emp_name , emp_id,emp_salary,Emp_bra_Name,Employees.manager_idF FROM Employees WHERE emp_id = 34

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000 and
Emp_bra_Name = ' Second Almadena Tailoring Shop'or Emp_bra_Name = 'First Almadena Tailoring Shop'or Emp_bra_Name ='Therd Almadena Tailoring Shop'         --------------upper and lower case is not the problem

select * from Branches

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 2000 

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF,Employees.manager_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3 and Employees.manager_idF = 3 

SELECT Employees.emp_name,Employees.emp_salary FROM Employees 
WHERE emp_salary =(select max(emp_salary) from Employees)

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'First almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Secom almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Therd almadena Tailoring Shop'

select * from Branches

SELECT * FROM Employees WHERE emp_salary >6000 AND emp_salary<= 10000

SELECT * FROM Customers WHERE cus_name = 'AMRULLAH' OR  cus_name = 'FAZALRAHMAN' AND Cus_address   = 'First Almadena Tailoring Shop'

SELECT Employees.emp_name FROM Employees WHERE Employees.manager_idF = 3


UPDATE Customers SET Cus_address = 'NULL' WHERE cus_id = 63

SELECT * FROM Customers WHERE Customers.Cus_ID = null

update Customers set Cus_address ='nanagarhar afghanistan' where Cus_ID = 63

select * from Customers where Cus_ID = 63


UPDATE Employees SET manager_idF = 1 WHERE Employees.emp_name = 'AHSAN';

update Employees set Emp_salary = 50000 where Emp_ID = 3

select * from Employees where Emp_ID = 3

DELETE FROM Customers WHERE cus_id = 3 

-----------------------------------     TOP SELECTING FROM A TABLE    ---------------------------

select Employees.Emp_Name,Emp_salary from Employees where Emp_salary = (select max(Emp_salary) from Employees);

select managers.Manag_Name,Managers.Manag_address,Managers.Manag_salary from Managers where 
Managers.Manag_salary = (select max(Manag_salary) from Managers)

SELECT TOP 1 emp_salary FROM Employees order by Emp_salary desc;            ---- very important 

SELECT TOP 1 Employees.emp_salary,Employees.emp_name,Emp_ID FROM Employees;

SELECT TOP 550 Employees.emp_salary,Employees.emp_name,Employees.branch_idF FROM Employees  -- i dont have more than 120 so its correct no problem

SELECT TOP 2 Employees.emp_salary,Employees.emp_name,Employees.Emp_address FROM Employees

SELECT TOP 2 * FROM Employees

SELECT TOP 4 * FROM Employees ORDER BY Employees.emp_name ASC

select * from Employees where Emp_gender = 'Female' order by Emp_Name asc

SELECT  * FROM Employees ORDER BY Employees.emp_salary DESC


-------------------------------   JOIN SECTION ---------------------------------

SELECT  Employees.emp_name,Customers.cus_name FROM Customers JOIN Employees ON 
Customers.employee_idF = Employees.emp_id;

select Employees.Emp_Name,Customers.Cus_Name from Customers full join Employees on 
Cus_ID = employee_idF
 
SELECT  * FROM Employees LEFT JOIN Customers ON emp_id = employee_idF

SELECT  * FROM Employees right JOIN Customers ON emp_id = employee_idF


SELECT  Employees.emp_name,Customers.cus_name FROM Customers LEFT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id



SELECT  Employees.emp_name,cus_name FROM Customers RIGHT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers INNER JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers FULL JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name ,Employees.emp_salary,Employees.branch_idF FROM Customers SELF JOIN Employees ON 
Employees.emp_id = Employees.branch_idF


---------------------------------   UNION CREATING SECTION -----------------------------------

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees UNION  ------ IT most HAVE EQUAL NUMBER OF EXPRESSIONS 
SELECT Customers.cus_id,Customers.cus_name FROM Customers

SELECT Employees.branch_idF,emp_name FROM Employees---TO SHOW THE ARE THAT IS CORRECR OR NOT 

SELECT * FROM Branches UNION   ---------------   THIS IS AN ERORR BECOUSE THE NUMBER OF EXPRESSIONS IS NOT EQUAL OF BRANCH AND Customers TABLE
SELECT * FROM Customers

SELECT Branches.Br_Name ,Branches.Br_manag_Name FROM Branches UNION 
SELECT Managers.Manag_Name,Managers.Manag_address FROM Managers UNION 
SELECT Customers.cus_name,Customers.Cus_address FROM Customers



------------------------------------------------------------------
------------------------------------------------------------------

--------------------- operations ---------------------------------



--#################################################### operation section #############################################

use [Taoloring_database]
---------------------------------        SELECT OPERATOR       ---------------------------------

select * from Employees

select Employees.Emp_Name,Employees.Emp_ID from Employees

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE emp_id = 2

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE Emp_salary = (select max( Emp_salary) from Employees)

SELECT Employees.emp_name,Emp_ID FROM Employees WHERE emp_id = 30

SELECT Employees.emp_name , emp_id,emp_salary,Emp_bra_Name,Employees.manager_idF FROM Employees WHERE emp_id = 34

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000 and
Emp_bra_Name = ' Second Almadena Tailoring Shop'or Emp_bra_Name = 'First Almadena Tailoring Shop'or Emp_bra_Name ='Therd Almadena Tailoring Shop'         --------------upper and lower case is not the problem

select * from Branches

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 2000 

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF,Employees.manager_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3 and Employees.manager_idF = 3 

SELECT Employees.emp_name,Employees.emp_salary FROM Employees 
WHERE emp_salary =(select max(emp_salary) from Employees)

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'First almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Secom almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Therd almadena Tailoring Shop'

select * from Branches

SELECT * FROM Employees WHERE emp_salary >6000 AND emp_salary<= 10000

SELECT * FROM Customers WHERE cus_name = 'AMRULLAH' OR  cus_name = 'FAZALRAHMAN' AND Cus_address   = 'First Almadena Tailoring Shop'

SELECT Employees.emp_name FROM Employees WHERE Employees.manager_idF = 3


-----------------------------------  ORDER BY ---------------------------------------------


SELECT Employees.branch_idF ,Employees.emp_name FROM Employees ORDER BY Employees.emp_name ASC 

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees ORDER BY Employees.emp_name DESC 

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees ORDER BY Employees.Emp_ID ASC 

SELECT Employees.Emp_bra_Name ,Employees.emp_name,emp_salary FROM Employees ORDER BY Employees.emp_salary DESC 


SELECT Employees.Emp_bra_Name ,Employees.branch_idF, Employees.emp_name FROM Employees 
ORDER BY Employees.emp_name ASC 

----------------------      UPDATE SECTION     ----------------------------------

UPDATE Customers SET Cus_address = 'NULL' WHERE cus_id = 63

SELECT * FROM Customers WHERE Customers.Cus_ID = null

update Customers set Cus_address ='nanagarhar afghanistan' where Cus_ID = 63

select * from Customers where Cus_ID = 63


UPDATE Employees SET manager_idF = 1 WHERE Employees.emp_name = 'AHSAN';

update Employees set Emp_salary = 50000 where Emp_ID = 3

select * from Employees where Emp_ID = 3

DELETE FROM Customers WHERE cus_id = 3 

-----------------------------------     TOP SELECTING FROM A TABLE    ---------------------------

select Employees.Emp_Name,Emp_salary from Employees where Emp_salary = (select max(Emp_salary) from Employees);

select managers.Manag_Name,Managers.Manag_address,Managers.Manag_salary from Managers where 
Managers.Manag_salary = (select max(Manag_salary) from Managers)

SELECT TOP 1 emp_salary FROM Employees order by Emp_salary desc;            ---- very important 

SELECT TOP 1 Employees.emp_salary,Employees.emp_name,Emp_ID FROM Employees;

SELECT TOP 550 Employees.emp_salary,Employees.emp_name,Employees.branch_idF FROM Employees  -- i dont have more than 120 so its correct no problem

SELECT TOP 2 Employees.emp_salary,Employees.emp_name,Employees.Emp_address FROM Employees

SELECT TOP 2 * FROM Employees

SELECT TOP 4 * FROM Employees ORDER BY Employees.emp_name ASC

select * from Employees where Emp_gender = 'Female' order by Emp_Name asc

SELECT  * FROM Employees ORDER BY Employees.emp_salary DESC


-------------------------------   JOIN SECTION ---------------------------------

SELECT  Employees.emp_name,Customers.cus_name FROM Customers JOIN Employees ON 
Customers.employee_idF = Employees.emp_id;

select Employees.Emp_Name,Customers.Cus_Name from Customers full join Employees on 
Cus_ID = employee_idF
 
SELECT  * FROM Employees LEFT JOIN Customers ON emp_id = employee_idF

SELECT  * FROM Employees right JOIN Customers ON emp_id = employee_idF


SELECT  Employees.emp_name,Customers.cus_name FROM Customers LEFT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id



SELECT  Employees.emp_name,cus_name FROM Customers RIGHT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers INNER JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers FULL JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name ,Employees.emp_salary,Employees.branch_idF FROM Customers SELF JOIN Employees ON 
Employees.emp_id = Employees.branch_idF


---------------------------------   UNION CREATING SECTION -----------------------------------

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees UNION  ------ IT most HAVE EQUAL NUMBER OF EXPRESSIONS 
SELECT Customers.cus_id,Customers.cus_name FROM Customers

SELECT Employees.branch_idF,emp_name FROM Employees---TO SHOW THE ARE THAT IS CORRECR OR NOT 

SELECT * FROM Branches UNION   ---------------   THIS IS AN ERORR BECOUSE THE NUMBER OF EXPRESSIONS IS NOT EQUAL OF BRANCH AND Customers TABLE
SELECT * FROM Customers

SELECT Branches.Br_Name ,Branches.Br_manag_Name FROM Branches UNION 
SELECT Managers.Manag_Name,Managers.Manag_address FROM Managers UNION 
SELECT Customers.cus_name,Customers.Cus_address FROM Customers

---eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrooooooooooooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
select * from Employees

select max(Cus_id) from Customers

group by Cus_ID 

having count(Cus_ID)>5
order by count (Cus_ID)desc;


---eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrooooooooooooorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr;

create view select_view as 
select * from Employees;

-----#########################################         COMPLET VIEW SECTION            #############################################

create view compelte_view as 

select * from Employees

-------------     total operation of view taht i can do every one of it 

select Employees.Emp_Name,Employees.Emp_ID from Employees

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE emp_id = 2

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE Emp_salary = (select max( Emp_salary) from Employees)

SELECT Employees.emp_name,Emp_ID FROM Employees WHERE emp_id = 30

SELECT Employees.emp_name , emp_id,emp_salary,Emp_bra_Name,Employees.manager_idF FROM Employees WHERE emp_id = 34

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000 and
Emp_bra_Name = ' Second Almadena Tailoring Shop'or Emp_bra_Name = 'First Almadena Tailoring Shop'or Emp_bra_Name ='Therd Almadena Tailoring Shop'         --------------upper and lower case is not the problem

select * from Branches

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 2000 

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF,Employees.manager_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3 and Employees.manager_idF = 3 

SELECT Employees.emp_name,Employees.emp_salary FROM Employees 
WHERE emp_salary =(select max(emp_salary) from Employees)

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'First almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Secom almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Therd almadena Tailoring Shop'

select * from Branches

SELECT * FROM Employees WHERE emp_salary >6000 AND emp_salary<= 10000

SELECT * FROM Customers WHERE cus_name = 'AMRULLAH' OR  cus_name = 'FAZALRAHMAN' AND Cus_address   = 'First Almadena Tailoring Shop'

SELECT Employees.emp_name FROM Employees WHERE Employees.manager_idF = 3


UPDATE Customers SET Cus_address = 'NULL' WHERE cus_id = 63

SELECT * FROM Customers WHERE Customers.Cus_ID = null

update Customers set Cus_address ='nanagarhar afghanistan' where Cus_ID = 63

select * from Customers where Cus_ID = 63


UPDATE Employees SET manager_idF = 1 WHERE Employees.emp_name = 'AHSAN';

update Employees set Emp_salary = 50000 where Emp_ID = 3

select * from Employees where Emp_ID = 3

DELETE FROM Customers WHERE cus_id = 3 

-----------------------------------     TOP SELECTING FROM A TABLE    ---------------------------

select Employees.Emp_Name,Emp_salary from Employees where Emp_salary = (select max(Emp_salary) from Employees);

select managers.Manag_Name,Managers.Manag_address,Managers.Manag_salary from Managers where 
Managers.Manag_salary = (select max(Manag_salary) from Managers)

SELECT TOP 1 emp_salary FROM Employees order by Emp_salary desc;            ---- very important 

SELECT TOP 1 Employees.emp_salary,Employees.emp_name,Emp_ID FROM Employees;

SELECT TOP 550 Employees.emp_salary,Employees.emp_name,Employees.branch_idF FROM Employees  -- i dont have more than 120 so its correct no problem

SELECT TOP 2 Employees.emp_salary,Employees.emp_name,Employees.Emp_address FROM Employees

SELECT TOP 2 * FROM Employees

SELECT TOP 4 * FROM Employees ORDER BY Employees.emp_name ASC

select * from Employees where Emp_gender = 'Female' order by Emp_Name asc

SELECT  * FROM Employees ORDER BY Employees.emp_salary DESC


-------------------------------   JOIN SECTION ---------------------------------

SELECT  Employees.emp_name,Customers.cus_name FROM Customers JOIN Employees ON 
Customers.employee_idF = Employees.emp_id;

select Employees.Emp_Name,Customers.Cus_Name from Customers full join Employees on 
Cus_ID = employee_idF
 
SELECT  * FROM Employees LEFT JOIN Customers ON emp_id = employee_idF

SELECT  * FROM Employees right JOIN Customers ON emp_id = employee_idF


SELECT  Employees.emp_name,Customers.cus_name FROM Customers LEFT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id



SELECT  Employees.emp_name,cus_name FROM Customers RIGHT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers INNER JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers FULL JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name ,Employees.emp_salary,Employees.branch_idF FROM Customers SELF JOIN Employees ON 
Employees.emp_id = Employees.branch_idF


---------------------------------   UNION CREATING SECTION -----------------------------------

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees UNION  ------ IT most HAVE EQUAL NUMBER OF EXPRESSIONS 
SELECT Customers.cus_id,Customers.cus_name FROM Customers

SELECT Employees.branch_idF,emp_name FROM Employees---TO SHOW THE ARE THAT IS CORRECR OR NOT 

SELECT * FROM Branches UNION   ---------------   THIS IS AN ERORR BECOUSE THE NUMBER OF EXPRESSIONS IS NOT EQUAL OF BRANCH AND Customers TABLE
SELECT * FROM Customers

SELECT Branches.Br_Name ,Branches.Br_manag_Name FROM Branches UNION 
SELECT Managers.Manag_Name,Managers.Manag_address FROM Managers UNION 
SELECT Customers.cus_name,Customers.Cus_address FROM Customers

-- ####################################################   end of view   #############################################



create procedure select_procedure  as 
select * from Employees;

----      complet operation of procedure  
create procedure select_from_bell as 

select * from Bells

create procedure order_procedure as 
SELECT Employees.Emp_bra_Name ,Employees.emp_name,emp_salary FROM Employees ORDER BY Employees.emp_salary DESC 


SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE emp_id = 2

SELECT Employees.Emp_Name , emp_id,emp_salary FROM Employees WHERE Emp_salary = (select max( Emp_salary) from Employees)

SELECT Employees.emp_name,Emp_ID FROM Employees WHERE emp_id = 30

SELECT Employees.emp_name , emp_id,emp_salary,Emp_bra_Name,Employees.manager_idF FROM Employees WHERE emp_id = 34

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 40000 and
Emp_bra_Name = ' Second Almadena Tailoring Shop'or Emp_bra_Name = 'First Almadena Tailoring Shop'or Emp_bra_Name ='Therd Almadena Tailoring Shop'         --------------upper and lower case is not the problem

select * from Branches

SELECT Employees.emp_name , emp_id,emp_salary FROM Employees WHERE emp_salary = 2000 

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3

SELECT Employees.emp_name , emp_id,emp_salary,Employees.branch_idF,Employees.manager_idF FROM Employees
WHERE emp_salary = 2000 and Employees.branch_idF = 3 and Employees.manager_idF = 3 

SELECT Employees.emp_name,Employees.emp_salary FROM Employees 
WHERE emp_salary =(select max(emp_salary) from Employees)

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'First almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Secom almadena Tailoring Shop'

SELECT * FROM Employees WHERE Employees.Emp_bra_Name = 'Therd almadena Tailoring Shop'

select * from Branches

SELECT * FROM Employees WHERE emp_salary >6000 AND emp_salary<= 10000

SELECT * FROM Customers WHERE cus_name = 'AMRULLAH' OR  cus_name = 'FAZALRAHMAN' AND Cus_address   = 'First Almadena Tailoring Shop'

SELECT Employees.emp_name FROM Employees WHERE Employees.manager_idF = 3


UPDATE Customers SET Cus_address = 'NULL' WHERE cus_id = 63

SELECT * FROM Customers WHERE Customers.Cus_ID = null

update Customers set Cus_address ='nanagarhar afghanistan' where Cus_ID = 63

select * from Customers where Cus_ID = 63


UPDATE Employees SET manager_idF = 1 WHERE Employees.emp_name = 'AHSAN';

update Employees set Emp_salary = 50000 where Emp_ID = 3

select * from Employees where Emp_ID = 3

DELETE FROM Customers WHERE cus_id = 3 

-----------------------------------     TOP SELECTING FROM A TABLE    ---------------------------

select Employees.Emp_Name,Emp_salary from Employees where Emp_salary = (select max(Emp_salary) from Employees);

select managers.Manag_Name,Managers.Manag_address,Managers.Manag_salary from Managers where 
Managers.Manag_salary = (select max(Manag_salary) from Managers)

SELECT TOP 1 emp_salary FROM Employees order by Emp_salary desc;            ---- very important 

SELECT TOP 1 Employees.emp_salary,Employees.emp_name,Emp_ID FROM Employees;

SELECT TOP 550 Employees.emp_salary,Employees.emp_name,Employees.branch_idF FROM Employees  -- i dont have more than 120 so its correct no problem

SELECT TOP 2 Employees.emp_salary,Employees.emp_name,Employees.Emp_address FROM Employees

SELECT TOP 2 * FROM Employees

SELECT TOP 4 * FROM Employees ORDER BY Employees.emp_name ASC

select * from Employees where Emp_gender = 'Female' order by Emp_Name asc

SELECT  * FROM Employees ORDER BY Employees.emp_salary DESC


-------------------------------   JOIN SECTION ---------------------------------

SELECT  Employees.emp_name,Customers.cus_name FROM Customers JOIN Employees ON 
Customers.employee_idF = Employees.emp_id;

select Employees.Emp_Name,Customers.Cus_Name from Customers full join Employees on 
Cus_ID = employee_idF
 
SELECT  * FROM Employees LEFT JOIN Customers ON emp_id = employee_idF

SELECT  * FROM Employees right JOIN Customers ON emp_id = employee_idF


SELECT  Employees.emp_name,Customers.cus_name FROM Customers LEFT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id



SELECT  Employees.emp_name,cus_name FROM Customers RIGHT JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers INNER JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name,Customers.cus_name FROM Customers FULL JOIN Employees ON 
Customers.employee_idF = Employees.emp_id


SELECT  Employees.emp_name ,Employees.emp_salary,Employees.branch_idF FROM Customers SELF JOIN Employees ON 
Employees.emp_id = Employees.branch_idF


---------------------------------   UNION CREATING SECTION -----------------------------------

SELECT Employees.branch_idF ,Employees.emp_name FROM Employees UNION  ------ IT most HAVE EQUAL NUMBER OF EXPRESSIONS 
SELECT Customers.cus_id,Customers.cus_name FROM Customers

SELECT Employees.branch_idF,emp_name FROM Employees---TO SHOW THE ARE THAT IS CORRECR OR NOT 

SELECT * FROM Branches UNION   ---------------   THIS IS AN ERORR BECOUSE THE NUMBER OF EXPRESSIONS IS NOT EQUAL OF BRANCH AND Customers TABLE
SELECT * FROM Customers

SELECT Branches.Br_Name ,Branches.Br_manag_Name FROM Branches UNION 
SELECT Managers.Manag_Name,Managers.Manag_address FROM Managers UNION 
SELECT Customers.cus_name,Customers.Cus_address FROM Customers



---------------------------------------------------------------------
---------------------------------------------------------------------

------------------------------- another query -----------------------
use Taoloring_database;


create procedure beel_table as 
select  * from Bells

create procedure select_distinct as 
select distinct Bells.Bell_number , Bells.Bran_Name from Bells

select * from Customers 

create procedure update_procedure as 
update Customers set Cus_Name = 'update Name' where Cus_Name = 'Nazif' 


select * from Customers where Cus_Name = 'update Name'

create procedure delete_procedure as 
delete Customers where Cus_address = 'Mazar afghanistan' and Cus_ID = 4

create procedure insert_procedure as 
 insert into Customers values ('procedure','3428889','procedure value insertion'
,'proced',45,1,12)

select * from Customers where Cus_Name = 'procedure'

create procedure select_top_from_emp as 
select top  1 Employees.Emp_salary from Employees 

create procedure agregate_procedure as 
select max(Employees.Emp_salary) from Employees

create procedure agragete_2_procedure as 
select min(Employees.Emp_salary) from Employees

create procedure agragete_3_procedure as 
select count(Employees.Emp_salary) from Employees

create procedure total_count_of_branches as 
select count(Branches.Br_ID) from Branches
join 

create procedure agragete_4_procedure as 
select avg(Employees.Emp_salary) from Employees

create procedure agragete_5_procedure as 
select sum(Employees.Emp_salary) from Employees;

create procedure like_procedure as 
select Employees.Emp_Name from Employees 
where Emp_Name  like 'm%'

create procedure like_2_procedure as 
select * from Customers where Customers.Cus_Name like '%l' or
Customers.Cus_Name like 'l%' or Customers.Cus_Name like '%l%'

create procedure wilcard_procedure as 
select * from Employees where Emp_Name like '%nor%'

create procedure wilcard_2_procedure as 
select * from Employees where Emp_Name like '%li%'

create procedure in_operator_procedure as 
select * from Customers where Cus_address in ('Helmand afgahnistan',
'logar afghanistan')


create procedure in_operator_order_procedure as 
select * from Customers where Cus_address in ('Helmand afgahnistan',
'logar afghanistan') order by Cus_Name asc


create procedure in_operator_order2_procedure as 
select * from Customers where Cus_address in ('Helmand afgahnistan',
'logar afghanistan') order by Cus_address asc

create procedure in_operator_order3_procedure as 
select * from Customers where Cus_address in ('Helmand afgahnistan',
'logar afghanistan') order by Cus_Name desc

create procedure in_operator_order4_procedure as 
select * from Customers where Cus_address in ('Helmand afgahnistan',
'logar afghanistan') order by Cus_Name desc

create procedure between_procedure as 
select * from Employees where Emp_salary between 3000 and 30000

create procedure join_manag_name_procedure as 
select Managers.Manag_Name ,Branches.Br_ID from Managers full join Branches on 
Branches.Br_manag_Name = Manag_Name

select Managers.Manag_Name,Branches.Br_ID from Managers full join Branches on
Branches.Br_manag_Name = Manag_Name

create procedure total_count_of_branches as 
select count(Branches.Br_ID) from Branches
 full join Companies on 
Companies.Com_number = Branches.Br_ID


select Managers.Manag_Name ,Branches.Br_Name from Managers full join Branches
on Branches.Br_manag_Name = Manag_Name


select Count(Branches.Br_ID) from Branches;

create procedure mang_name_bran_name as 
select Branches.Br_Name ,Managers.Manag_Name from Branches inner join Managers
on Br_manag_Name = Manag_Name

select * from Branches
full join Company
on 


create procedure union_procedure as 
select Employees.Emp_Name ,Employees.Emp_address from Employees
union 
select Customers.Cus_Name,Customers.Cus_address from Customers

create procedure having_procedure as 
select count(Customers.Cus_ID),Customers.Cus_address from Customers
group by Cus_address 
having count(Cus_ID)>1 order by count (Cus_ID) desc;

--33333333333333333333 important 33333333333333333333
create procedure dynamic_procedure
@Br_Name varchar(50),
@Br_address varchar (max),
@Br_manag_Name varchar(50),
@Com_numF int
as 
insert into Branches( Br_Name,Br_address,Br_manag_Name,Com_numF) values(
@Br_Name ,
@Br_address ,
@Br_manag_Name ,
@Com_numF
);

 execute dynamic_procedure 
@Br_Name = 'fourth almadena tailoring shop',
@Br_address = 'jalal abad afghanistan',
@Br_manag_Name = 'abdul wali',
@Com_numF = 1;


create procedure dynamic_pro_of_emp 
@Emp_Name varchar (50),
@Emp_gender varchar (50),
@Emp_phone varchar(10),
@Emp_job_stat_date date,
@Emp_address varchar(max),
@Emp_bra_Name varchar(50),
@Emp_salary decimal,
@branch_idF int,
@manager_idF int
as 
insert into Employees values(
@Emp_Name,
@Emp_gender,
@Emp_phone,
@Emp_job_stat_date ,
@Emp_address ,
@Emp_bra_Name,
@Emp_salary ,
@branch_idF ,
@manager_idF  
)

execute dynamic_pro_of_emp 
@Emp_Name = 'procedure',
@Emp_gender='nie',
@Emp_phone = '38728433',
@Emp_job_stat_date = '2023-2-5',
@Emp_address = 'proced',
@Emp_bra_Name= 'first branch ',
@Emp_salary = 8345,
@branch_idF =1,
@manager_idF =1
