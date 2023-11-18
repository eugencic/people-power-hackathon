CREATE TABLE Region (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL
);

CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE Region_budget (
    budget_id SERIAL PRIMARY KEY,
    budget_amount INT NOT NULL,
    budget_year INT NOT NULL,
    region_id INT REFERENCES Region(region_id)
);

CREATE TABLE Project (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    project_description TEXT,
    budget_id INT REFERENCES Region_budget(budget_id),
    project_status VARCHAR(255) NOT NULL,
    category_id INT REFERENCES Category(category_id),
    project_pdf_file_name VARCHAR(255),
    project_type VARCHAR(255),
    likes INT,
    dislikes INT,
    votes INT,
    necessary_budget INT,
    allocated_budget INT,
    used_budget INT
);

CREATE TABLE Expense (
    expense_id SERIAL PRIMARY KEY,
    project_id INT REFERENCES Project(project_id),
    expense_name VARCHAR(255) NOT NULL,
    expense_amount INT,
    expense_pdf_file_name VARCHAR(255)
);

INSERT INTO Region (region_id, region_name) VALUES (2, 'Edinet');
INSERT INTO Region (region_id, region_name) VALUES (3, 'Riscani');
INSERT INTO Region (region_id, region_name) VALUES (4, 'Glodeni');
INSERT INTO Region (region_id, region_name) VALUES (1, 'Briceni');
INSERT INTO Region (region_id, region_name) VALUES (5, 'Falesti');
INSERT INTO Region (region_id, region_name) VALUES (6, 'Ungheni');
INSERT INTO Region (region_id, region_name) VALUES (7, 'Nisporeni');
INSERT INTO Region (region_id, region_name) VALUES (8, 'Hincesti');
INSERT INTO Region (region_id, region_name) VALUES (9, 'Leova');
INSERT INTO Region (region_id, region_name) VALUES (10, 'Cantemir');
INSERT INTO Region (region_id, region_name) VALUES (11, 'Cahul');
INSERT INTO Region (region_id, region_name) VALUES (12, 'Ocnita');
INSERT INTO Region (region_id, region_name) VALUES (13, 'Donduseni');
INSERT INTO Region (region_id, region_name) VALUES (14, 'Soroca');
INSERT INTO Region (region_id, region_name) VALUES (15, 'Camenca');
INSERT INTO Region (region_id, region_name) VALUES (16, 'Rezina');
INSERT INTO Region (region_id, region_name) VALUES (17, 'StingaNistrului');
INSERT INTO Region (region_id, region_name) VALUES (18, 'Grigoriopol');
INSERT INTO Region (region_id, region_name) VALUES (19, 'Bender');
INSERT INTO Region (region_id, region_name) VALUES (20, 'StefanVoda');
INSERT INTO Region (region_id, region_name) VALUES (21, 'Causeni');
INSERT INTO Region (region_id, region_name) VALUES (22, 'Cimislia');
INSERT INTO Region (region_id, region_name) VALUES (23, 'Basarabeasca');
INSERT INTO Region (region_id, region_name) VALUES (24, 'Taraclia');
INSERT INTO Region (region_id, region_name) VALUES (25, 'Comrat');
INSERT INTO Region (region_id, region_name) VALUES (26, 'Comrat');
INSERT INTO Region (region_id, region_name) VALUES (27, 'Comrat');
INSERT INTO Region (region_id, region_name) VALUES (28, 'Criuleni');
INSERT INTO Region (region_id, region_name) VALUES (29, 'Straseni');
INSERT INTO Region (region_id, region_name) VALUES (30, 'AneniiNoi');
INSERT INTO Region (region_id, region_name) VALUES (31, 'Orhei');
INSERT INTO Region (region_id, region_name) VALUES (32, 'Transnistria');
INSERT INTO Region (region_id, region_name) VALUES (33, 'Chisinau');
INSERT INTO Region (region_id, region_name) VALUES (34, 'Telenesti');
INSERT INTO Region (region_id, region_name) VALUES (35, 'Soldanesti');
INSERT INTO Region (region_id, region_name) VALUES (36, 'Floresti');
INSERT INTO Region (region_id, region_name) VALUES (37, 'Rezina');
INSERT INTO Region (region_id, region_name) VALUES (38, 'Ialoveni');
INSERT INTO Region (region_id, region_name) VALUES (39, 'Calarasi');
INSERT INTO Region (region_id, region_name) VALUES (40, 'Drochia');
INSERT INTO Region (region_id, region_name) VALUES (41, 'Singerei');
INSERT INTO Region (region_id, region_name) VALUES (42, 'Balti');

