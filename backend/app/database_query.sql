-- Create Region table
CREATE TABLE Region (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL
);

-- Create Category table
CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Create Region_budget table
CREATE TABLE Region_budget (
    budget_id SERIAL PRIMARY KEY,
    budget_amount INT NOT NULL,
    budget_year INT NOT NULL,
    region_id INT REFERENCES Region(region_id)
);

-- Create Projects table
CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    project_description TEXT,
    project_budget INT NOT NULL,
    budget_id INT REFERENCES Region_budget(budget_id),
    project_status VARCHAR(255) NOT NULL,
    category_id INT REFERENCES Category(category_id),
    pdf_file VARCHAR(255) NOT NULL
);

-- Insert more sample data into Region table for Moldova
INSERT INTO Region (region_name) VALUES
    ('Chisinau'),
    ('Balti'),
    ('Cahul'),
    ('Tiraspol'),
    ('Soroca'),
    ('Orhei'),
    ('Comrat'),
    ('Ungheni'),
    ('Dubasari'),
    ('Edinet');

-- Insert more sample data into Category table
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

-- Insert more sample data into Region_budget table
INSERT INTO Region_budget (budget_amount, budget_year, region_id) VALUES
    (1200, 2023, 2),
    (800, 2023, 3),
    (1500, 2022, 4),
    (900, 2022, 2),
    (1100, 2023, 5),
    (1300, 2023, 6),
    (1000, 2022, 7),
    (1400, 2022, 8),
    (1200, 2023, 9),
    (950, 2022, 10);

-- Insert more sample data into Projects table
INSERT INTO Projects (project_name, project_description, project_budget, budget_id, project_status, category_id) VALUES
    ('Hospital Renovation', 'Upgrading medical facilities', 800, 3, 'ongoing', 1),
    ('Tech Innovation Center', 'Supporting startups in the tech industry', 1200, 1, 'planned', 2),
    ('Environmental Cleanup', 'Cleaning up polluted areas', 1500, 4, 'finished', 3),
    ('School Expansion', 'Expanding educational infrastructure', 700, 2, 'ongoing', 1),
    ('Cultural Heritage Preservation', 'Preserving historical sites', 1000, 7, 'planned', 4),
    ('Agricultural Development Program', 'Promoting sustainable farming practices', 1300, 6, 'ongoing', 5),
    ('Community Sports Complex', 'Building a sports facility for the community', 900, 8, 'planned', 6),
    ('Tourism Promotion Campaign', 'Boosting local tourism', 1400, 5, 'ongoing', 8),
    ('Public Transportation Improvement', 'Enhancing public transportation', 1200, 9, 'planned', 9),
    ('Social Services Outreach', 'Expanding social support services', 950, 10, 'ongoing', 10);
