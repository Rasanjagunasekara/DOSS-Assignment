--Create Roles
CREATE ROLE C##system_admin;
CREATE ROLE C##manager;
CREATE  ROLE C##executive;

--Create Users
CREATE USER C##system_admin1 IDENTIFIED BY Admin123;
CREATE USER C##manger1 IDENTIFIED BY manager111;
CREATE USER C##manager2 IDENTIFIED BY manager222;
CREATE USER C##manager3 IDENTIFIED BY manager333;
CREATE USER C##executive1 IDENTIFIED BY Executive111;
CREATE USER C##executive2 IDENTIFIED BY Executive222;

--Granting User to role
GRANT C##system_admin TO C##system_admin1;
GRANT C##manager to C##Manger1, C##manager2, C##manager3;
GRANT c##executive to c##executive1, c##executive2;

--GRANT Permission to System admin
GRANT connect,DBA,resource TO c##system_admin;
GRANT CREATE SESSION TO C##system_admin;

GRANT CREATE ANY TABLE TO C##system_admin; -- Allows the user to create tables in any schema

GRANT ALTER ANY TABLE TO C##system_admin; -- Allows the user to alter tables in any schema

GRANT DROP ANY TABLE TO C##system_admin; -- Allows the user to drop tables in any schema
GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO C##system_admin1;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO C##system_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Salary TO C##system_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON Jobs TO C##system_admin;
GRANT SELECT, INSERT, UPDATE, DELETE ON JobHistory TO C##system_admin;


-- Grant necessary object permissions to the Manager role
GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO C##manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO C##manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Salary TO C##manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Jobs TO C##manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON JobHistory TO C##manager;

-- Grant necessary object permissions to the Executive role
GRANT SELECT ON Department TO c##executive;
GRANT SELECT ON Employee TO c##executive;
GRANT SELECT ON Salary TO c##executive;
GRANT SELECT ON Jobs TO c##executive;
GRANT SELECT ON JobHistory TO c##executive;

-- Create Tables (Executed by dbadmin)

CREATE TABLE Department(
	DepartmentID int,
	DepartmentNname varchar(20),
	constraint Department_PK PRIMARY KEY(DepartmentID));

CREATE TABLE Employee (
    EmployeeID CHAR(8),
    Firstname VARCHAR(20),
    Lastname VARCHAR(20),
    Email VARCHAR(256),
    Employee_Address VARCHAR(50),
    DateOfBirth DATE,
    DepartmentID INT, 
    Primary_phone VARCHAR(20),
    Gender VARCHAR(10), 
    CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID),
    CONSTRAINT Employee_FK FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


CREATE TABLE Salary(
	Sal_Ref varchar(10),
	SalaryAmount int,
	EmployeeID char(8),
	Paid_date date,
	constraint Salary_PK PRIMARY KEY(Sal_Ref,EmployeeID),
	constraint Salary_FK FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
    );


CREATE TABLE Jobs(
      JobID int,
	  JobTitle varchar(20),
	  EmployeeID char(8),
	  JobDescription varchar(200),
	  constraint Job_PK PRIMARY KEY(JobID),
	  constraint JobID_FK FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID));



create table JobHistory(
	  JobHistoryID char(10),
      Pre_JobTitle varchar(20),
	  EmployeeID char(8),
	  StartDate date,
	  EndDate date,
	  constraint JobHistory_PK PRIMARY KEY (EmployeeID,JobHistoryID),
	  constraint JobHistory_FK FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID));


--Inserting VALUES to the tables