INSERT INTO Category (category_name) VALUES
    ('healthcare'),
    ('technology'),
    ('environment'),
    ('culture'),
    ('agriculture'),
    ('finance'),
    ('sports'),
    ('tourism'),
    ('transportation'),
    ('social services');

INSERT INTO Region_budget (budget_amount, budget_year, region_id) VALUES
    (5000, 2023, 1),
    (4500, 2022, 1),
    (6000, 2023, 2),
    (5500, 2022, 2),
    (2500, 2023, 3),
    (3000, 2022, 3),
    (6000, 2023, 4),
    (6500, 2022, 4),
    (7000, 2023, 5),
    (7500, 2022, 5);

-- Insert projects for Edinet region manually
INSERT INTO Project (
    project_name, project_description, budget_id, project_status, category_id,
    project_pdf_file_name, project_type, likes, dislikes, votes, necessary_budget, allocated_budget, used_budget
) VALUES
    ('Edinet Project 1', 'Upgrading medical facilities', 3, 'ongoing', 1, 'edinet_project1.pdf', 'Healthcare', 0, 0, 0, 750, 0, 0),
    ('Edinet Project 2', 'Supporting startups in the tech industry', 1, 'planned', 2, 'edinet_project2.pdf', 'Technology', 0, 0, 0, 1100, 100, 50),
    ('Edinet Project 3', 'Cleaning up polluted areas', 4, 'finished', 3, 'edinet_project3.pdf', 'Environment', 0, 0, 0, 1400, 0, 0),
    ('Edinet Project 4', 'Expanding educational infrastructure', 2, 'ongoing', 1, 'edinet_project4.pdf', 'Education', 0, 0, 0, 650, 0, 0),
    ('Edinet Project 5', 'Preserving historical sites', 7, 'planned', 4, 'edinet_project5.pdf', 'Culture', 0, 0, 0, 900, 50, 20),
    ('Edinet Project 6', 'Promoting sustainable farming practices', 6, 'ongoing', 5, 'edinet_project6.pdf', 'Agriculture', 0, 0, 0, 1200, 0, 0),
    ('Edinet Project 7', 'Building a sports facility for the community', 8, 'planned', 6, 'edinet_project7.pdf', 'Sports', 0, 0, 0, 850, 20, 10),
    ('Edinet Project 8', 'Boosting local tourism', 5, 'ongoing', 8, 'edinet_project8.pdf', 'Tourism', 0, 0, 0, 1300, 80, 30),
    ('Edinet Project 9', 'Enhancing public transportation', 9, 'planned', 9, 'edinet_project9.pdf', 'Transportation', 0, 0, 0, 1100, 0, 0),
    ('Edinet Project 10', 'Expanding social support services', 10, 'ongoing', 10, 'edinet_project10.pdf', 'Social Services', 0, 0, 0, 900, 50, 20);

