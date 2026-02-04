create database rmsdb;

use rmsdb

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ENUM Tables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

create table skills(
    skill_id int auto_increment primary key,
    skill char(50) not null
);

INSERT INTO skills (skill) VALUES
('Communication'),
('Teamwork'),
('Leadership'),
('Time Management'),
('Problem Solving'),
('Critical Thinking'),
('Adaptability'),
('Creativity'),
('Conflict Resolution'),
('Public Speaking'),
('Presentation Skills'),
('Negotiation'),
('Emotional Intelligence'),
('Work Ethic'),
('Decision Making'),
('Interpersonal Skills'),
('Multitasking'),
('Self-Motivation'),
('Project Management'),
('Customer Service');


INSERT INTO skills (skill) VALUES
-- Programming Languages
('Java'),
('Python'),
('C'),
('C++'),
('JavaScript'),
('TypeScript'),
('Go'),
('Kotlin'),
('Swift'),
('PHP'),
('Ruby'),

-- Web Development
('HTML'),
('CSS'),
('Bootstrap'),
('React.js'),
('Angular'),
('Vue.js'),
('Node.js'),
('Express.js'),
('Next.js'),
('Tailwind CSS'),

-- Backend & Databases
('SQL'),
('MySQL'),
('PostgreSQL'),
('MongoDB'),
('Firebase'),
('Oracle'),
('Redis'),

-- DevOps & Cloud
('Docker'),
('Kubernetes'),
('AWS'),
('Microsoft Azure'),
('Google Cloud Platform'),
('CI/CD Pipelines'),
('Git'),
('GitHub'),
('Jenkins'),

-- Mobile App Development
('React Native'),
('Flutter'),
('Android Development'),
('iOS Development'),

-- Data Science & Analytics
('Machine Learning'),
('Deep Learning'),
('Data Analysis'),
('Pandas'),
('NumPy'),
('Matplotlib'),
('Power BI'),
('Tableau'),

-- Cybersecurity
('Ethical Hacking'),
('Network Security'),
('Penetration Testing'),
('SIEM Tools'),
('Kali Linux'),

-- Miscellaneous Tech
('Figma'),
('Canva'),
('Photoshop'),
('WordPress'),
('Shopify'),
('Blockchain'),
('Web3.js'),
('Solidity'),
('Metamask'),
('Unity 3D'),
('AR/VR Development');


create table contact_types(
    contact_type_id int auto_increment primary key ,
    type char(25) not null 
);


create table unit_types(
    unit_type_id int auto_increment primary key, 
    type char(15) not null
);


create table companies(
    company_id int auto_increment primary key,
    name char(75) not null ,
    email char(255) not null unique,
    password char(255) not null ,
    contact char(10) not null unique,
    website char(100) unique , 
    address varchar(500), 
    profile_pic char(255),
    bannner char(255),
    established_on int, 
    description varchar(1000),
    mission varchar(1000),
    vision varchar(1000)
);


create table qualifications (
    qualification_id int auto_increment primary key,
    qualification char(20) not null
);
INSERT INTO qualifications (qualification) VALUES
('High School Diploma'),
('Intermediate / 12th Pass'),
('Diploma in Engineering'),
('Associate Degree'),
('Bachelor of Arts (BA)'),
('Bachelor of Science (BSc)'),
('Bachelor of Commerce (BCom)'),
('Bachelor of Computer Applications (BCA)'),
('Bachelor of Technology (BTech)'),
('Bachelor of Engineering (BE)'),
('Bachelor of Business Administration (BBA)'),
('Bachelor of Fine Arts (BFA)'),
('Bachelor of Pharmacy (BPharma)'),
('Bachelor of Architecture (BArch)'),
('Master of Arts (MA)'),
('Master of Science (MSc)'),
('Master of Commerce (MCom)'),
('Master of Computer Applications (MCA)'),
('Master of Technology (MTech)'),
('Master of Engineering (ME)'),
('Master of Business Administration (MBA)'),
('Master of Fine Arts (MFA)'),
('Master of Pharmacy (MPharma)'),
('Doctor of Philosophy (PhD)'),
('Doctor of Medicine (MD)'),
('Chartered Accountant (CA)'),
('Company Secretary (CS)'),
('Certified Management Accountant (CMA)'),
('Certified Public Accountant (CPA)'),
('Law (LLB)'),
('Master of Laws (LLM)'),
('Post Graduate Diploma'),
('ITI Certification'),
('Vocational Training Certificate');