INSERT INTO Employee VALUES('EMP001', 'John', 'Wick', 'john.wick@outlook.com', '123 Main St, City', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 1, 1234567890, 'Male');
INSERT INTO Employee VALUES('EMP002', 'Will', 'Smith', 'will.smith@outlook.com', '456 Elm St, Town', TO_DATE('1988-08-25', 'YYYY-MM-DD'), 2, 9876543210, 'Female');
INSERT INTO Employee VALUES('EMP003', 'Michael', 'Jackson', 'michael.jackson@outlook.com', '789 Oak St, Village', TO_DATE('1995-02-10', 'YYYY-MM-DD'), 1, 5555555555, 'Male');
INSERT INTO Employee VALUES('EMP004', 'Chris', 'Brown', 'chris.brown@outlook.com', '321 Pine St, Suburb', TO_DATE('1992-11-30', 'YYYY-MM-DD'), 3, 7777777777, 'Female');
INSERT INTO Employee VALUES('EMP005', 'William', 'Lee', 'william.lee@outlook.com', '654 Birch St, City', TO_DATE('1994-07-18', 'YYYY-MM-DD'), 2, 9999999999, 'Male');
INSERT INTO Employee VALUES('EMP006', 'Harry', 'Wilson', 'harry.wilson@outlook.com', '987 Cedar St, Town', TO_DATE('1986-04-03', 'YYYY-MM-DD'), 1, 8888888888, 'Female');
INSERT INTO Employee VALUES('EMP007', 'Daniel', 'Martinez', 'daniel.martinez@outlook.com', '741 Elm St, Village', TO_DATE('1991-09-20', 'YYYY-MM-DD'), 3, 6666666666, 'Male');
INSERT INTO Employee VALUES('EMP008', 'Olivia', 'Davis', 'olivia.davis@outlook.com', '852 Oak St, Suburb', TO_DATE('1989-12-12', 'YYYY-MM-DD'), 2, 4444444444, 'Female');
INSERT INTO Employee VALUES('EMP009', 'James', 'Watson', 'james.watson@outlook.com', '963 Maple St, City', TO_DATE('1987-06-05', 'YYYY-MM-DD'), 1, 2222222222, 'Male');
INSERT INTO Employee VALUES('EMP010', 'Ava', 'Max', 'ava.max@outlook.com', '456 Pine St, Town', TO_DATE('1993-03-08', 'YYYY-MM-DD'), 2, 1111111111, 'Female');
INSERT INTO Employee VALUES('EMP010', 'Yasas', 'Wickramasinghe', 'yasas.wickramasinghe@outlook.com', '58 Kottawa, Panadura', TO_DATE('2001-12-17', 'YYYY-MM-DD'), 1, 1111111124, 'Male');
INSERT INTO Employee VALUES('EMP010', 'Malmi', 'Rodrigo', 'Malmi.Gunasekara@outlook.com', '56 Dehiwala, Town', TO_DATE('2001-03-08', 'YYYY-MM-DD'), 5, 1315361111, 'Female');
INSERT INTO Employee VALUES('EMP010', 'Rasanja', 'Perera', 'rasanja.perera.com', '43 Katbadde, Townhall', TO_DATE('1999-05-08', 'YYYY-MM-DD'), 9, 1205361811, 'Female');
INSERT INTO Employee VALUES('EMP010', 'Shevon', 'Weerasinghe', 'shevon.weerasinghe@outlook.com', '29 Watelappela, Moratuwa', TO_DATE('2001-08-13', 'YYYY-MM-DD'), 6, 4191151524, 'Male');

INSERT INTO Department VALUES(1, 'Human Resources');
INSERT INTO Department VALUES(2, 'Finance');
INSERT INTO Department VALUES(3, 'Marketing');
INSERT INTO Department VALUES(4, 'IT');
INSERT INTO Department VALUES(5, 'Operations');
INSERT INTO Department VALUES(6, 'Sales');
INSERT INTO Department VALUES(7, 'Customer Service');
INSERT INTO Department VALUES(8, 'Research Development');
INSERT INTO Department VALUES(9, 'Legal');
INSERT INTO Department VALUES(10, 'Administration');