-- Edinet
INSERT INTO Expense (
    project_id, expense_name, expense_amount, expense_pdf_file_name
) VALUES
    (1, 'Medical Equipment Purchase', 100000, 'edinet_project1_expense1.pdf'),
    (1, 'Research Material Costs', 75000, 'edinet_project1_expense2.pdf'),
    (1, 'Training Workshops', 50000, 'edinet_project1_expense3.pdf'),
    (1, 'Community Outreach', 25000, 'edinet_project1_expense4.pdf'),

    (2, 'Tech Equipment Purchase', 110000, 'edinet_project2_expense1.pdf'),
    (2, 'Startup Mentorship Program', 80000, 'edinet_project2_expense2.pdf'),
    (2, 'Innovation Workshops', 55000, 'edinet_project2_expense3.pdf'),
    (2, 'Technology Events', 30000, 'edinet_project2_expense4.pdf'),

    (3, 'Cleanup Supplies', 95000, 'edinet_project3_expense1.pdf'),
    (3, 'Waste Disposal Fees', 65000, 'edinet_project3_expense2.pdf'),
    (3, 'Environmental Research', 40000, 'edinet_project3_expense3.pdf'),
    (3, 'Community Awareness', 20000, 'edinet_project3_expense4.pdf'),

    (4, 'School Construction Materials', 70000, 'edinet_project4_expense1.pdf'),
    (4, 'Educational Workshops', 55000, 'edinet_project4_expense2.pdf'),
    (4, 'Teacher Training', 30000, 'edinet_project4_expense3.pdf'),
    (4, 'Student Scholarships', 50000, 'edinet_project4_expense4.pdf'),

    (5, 'Preservation Tools', 80000, 'edinet_project5_expense1.pdf'),
    (5, 'Historical Research', 60000, 'edinet_project5_expense2.pdf'),
    (5, 'Cultural Events', 35000, 'edinet_project5_expense3.pdf'),
    (5, 'Community Engagement', 15000, 'edinet_project5_expense4.pdf'),

    (6, 'Seeds and Farming Tools', 95000, 'edinet_project6_expense1.pdf'),
    (6, 'Agricultural Workshops', 70000, 'edinet_project6_expense2.pdf'),
    (6, 'Sustainable Practices Research', 45000, 'edinet_project6_expense3.pdf'),
    (6, 'Farmers Market Promotion', 25000, 'edinet_project6_expense4.pdf'),

    (7, 'Sports Equipment Purchase', 90000, 'edinet_project7_expense1.pdf'),
    (7, 'Sports Facility Construction', 65000, 'edinet_project7_expense2.pdf'),
    (7, 'Community Sports Events', 40000, 'edinet_project7_expense3.pdf'),
    (7, 'Youth Sports Training', 20000, 'edinet_project7_expense4.pdf'),

    (8, 'Tourism Marketing Campaign', 55000, 'edinet_project8_expense1.pdf'),
    (8, 'Local Attractions Enhancement', 40000, 'edinet_project8_expense2.pdf'),
    (8, 'Tourist Information Centers', 25000, 'edinet_project8_expense3.pdf'),
    (8, 'Tourism Events', 10000, 'edinet_project8_expense4.pdf'),

    (9, 'Public Transportation Upgrade', 100000, 'edinet_project9_expense1.pdf'),
    (9, 'Transportation Infrastructure', 75000, 'edinet_project9_expense2.pdf'),
    (9, 'Transportation Research', 50000, 'edinet_project9_expense3.pdf'),
    (9, 'Community Transportation Workshops', 25000, 'edinet_project9_expense4.pdf'),

    (10, 'Social Services Outreach', 110000, 'edinet_project10_expense1.pdf'),
    (10, 'Community Support Programs', 85000, 'edinet_project10_expense2.pdf'),
    (10, 'Social Workers Training', 55000, 'edinet_project10_expense3.pdf'),
    (10, 'Community Assistance Fund', 30000, 'edinet_project10_expense4.pdf');

-- Riscani
INSERT INTO Project (
    project_name, project_description, budget_id, project_status, category_id,
    project_pdf_file_name, project_type, likes, dislikes, votes, necessary_budget, allocated_budget, used_budget
) VALUES
    ('Riscani Project 1', 'Health Clinic Renovation', 3, 'ongoing', 1, 'riscani_project1.pdf', 'Healthcare', 0, 0, 0, 850, 0, 0),
    ('Riscani Project 2', 'Tech Education Initiative', 1, 'planned', 2, 'riscani_project2.pdf', 'Technology', 0, 0, 0, 1200, 50, 20),
    ('Riscani Project 3', 'Green Spaces Enhancement', 4, 'finished', 3, 'riscani_project3.pdf', 'Environment', 0, 0, 0, 1600, 0, 0),
    ('Riscani Project 4', 'School Infrastructure Upgrade', 2, 'ongoing', 1, 'riscani_project4.pdf', 'Education', 0, 0, 0, 700, 0, 0),
    ('Riscani Project 5', 'Cultural Events Promotion', 7, 'planned', 4, 'riscani_project5.pdf', 'Culture', 0, 0, 0, 950, 70, 30),
    ('Riscani Project 6', 'Agricultural Training Program', 6, 'ongoing', 5, 'riscani_project6.pdf', 'Agriculture', 0, 0, 0, 1400, 0, 0),
    ('Riscani Project 7', 'Sports Facility Construction', 8, 'planned', 6, 'riscani_project7.pdf', 'Sports', 0, 0, 0, 800, 40, 15),
    ('Riscani Project 8', 'Tourism Development Strategy', 5, 'ongoing', 8, 'riscani_project8.pdf', 'Tourism', 0, 0, 0, 1100, 90, 40),
    ('Riscani Project 9', 'Public Transportation Improvements', 9, 'planned', 9, 'riscani_project9.pdf', 'Transportation', 0, 0, 0, 1000, 0, 0),
    ('Riscani Project 10', 'Social Services Center Expansion', 10, 'ongoing', 10, 'riscani_project10.pdf', 'Social Services', 0, 0, 0, 800, 40, 15);