create table states (
    state_id int auto_increment primary key, 
    state char(100) not null
);

INSERT INTO states (state) VALUES
('Andhra Pradesh'),
('Arunachal Pradesh'),
('Assam'),
('Bihar'),
('Chhattisgarh'),
('Goa'),
('Gujarat'),
('Haryana'),
('Himachal Pradesh'),
('Jharkhand'),
('Karnataka'),
('Kerala'),
('Madhya Pradesh'),
('Maharashtra'),
('Manipur'),
('Meghalaya'),
('Mizoram'),
('Nagaland'),
('Odisha'),
('Punjab'),
('Rajasthan'),
('Sikkim'),
('Tamil Nadu'),
('Telangana'),
('Tripura'),
('Uttar Pradesh'),
('Uttarakhand'),
('West Bengal');


create table status(
    status_id int auto_increment primary key, 
    status char(20) not null 
);
insert into status(status) values ('Active'),('closed'),('Applied'),('Shortlisted'),('Interview Scheduled'),('Rejected'),('OnHold'),('Hired')


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



create table candidates(
    candidate_id int auto_increment primary key,
    name char(55) not null,
    email char(255) not null unique,
    password char(255) not null ,
    address varchar(500),
    contact char(10),
    logo char(255),
    status_id int not null default 2,
    activation_code char(255),
    whatsapp char(10) unique,
    gender char(1),
    linked_in char(100) unique,
    github char(100) unique,
    dob date,
    constraint fk_candidates_status foreign key (status_id) references status (status_id)
);

create table candidate_qualifications(
    candidate_qualification_id int auto_increment primary key ,
    candidate_id int not null,
    qualification_id int not null , 
    organization_name char(70) not null, 
    university_board char(70) not null,
    year_of_passing int not null,
    score float not null ,
    unit_type_id int not null ,
    constraint fk_candidate_qualifications_candidates foreign key (candidate_id) references candidates (candidate_id),
    constraint fk_candidate_qualifications_qualifications foreign key(qualification_id) references qualifications (qualification_id),
    constraint fk_candidate_qualifications_unit_types foreign key (unit_type_id) references unit_types (unit_type_id)
);

create table experiences(
    eperience_id int auto_increment primary key,
    candidate_id int not null,
    company_name char(70) not null, 
    joining_date date not null , 
    relieving_date date , 
    ctc int , 
    designation char(35) not null,
    roles_responsibilities varchar(1000),
    constraint fk_experiences_candidates foreign key (candidate_id) references candidates (candidate_id)

);



create table contacts (
    contact_id int auto_increment primary key, 
    candidate_id int not null, 
    contact_type_id int not null ,
    address varchar(500),
    contact char(10),
    link char(100),
    constraint fk_contacts_candidates foreign key (candidate_id) references candidates (candidate_id),
    constraint fk_contacts_contact_types foreign key (contact_type_id) references contact_types (contact_type_id)
);

create table candidate_skills(
    candidate_skill_id int auto_increment primary key , 
    candidate_id int not null, 
    skill_id int not null,
    constraint fk_candidate_skills_candidates foreign key (candidate_id) references candidates (candidate_id),
    constraint fk_candidate_skills_skills foreign key (skill_id) references skills (skill_id)

);




#########################################################################################################




