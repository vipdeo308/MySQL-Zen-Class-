-- CREATE DATABASE zen_class;
-- USE zen_class;

--  Building the Database --

CREATE TABLE users(
   email VARCHAR(30),
   paswd VARCHAR(30),
   fname VARCHAR(30),
   lname VARCHAR(30),
   PRIMARY KEY (email)
);

INSERT INTO users VALUES
('vipul@ymail.com','12345678','Vipul','Deorani'),
('charu@gmail.com','11223344','Shreya','Deorani'),
('lavi@gmail.com','10120230','Rakshita','kainthola');

CREATE TABLE code_kata(
    concept VARCHAR(30),
    maxc INTEGER(10),
    total INTEGER(3),
    PRIMARY KEY (concept)
);

INSERT INTO code_kata VALUES
('Basics',1570,41),
('Array',16310,308),
('Strings',10040,196);

CREATE TABLE solved (
    concept VARCHAR(30),
    email  VARCHAR(30),
    coins INTEGER(3),
    num INTEGER(3),
    FOREIGN KEY (concept) REFERENCES code_kata(concept),
    FOREIGN KEY (email) REFERENCES users(email)
);

INSERT INTO solved VALUES
('Basics','vipul@ymail.com',360,12),
('Array','vipul@ymail.com',0,0),
('Strings','vipul@ymail.com',0,0),
('Basics','charu@gmail.com',400,20),
('Array','charu@gmail.com',600,30),
('Strings','charu@gmail.com',800,40),
('Basics','lavi@gmail.com',200,10),
('Array','lavi@gmail.com',400,20),
('Strings','lavi@gmail.com',600,30);

CREATE TABLE topics(
    num INTEGER(2),
    heading VARCHAR(30),
    contents VARCHAR(1024),
    pre_read VARCHAR(1024),
    PRIMARY KEY (num)
);

INSERT INTO topics VALUES
(1,'Introduction to Browser & web','Introduction to web Browser Wars DOM tree CSSOM tree,
Browser internals - HTML parser,
CSS parser,  JavaScript V8 engine, 
internals IP – MAC address – Ports & Evolution of HTTP,
HTTP Methods
How the Server looks at the URL
Request & Response cycle','No preread available'),
(10,'HTML & CSS','Intro to pseudo-classes (link, visited,hover, active)
box model: padding, margin, border 
Grid
Flex - display, direction, wrap, flex-flow, justify-content, align-content
position property: fixed, static, relative, absolute, sticky
parent inherit 
gradient','https://rvsp.github.io/CSS/
https://web.dev/learn/css/
https://css-tricks.com/
https://github.com/rvsp/html-CSS/'),
(20,'Async programming','Recap of callback, Promise Topics','No preread available');

CREATE TABLE class(
    cname VARCHAR(30),
    topic INTEGER(2),
    class_date DATE,
    beg_time TIME,
    end_time TIME,
    PRIMARY KEY (cname),
    FOREIGN KEY (topic) REFERENCES topics(num)
);

INSERT INTO class VALUES
('HTML and CSS',10,'2024-02-06','10:00','13:00'),
('Javascript',1,'2024-01-03','10:00','12:30');

CREATE TABLE attendance(
    class VARCHAR(30),
    user VARCHAR(30),
    present BOOLEAN,
    FOREIGN KEY (class) REFERENCES class(cname),
    FOREIGN KEY (user) REFERENCES users(email)
);

INSERT INTO attendance VALUES
('HTML and CSS','vipul@ymail.com',TRUE),
('HTML and CSS','charu@gmail.com',FALSE),
('HTML and CSS','lavi@gmail.com',TRUE),
('Javascript','vipul@ymail.com',FALSE),
('Javascript','charu@gmail.com',TRUE),
('Javascript','lavi@gmail.com',FALSE);

CREATE TABLE tasks(
    id INTEGER(2),
    topic INTEGER(2),
    stmt VARCHAR(30),
    PRIMARY KEY (id),
    FOREIGN KEY (topic) REFERENCES topics(num)
);

INSERT INTO tasks VALUES
(1,1,'https://www.google.com'),
(2,20,'https://www.wikipedia.org');

CREATE TABLE submits(
    task INTEGER(2),
    link VARCHAR(30),
    FOREIGN KEY (task) REFERENCES tasks(id)
);

INSERT INTO submits VALUES
(1,'https://dc.fandom.com'),
(2,'https://marvel.fandom.om');

CREATE TABLE company_drives(
    company VARCHAR(30),
    vacancies INTEGER,
    PRIMARY KEY (company)
);

INSERT INTO company_drives VALUES
('Google',10),
('Microsoft',15),
('Infosys',20),
('Yahoo',25),
('Wipro',30),
('T.C.S.',35);

CREATE TABLE hires(
    company VARCHAR(30),
    student VARCHAR(30),
    FOREIGN KEY (company) REFERENCES company_drives(company),
    FOREIGN KEY (student) REFERENCES users(email)
);

INSERT INTO hires VALUES
('Google','vipul@ymail.com'),
('Microsoft','charu@gmail.com'),
('Microsoft','lavi@gmail.com');

CREATE TABLE mentors(
   email VARCHAR(30),
   paswd VARCHAR(30),
   fname VARCHAR(30),
   lname VARCHAR(30),
   PRIMARY KEY (email)
);

INSERT INTO mentors VALUES
('poonam@gmail.com','87654321','Poonam','Chauhan'),
('mukul@gmail.com','44332211','Mukul','Negi');

CREATE TABLE teaches(
    mentor VARCHAR(30),
    mentee VARCHAR(30),
    FOREIGN KEY (mentor) REFERENCES mentors(email),
    FOREIGN KEY (mentee) REFERENCES users(email)
);

INSERT INTO teaches VALUES
('mukul@gmail.com','vipul@ymail.com'),
('poonam@gmail.com','charu@gmail.com'),
('poonam@gmail.com','lavi@gmail.com');