INSERT INTO Expense (
    project_id, expense_name, expense_amount, expense_pdf_file_name
) VALUES
    (11, 'Health Clinic Equipment Purchase', 95000, 'riscani_project1_expense1.pdf'),
    (11, 'Medical Staff Training', 70000, 'riscani_project1_expense2.pdf'),
    (11, 'Community Health Workshops', 45000, 'riscani_project1_expense3.pdf'),
    (11, 'Health Awareness Campaign', 25000, 'riscani_project1_expense4.pdf'),

    (12, 'Tech Education Materials', 110000, 'riscani_project2_expense1.pdf'),
    (12, 'Programming Courses', 85000, 'riscani_project2_expense2.pdf'),
    (12, 'Innovation Workshops', 55000, 'riscani_project2_expense3.pdf'),
    (12, 'Technology Events', 30000, 'riscani_project2_expense4.pdf'),

    (13, 'Green Spaces Improvement Supplies', 90000, 'riscani_project3_expense1.pdf'),
    (13, 'Biodiversity Research', 65000, 'riscani_project3_expense2.pdf'),
    (13, 'Environmental Cleanup', 40000, 'riscani_project3_expense3.pdf'),
    (13, 'Community Planting Events', 20000, 'riscani_project3_expense4.pdf'),

    (14, 'School Construction Materials', 75000, 'riscani_project4_expense1.pdf'),
    (14, 'Educational Workshops', 55000, 'riscani_project4_expense2.pdf'),
    (14, 'Teacher Training', 30000, 'riscani_project4_expense3.pdf'),
    (14, 'Student Scholarships', 50000, 'riscani_project4_expense4.pdf'),

    (15, 'Cultural Events Promotion', 90000, 'riscani_project5_expense1.pdf'),
    (15, 'Historical Research', 65000, 'riscani_project5_expense2.pdf'),
    (15, 'Cultural Workshops', 40000, 'riscani_project5_expense3.pdf'),
    (15, 'Community Art Exhibitions', 20000, 'riscani_project5_expense4.pdf'),

    (16, 'Seeds and Farming Tools', 110000, 'riscani_project6_expense1.pdf'),
    (16, 'Agricultural Workshops', 80000, 'riscani_project6_expense2.pdf'),
    (16, 'Sustainable Practices Research', 55000, 'riscani_project6_expense3.pdf'),
    (16, 'Farmers Market Promotion', 30000, 'riscani_project6_expense4.pdf'),

    (17, 'Sports Equipment Purchase', 100000, 'riscani_project7_expense1.pdf'),
    (17, 'Sports Facility Construction', 75000, 'riscani_project7_expense2.pdf'),
    (17, 'Community Sports Events', 50000, 'riscani_project7_expense3.pdf'),
    (17, 'Youth Sports Training', 25000, 'riscani_project7_expense4.pdf'),

    (18, 'Tourism Marketing Campaign', 55000, 'riscani_project8_expense1.pdf'),
    (18, 'Local Attractions Enhancement', 40000, 'riscani_project8_expense2.pdf'),
    (18, 'Tourist Information Centers', 25000, 'riscani_project8_expense3.pdf'),
    (18, 'Tourism Events', 10000, 'riscani_project8_expense4.pdf'),

    (19, 'Public Transportation Upgrade', 100000, 'riscani_project9_expense1.pdf'),
    (19, 'Transportation Infrastructure', 75000, 'riscani_project9_expense2.pdf'),
    (19, 'Transportation Research', 50000, 'riscani_project9_expense3.pdf'),
    (19, 'Community Transportation Workshops', 25000, 'riscani_project9_expense4.pdf'),

    (20, 'Social Services Outreach', 110000, 'riscani_project10_expense1.pdf'),
    (20, 'Community Support Programs', 85000, 'riscani_project10_expense2.pdf'),
    (20, 'Social Workers Training', 55000, 'riscani_project10_expense3.pdf'),
    (20, 'Community Assistance Fund', 30000, 'riscani_project10_expense4.pdf');