create table job_posts(
    job_post_id int auto_increment primary key , 
    company_id int not null , 
    job_title char(100) not null, 
    post_date date not null , 
    qualification_id int not null ,
    experience int not null,
    description varchar(1000) not null ,
    salary int ,
    city_id int not null ,
    status_id int not null ,
    constraint fk_job_posts_companies foreign key (company_id) references companies (company_id),
    constraint fk_job_posts_cities foreign key (city_id) references cities (city_id),
    constraint fk_job_posts_status foreign key (status_id) references status (status_id)

    alter table job_posts add column min_experience int not null after post_date,
    alter table job_posts add column ctc int after min_experience,
    alter table job_posts change column qualifications qualification_id int not null,

        constraint fk_job_posts_qualifications foreign key (qualification_id) references qualifications (qualification_id),

    alter table job _posts change column skills skill_id int not null,
    constraint foreign key (skill_id) references skills (skill_id),

);

alter table job_posts add column deadline date not null after post_date;
alter table job_posts add column qualifications varchar(1000) not null after description;
alter table job_posts add column skills varchar(1000) not null after qualifications;
alter table job_posts add column job_type char(20) not null after skills default 'Full Time';
alter table job_posts add column job_location char(20) not null after job_type default 'Onsite';

alter table job_posts change coloumn ctc salary int not null after min_experience;



create table job_qulaifications (
    job_qualification_id int auto_increment primary key ,
    job_post_id int not null , 
    qualification_id int not null,
    constraint fk_job_qualifications_job_posts foreign key (job_post_id) references job_posts (job_post_id),
    constraint fk_job_qualifications_qualifications foreign key (qualification_id) references qualifications (qualification_id) 
);



create table job_skills(
    job_skill_id int auto_increment primary key,
    job_post_id int not null, 
    skill_id int not null ,
    constraint fk_job_skills_job_posts foreign key (job_post_id) references job_posts (job_post_id),
    constraint fk_job_skills_skills foreign key (skill_id) references skills (skill_id)
);

create table applicants (
    applicant_id int auto_increment primary key , 
    job_post_id int not null ,
    candidate_id int not null ,
    applied_on date not null , 
    status_id int not null ,
    constraint fk_applicants_job_posts foreign key (job_post_id) references job_posts (job_post_id),
    constraint fk_applicants_candidates foreign key (candidate_id) references candidates (candidate_id),
    constraint fk_applicants_status foreign key (status_id) references status (status_id)
);




create table cities (
    city_id int auto_increment primary key,
    city char(55) not null,
    state_id int not null,
    constraint fk_cities_states foreign key (state_id) references states (state_id)
);

insert into cities (city,state_id) values
 
-- Andhra Pradesh
('Visakhapatnam', 1),
('Vijayawada', 1),
('Guntur', 1),
('Tirupati', 1),
('Nellore', 1),

-- Arunachal Pradesh
('Itanagar', 2),
('Naharlagun', 2),
('Pasighat', 2),
('Tawang', 2),
('Ziro', 2),

-- Assam
('Guwahati', 3),
('Silchar', 3),
('Dibrugarh', 3),
('Jorhat', 3),
('Tezpur', 3),

-- Bihar
('Patna', 4),
('Gaya', 4),
('Bhagalpur', 4),
('Muzaffarpur', 4),
('Darbhanga', 4),

-- Chhattisgarh
('Raipur', 5),
('Bilaspur', 5),
('Durg', 5),
('Bhilai', 5),
('Korba', 5),

-- Goa
('Panaji', 6),
('Margao', 6),
('Vasco da Gama', 6),
('Mapusa', 6),
('Ponda', 6),

-- Gujarat
('Ahmedabad', 7),
('Surat', 7),
('Vadodara', 7),
('Rajkot', 7),
('Bhavnagar', 7),

-- Haryana
('Gurugram', 8),
('Faridabad', 8),
('Panipat', 8),
('Ambala', 8),
('Hisar', 8),

-- Himachal Pradesh
('Shimla', 9),
('Manali', 9),
('Dharamshala', 9),
('Solan', 9),
('Mandi', 9),