INSERT INTO Salary VALUES('SAL001', 60000, 'EMP001', TO_DATE('2023-01-15','YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL002', 55000, 'EMP002', TO_DATE('2023-01-15','YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL003', 75000, 'EMP003', TO_DATE('2023-01-15','YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL004', 65000, 'EMP004', TO_DATE('2023-01-15','YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL005', 70000, 'EMP005', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL006', 60000, 'EMP006', TO_DATE('2023-01-15' ,'YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL007', 80000, 'EMP007', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL008', 70000, 'EMP008', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL009', 65000, 'EMP009', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Salary VALUES('SAL010', 75000, 'EMP010', TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO Jobs VALUES(1, 'Manager', 'EMP001', 'Manage HR department and staff');
INSERT INTO Jobs VALUES(2, 'Financial Analyst', 'EMP002', 'Financial data analysis and reporting');
INSERT INTO Jobs VALUES(3, 'Marketing Coordinat', 'EMP003', 'Assist in marketing campaigns');
INSERT INTO Jobs VALUES(4, 'IT Specialist', 'EMP004', 'Provide IT support and maintenance');
INSERT INTO Jobs VALUES(5, 'Operations Manager', 'EMP005', 'Oversee day-to-day operations');
INSERT INTO Jobs VALUES(6, 'Sales Representative', 'EMP006', 'Sales and customer relations');
INSERT INTO Jobs VALUES(7, 'Customer Agent', 'EMP007', 'Assist customers with inquiries');
INSERT INTO Jobs VALUES(8, 'Software Developer', 'EMP008', 'Develop software applications');
INSERT INTO Jobs VALUES(9, 'Research Scientist', 'EMP009', 'Conduct research experiments');
INSERT INTO Jobs VALUES(10, 'Legal Counsel', 'EMP010', 'Provide legal advice and support');

INSERT INTO JobHistory VALUES('JH001', 'HR Assistant', 'EMP001', TO_DATE('2020-02-15','YYYY-MM-DD'), TO_DATE('2022-05-20','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH002', 'Accounting Clerk', 'EMP002', TO_DATE('2019-04-10','YYYY-MM-DD'), TO_DATE('2021-08-15','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH003', 'Marketing Intern', 'EMP003', TO_DATE('2021-01-03','YYYY-MM-DD'), TO_DATE('2023-02-28','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH004', 'IT Supporter', 'EMP004', TO_DATE('2018-07-22','YYYY-MM-DD'), TO_DATE('2022-11-30','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH005', 'Operations Coordinat', 'EMP005', TO_DATE('2019-09-18','YYYY-MM-DD'), TO_DATE('2023-04-10','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH006', 'Sales Associate', 'EMP006', TO_DATE('2017-03-05','YYYY-MM-DD'), TO_DATE('2022-07-12','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH007', 'Customer Representat', 'EMP007', TO_DATE('2020-11-15','YYYY-MM-DD'), TO_DATE('2023-03-22','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH008', 'Software Engineer', 'EMP008', TO_DATE('2018-05-12','YYYY-MM-DD'), TO_DATE('2023-01-25','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH009', 'Research Assistant', 'EMP009', TO_DATE('2019-08-20','YYYY-MM-DD'), TO_DATE('2022-12-05','YYYY-MM-DD'));
INSERT INTO JobHistory VALUES('JH010', 'Legal Assistant', 'EMP010', TO_DATE('2020-01-10','YYYY-MM-DD'), TO_DATE('2023-06-30','YYYY-MM-DD'));

select *from Employee;

select *from Department;

select *from Jobs;

select *from JobHistory;


-- Creating a view for managers to view employee salary

CREATE OR REPLACE VIEW ManagerView AS
SELECT E.EmployeeID, E.Firstname, E.Lastname, E.Email, E.DateOfBirth, E.DepartmentID, E.Primary_phone, E.Gender, S.SalaryAmount, S.Paid_date
FROM Employee E
JOIN Salary S ON E.EmployeeID = S.EmployeeID
JOIN Jobs J ON E.EmployeeID = J.EmployeeID
WHERE J.JobTitle = 'Manager';

-- Granting viewing permisions to view to the role Manager

GRANT SELECT ON ManagerView TO C##manager;

-- Querying the ManagerView to see the data
SELECT * FROM ManagerView;

-- Create a procedure to hash all emails
CREATE OR REPLACE PROCEDURE HashEmails AS
BEGIN
    FOR r IN (SELECT EmployeeID, Email FROM Employee) LOOP
        UPDATE Employee
        SET Email = DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(r.Email, 'AL32UTF8'), DBMS_CRYPTO.HASH_SH256)
        WHERE EmployeeID = r.EmployeeID;
    END LOOP;
    COMMIT;
END HashEmails;

-- Executing the procedure HashEmails
BEGIN
    HashEmails;
END;

--Viewing the hash all emails
SELECT EmployeeID, Email FROM Employee;

-- Encrypting primary phone numbers of all employees inside the Employee table

CREATE OR REPLACE PROCEDURE EncryptPrimaryPhone AS 
BEGIN
    FOR r in (SELECT EmployeeID, Primary_phone FROM Employee) LOOP
        UPDATE Employee
        SET Primary_phone = DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(r.Primary_phone, 'AL32UTF8'), DBMS_CRYPTO.HASH_SH256)
        WHERE EmployeeID = r.EmployeeID;
    END LOOP;
    COMMIT;
END EncryptPrimaryPhone;

-- Viewing the Encrypting primary phone numbers of all employees inside the Employee table
SELECT EmployeeID, Primary_phone FROM Employee WHERE ROWNUM <= 10;


-- Masking employee's primary phone numbers
BEGIN
   DBMS_REDACT.ADD_POLICY(
     object_schema        => 'C##system_admin1',
     object_name          => 'Employee',
     column_name          => 'Primary_phone',
     policy_name          => 'MaskingPrimaryPhone',
     function_type        => DBMS_REDACT.FULL,
     expression           => 'SYS_CONTEXT(''SYS_SESSION_ROLES'',''C##executive1'') = ''TRUE''');
END;

-- Implimenting FGA Policy
BEGIN
  DBMS_FGA.ADD_POLICY(
    object_schema => 'C##system_admin1',
    object_name   => 'Employee',
    policy_name   => 'MaskingPrimaryPhone',
    statement_types => 'UPDATE, DELETE, SELECT',
    audit_trail   => DBMS_FGA.DB + DBMS_FGA.EXTENDED
  );
END;