-- Insert projects for each region manually
-- Region: Glodeni
INSERT INTO Project (
    project_name, project_description, budget_id, project_status, category_id,
    project_pdf_file_name, project_type, likes, dislikes, votes, necessary_budget, allocated_budget, used_budget
) VALUES
    ('Glodeni Project 1', 'Health Clinic Renovation', 3, 'ongoing', 1, 'glodeni_project1.pdf', 'Healthcare', 0, 0, 0, 800, 0, 0),
    ('Glodeni Project 2', 'Tech Education Initiative', 1, 'planned', 2, 'glodeni_project2.pdf', 'Technology', 0, 0, 0, 1100, 60, 25),
    ('Glodeni Project 3', 'Green Spaces Enhancement', 4, 'finished', 3, 'glodeni_project3.pdf', 'Environment', 0, 0, 0, 1500, 0, 0),
    ('Glodeni Project 4', 'School Infrastructure Upgrade', 2, 'ongoing', 1, 'glodeni_project4.pdf', 'Education', 0, 0, 0, 700, 0, 0),
    ('Glodeni Project 5', 'Cultural Events Promotion', 7, 'planned', 4, 'glodeni_project5.pdf', 'Culture', 0, 0, 0, 900, 40, 15),
    ('Glodeni Project 6', 'Agricultural Training Program', 6, 'ongoing', 5, 'glodeni_project6.pdf', 'Agriculture', 0, 0, 0, 1300, 0, 0),
    ('Glodeni Project 7', 'Sports Facility Construction', 8, 'planned', 6, 'glodeni_project7.pdf', 'Sports', 0, 0, 0, 750, 30, 10),
    ('Glodeni Project 8', 'Tourism Development Strategy', 5, 'ongoing', 8, 'glodeni_project8.pdf', 'Tourism', 0, 0, 0, 1200, 80, 35),
    ('Glodeni Project 9', 'Public Transportation Improvements', 9, 'planned', 9, 'glodeni_project9.pdf', 'Transportation', 0, 0, 0, 1000, 0, 0),
    ('Glodeni Project 10', 'Social Services Center Expansion', 10, 'ongoing', 10, 'glodeni_project10.pdf', 'Social Services', 0, 0, 0, 750, 30, 10);

-- Glodeni
INSERT INTO Project (
    project_name, project_description, budget_id, project_status, category_id,
    project_pdf_file_name, project_type, likes, dislikes, votes, necessary_budget, allocated_budget, used_budget
) VALUES
    ('Glodeni Project 1', 'Health Clinic Renovation', 3, 'ongoing', 1, 'glodeni_project1.pdf', 'Healthcare', 0, 0, 0, 900, 0, 0),
    ('Glodeni Project 2', 'Tech Education Initiative', 1, 'planned', 2, 'glodeni_project2.pdf', 'Technology', 0, 0, 0, 1300, 60, 25),
    ('Glodeni Project 3', 'Green Spaces Enhancement', 4, 'finished', 3, 'glodeni_project3.pdf', 'Environment', 0, 0, 0, 1700, 0, 0),
    ('Glodeni Project 4', 'School Infrastructure Upgrade', 2, 'ongoing', 1, 'glodeni_project4.pdf', 'Education', 0, 0, 0, 750, 0, 0),
    ('Glodeni Project 5', 'Cultural Events Promotion', 7, 'planned', 4, 'glodeni_project5.pdf', 'Culture', 0, 0, 0, 1000, 80, 35),
    ('Glodeni Project 6', 'Agricultural Training Program', 6, 'ongoing', 5, 'glodeni_project6.pdf', 'Agriculture', 0, 0, 0, 1500, 0, 0),
    ('Glodeni Project 7', 'Sports Facility Construction', 8, 'planned', 6, 'glodeni_project7.pdf', 'Sports', 0, 0, 0, 850, 30, 10),
    ('Glodeni Project 8', 'Tourism Development Strategy', 5, 'ongoing', 8, 'glodeni_project8.pdf', 'Tourism', 0, 0, 0, 1200, 100, 45),
    ('Glodeni Project 9', 'Public Transportation Improvements', 9, 'planned', 9, 'glodeni_project9.pdf', 'Transportation', 0, 0, 0, 1100, 0, 0),
    ('Glodeni Project 10', 'Social Services Center Expansion', 10, 'ongoing', 10, 'glodeni_project10.pdf', 'Social Services', 0, 0, 0, 900, 30, 10);

