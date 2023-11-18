-- Create Region table
CREATE TABLE Region (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL
);

-- Insert sample data into Region table
INSERT INTO Region (region_name) VALUES
    ('Calarasi');

-- Create Category table
CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Insert sample data into Category table
INSERT INTO Category (category_name) VALUES
    ('education'),
    ('roads');

-- Create Region_budget table
CREATE TABLE Region_budget (
    budget_id SERIAL PRIMARY KEY,
    budget_amount INT NOT NULL,
    budget_year INT NOT NULL,
    region_id INT REFERENCES Region(region_id)
);

-- Insert sample data into Region_budget table
INSERT INTO Region_budget (budget_amount, budget_year, region_id) VALUES
    (1000, 2023, 1),
    (1001, 2022, 1);

-- Create Projects table
CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    project_description TEXT,
    project_budget INT NOT NULL,
    budget_id INT REFERENCES Region_budget(budget_id),
    project_status VARCHAR(255) NOT NULL,
    category_id INT REFERENCES Category(category_id)
);

-- Insert sample data into Projects table
INSERT INTO Projects (project_name, project_description, project_budget, budget_id, project_status, category_id) VALUES
    ('Scoala nr.1 reparatie', 'Lorem Ipsum', 450, 1, 'finished', 1);