-- Jharkhand
('Ranchi', 10),
('Jamshedpur', 10),
('Dhanbad', 10),
('Bokaro', 10),
('Hazaribagh', 10),

-- Karnataka
('Bengaluru', 11),
('Mysuru', 11),
('Mangaluru', 11),
('Hubballi', 11),
('Belagavi', 11),

-- Kerala
('Thiruvananthapuram', 12),
('Kochi', 12),
('Kozhikode', 12),
('Kollam', 12),
('Thrissur', 12),

-- Madhya Pradesh
('Bhopal', 13),
('Indore', 13),
('Gwalior', 13),
('Jabalpur', 13),
('Ujjain', 13),

-- Maharashtra
('Mumbai', 14),
('Pune', 14),
('Nagpur', 14),
('Thane', 14),
('Nashik', 14),

-- Manipur
('Imphal', 15),
('Thoubal', 15),
('Churachandpur', 15),
('Bishnupur', 15),
('Ukhrul', 15),

-- Meghalaya
('Shillong', 16),
('Tura', 16),
('Nongstoin', 16),
('Jowai', 16),
('Baghmara', 16),

-- Mizoram
('Aizawl', 17),
('Lunglei', 17),
('Champhai', 17),
('Serchhip', 17),
('Kolasib', 17),

-- Nagaland
('Kohima', 18),
('Dimapur', 18),
('Mokokchung', 18),
('Mon', 18),
('Tuensang', 18),

-- Odisha
('Bhubaneswar',19),
('Cuttack',19),
('Rourkela',19),
('Sambalpur', 19),
('Berhampur', 19),

-- Punjab
('Amritsar', 20),
('Ludhiana', 20),
('Patiala', 20),
('Jalandhar', 20),
('Bathinda', 20),

-- Rajasthan
('Jaipur', 21),
('Jodhpur', 21),
('Udaipur', 21),
('Ajmer', 21),
('Kota', 21),

-- Sikkim
('Gangtok', 22),
('Namchi', 22),
('Mangan', 22),
('Geyzing', 22),
('Ravangla', 22),

-- Tamil Nadu
('Chennai', 23),
('Coimbatore', 23),
('Madurai', 23),
('Tiruchirappalli', 23),
('Salem', 23),

-- Telangana
('Hyderabad', 24),
('Warangal', 24),
('Nizamabad', 24),
('Khammam', 24),
('Karimnagar', 24),

-- Tripura
('Agartala', 25),
('Udaipur', 25),
('Kailashahar', 25),
('Dharmanagar', 25),
('Ambassa', 25),

-- Uttar Pradesh
('Lucknow', 26),
('Kanpur', 26),
('Varanasi', 26),
('Agra', 26),
('Prayagraj', 26),

-- Uttarakhand
('Dehradun', 27),
('Haridwar', 27),
('Rishikesh', 27),
('Nainital', 27),
('Almora', 27),

-- West Bengal
('Kolkata', 28),
('Darjeeling', 28),
('Siliguri', 28),
('Howrah', 28),
('Durgapur', 28);

SELECT city_id,city,s.state_id,state from cities as c inner join states as s where c.state_id=s.state_id;


create table applicant_details(
    applicant_detail_id int auto_increment PRIMARY KEY,
    candidate_id int not null,
    job_post_id int not null,
    fullName char(100) not null ,
    email char(255) not null,
    contact char(10) not null,
    highest_degree char(100) not null,
    feild_of_study char(100) not null,
    institution char(100) not null,
    year_of_passing int not null,
    recent_job_title char(100) not null,
    recent_company char(100) not null,
    duration char(50) not null,
    resume char(255) not null,
    cover_letter char(255) not null,
    linked_in char(100) unique,
    portfolio char(255) unique,
    keySkills varchar(1000) not null,
    experience int not null,
    avaliability char(50) not null,
    constraint fk_applicant_details_candidates foreign key (candidate_id) references candidates (candidate_id),
    constraint fk_applicant_details_job_posts foreign key (job_post_id) references job_posts (job_post_id)
)