INSERT INTO Expense (
    project_id, expense_name, expense_amount, expense_pdf_file_name
) VALUES
    (21, 'Health Clinic Equipment Purchase', 100000, 'glodeni_project1_expense1.pdf'),
    (21, 'Medical Staff Training', 75000, 'glodeni_project1_expense2.pdf'),
    (21, 'Community Health Workshops', 50000, 'glodeni_project1_expense3.pdf'),
    (21, 'Health Awareness Campaign', 25000, 'glodeni_project1_expense4.pdf'),

    (22, 'Tech Education Materials', 110000, 'glodeni_project2_expense1.pdf'),
    (22, 'Programming Courses', 85000, 'glodeni_project2_expense2.pdf'),
    (22, 'Innovation Workshops', 55000, 'glodeni_project2_expense3.pdf'),
    (22, 'Technology Events', 30000, 'glodeni_project2_expense4.pdf'),

    (23, 'Green Spaces Improvement Supplies', 95000, 'glodeni_project3_expense1.pdf'),
    (23, 'Biodiversity Research', 65000, 'glodeni_project3_expense2.pdf'),
    (23, 'Environmental Cleanup', 40000, 'glodeni_project3_expense3.pdf'),
    (23, 'Community Planting Events', 20000, 'glodeni_project3_expense4.pdf'),

    (24, 'School Construction Materials', 70000, 'glodeni_project4_expense1.pdf'),
    (24, 'Educational Workshops', 55000, 'glodeni_project4_expense2.pdf'),
    (24, 'Teacher Training', 30000, 'glodeni_project4_expense3.pdf'),
    (24, 'Student Scholarships', 50000, 'glodeni_project4_expense4.pdf'),

    (25, 'Cultural Events Promotion', 90000, 'glodeni_project5_expense1.pdf'),
    (25, 'Historical Research', 65000, 'glodeni_project5_expense2.pdf'),
    (25, 'Cultural Workshops', 40000, 'glodeni_project5_expense3.pdf'),
    (25, 'Community Art Exhibitions', 20000, 'glodeni_project5_expense4.pdf'),

    (26, 'Seeds and Farming Tools', 110000, 'glodeni_project6_expense1.pdf'),
    (26, 'Agricultural Workshops', 80000, 'glodeni_project6_expense2.pdf'),
    (26, 'Sustainable Practices Research', 55000, 'glodeni_project6_expense3.pdf'),
    (26, 'Farmers Market Promotion', 30000, 'glodeni_project6_expense4.pdf'),

    (27, 'Sports Equipment Purchase', 100000, 'glodeni_project7_expense1.pdf'),
    (27, 'Sports Facility Construction', 75000, 'glodeni_project7_expense2.pdf'),
    (27, 'Community Sports Events', 50000, 'glodeni_project7_expense3.pdf'),
    (27, 'Youth Sports Training', 25000, 'glodeni_project7_expense4.pdf'),

    (28, 'Tourism Marketing Campaign', 55000, 'glodeni_project8_expense1.pdf'),
    (28, 'Local Attractions Enhancement', 40000, 'glodeni_project8_expense2.pdf'),
    (28, 'Tourist Information Centers', 25000, 'glodeni_project8_expense3.pdf'),
    (28, 'Tourism Events', 10000, 'glodeni_project8_expense4.pdf'),

    (29, 'Public Transportation Upgrade', 100000, 'glodeni_project9_expense1.pdf'),
    (29, 'Transportation Infrastructure', 75000, 'glodeni_project9_expense2.pdf'),
    (29, 'Transportation Research', 50000, 'glodeni_project9_expense3.pdf'),
    (29, 'Community Transportation Workshops', 25000, 'glodeni_project9_expense4.pdf'),

    (30, 'Social Services Outreach', 110000, 'glodeni_project10_expense1.pdf'),
    (30, 'Community Support Programs', 85000, 'glodeni_project10_expense2.pdf'),
    (30, 'Social Workers Training', 55000, 'glodeni_project10_expense3.pdf'),
    (30, 'Community Assistance Fund', 30000, 'glodeni_project10_expense4.pdf');
