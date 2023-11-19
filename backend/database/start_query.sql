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
    ('Asistență Medicală'),
    ('Tehnologie'),
    ('Mediu'),
    ('Cultură'),
    ('Agricultură'),
    ('Finanțe'),
    ('Sport'),
    ('Turism'),
    ('Transport'),
    ('Servicii Sociale');

INSERT INTO Region_budget (budget_amount, budget_year, region_id) VALUES
    (5000, 2023, 2),
    (4500, 2022, 2),
    (6000, 2023, 3),
    (5500, 2022, 3),
    (2500, 2023, 4),
    (3000, 2022, 4),
    (6000, 2023, 5),
    (6500, 2022, 5),
    (7000, 2023, 6),
    (7500, 2022, 6);

-- Edineț
INSERT INTO Project (
    project_name, project_description, budget_id, project_status, category_id,
    project_pdf_file_name, project_type, likes, dislikes, votes, necessary_budget, allocated_budget, used_budget
) VALUES
    ('Modernizarea Facilităților Medicale', 'Proiectul se concentrează pe modernizarea facilităților medicale pentru a îmbunătăți calitatea serviciilor de sănătate. Acest proiect este în desfășurare, abordând nevoile în continuă evoluție ale infrastructurii de sănătate a comunității.', 1, 'În desfășurare', 1, 'edinet_project2.pdf', 'Asistență Medicală', 0, 0, 0, 750, 0, 0),
    ('Susținerea Start-up-urilor în Industria Tehnologică', 'Acest proiect își propune să susțină și să dezvolte start-up-urile din industria tehnologică, stimulând inovația și creșterea economică. Deși în prezent în faza de planificare, proiectul vizează o ecosistemă dinamică pentru antreprenorii din domeniul tehnologiei.', 1, 'Planificat', 2, 'edinet_project3.pdf', 'Tehnologie', 0, 0, 0, 1100, 100, 50),
    ('Curățarea Zonelor Poluate', 'Finalizat cu succes, Proiectul Edineț 3 s-a concentrat pe curățarea zonelor poluate, contribuind la conservarea mediului. Proiectul avea ca scop restaurarea și protejarea habitatelor naturale în beneficiul comunității.', 1, 'Finalizat', 3, 'edinet_project4.pdf', 'Mediu', 0, 0, 0, 1400, 0, 0),
    ('Extinderea Infrastructurii Educaționale', 'Extinderea infrastructurii educaționale pentru îmbunătățirea accesului la educație.', 1, 'În desfășurare', 1, 'edinet_project5.pdf', 'Educație', 0, 0, 0, 650, 0, 0),
    ('Conservarea Siturilor Istorice', 'Acest proiect viitor își propune să conserve și să protejeze siturile istorice, asigurându-se că bogăția patrimoniului cultural al comunității este păstrată pentru generațiile viitoare.', 1, 'Planificat', 4, 'edinet_project6.pdf', 'Cultură', 50, 20, 0, 900, 50, 20),
    ('Promovarea Practicilor Agricole Durabile', 'Acest proiect în desfășurare se concentrează pe promovarea și implementarea practicilor agricole durabile. Vizează îmbunătățirea productivității agricole, minimizând în același timp impactul asupra mediului.', 1, 'Aprobat', 5, 'edinet_project7.pdf', 'Agricultură', 0, 0, 0, 1200, 900, 0),
    ('Construirea unei Facilități Sportive pentru Comunitate', 'Vizând o comunitate mai sănătoasă, acest proiect planificat își propune să construiască o facilitate sportivă care să încurajeze activitatea fizică și implicarea comunității.', 2, 'Aprobat', 6, 'edinet_project8.pdf', 'Sport', 0, 0, 0, 850, 20, 10),
    ('Stimularea Turismului Local', 'Axat pe dezvoltarea economică, acest proiect în desfășurare se concentrează pe stimularea turismului local. Își propune să prezinte atracțiile unice ale comunității, atrăgând vizitatori și stimulând creșterea economică.', 2, 'În desfășurare', 8, 'edinet_project9.pdf', 'Turism', 80, 30, 0, 1300, 80, 30),
    ('Îmbunătățirea Transportului Public', 'Cu privire la îmbunătățirea mobilității, acest proiect planificat își propune să îmbunătățească serviciile de transport public. Vizează un sistem de transport mai eficient și accesibil pentru comunitate.', 2, 'Planificat', 9, 'edinet_project10.pdf', 'Transport', 0, 0, 0, 1100, 0, 0),
    ('Extinderea Serviciilor de Suport Social', 'Acest proiect în desfășurare este dedicat extinderii serviciilor de suport social, abordând diversele nevoi ale comunității și promovând un mediu de susținere pentru toți locuitorii.', 2, 'În desfășurare', 10, 'edinet_project11.pdf', 'Servicii Sociale', 50, 20, 0, 900, 50, 20);

-- Edineț
INSERT INTO Expense (
    project_id, expense_name, expense_amount, expense_pdf_file_name
) VALUES
    (1, 'Achiziționare Echipamente Medicale', 100000, 'edinet_project1_expense1.pdf'),
    (1, 'Costuri Materiale de Cercetare', 75000, 'edinet_project1_expense2.pdf'),
    (1, 'Ateliere de Formare', 50000, 'edinet_project1_expense3.pdf'),
    (1, 'Implicare Comunitară', 25000, 'edinet_project1_expense4.pdf'),

    (2, 'Achiziționare Echipamente Tehnice', 110000, 'edinet_project2_expense1.pdf'),
    (2, 'Program de Mentorat pentru Start-up-uri', 80000, 'edinet_project2_expense2.pdf'),
    (2, 'Ateliere de Inovație', 55000, 'edinet_project2_expense3.pdf'),
    (2, 'Evenimente Tehnologice', 30000, 'edinet_project2_expense4.pdf'),

    (3, 'Materiale de Curățare', 95000, 'edinet_project3_expense1.pdf'),
    (3, 'Taxe pentru Eliminarea Deșeurilor', 65000, 'edinet_project3_expense2.pdf'),
    (3, 'Cercetare în Domeniul Mediului', 40000, 'edinet_project3_expense3.pdf'),
    (3, 'Conștientizare Comunitară', 20000, 'edinet_project3_expense4.pdf'),

    (4, 'Materiale de Construcție pentru Școli', 70000, 'edinet_project4_expense1.pdf'),
    (4, 'Ateliere Educaționale', 55000, 'edinet_project4_expense2.pdf'),
    (4, 'Formare pentru Profesori', 30000, 'edinet_project4_expense3.pdf'),
    (4, 'Burse pentru Elevi', 50000, 'edinet_project4_expense4.pdf'),

    (5, 'Unelte de Conservare', 80000, 'edinet_project5_expense1.pdf'),
    (5, 'Cercetare Istorică', 60000, 'edinet_project5_expense2.pdf'),
    (5, 'Evenimente Culturale', 35000, 'edinet_project5_expense3.pdf'),
    (5, 'Implicare Comunitară', 15000, 'edinet_project5_expense4.pdf'),

    (6, 'Seminte și Unelte Agricole', 95000, 'edinet_project6_expense1.pdf'),
    (6, 'Ateliere Agricole', 70000, 'edinet_project6_expense2.pdf'),
    (6, 'Cercetare în Practicile Agricole Durabile', 45000, 'edinet_project6_expense3.pdf'),
    (6, 'Promovarea Piețelor Fermierilor', 25000, 'edinet_project6_expense4.pdf'),

    (7, 'Achiziționare Echipamente Sportive', 90000, 'edinet_project7_expense1.pdf'),
    (7, 'Construcția Facilității Sportive', 65000, 'edinet_project7_expense2.pdf'),
    (7, 'Evenimente Sportive Comunitare', 40000, 'edinet_project7_expense3.pdf'),
    (7, 'Instruire în Sport pentru Tineri', 20000, 'edinet_project7_expense4.pdf'),

    (8, 'Campanie de Marketing pentru Turism', 55000, 'edinet_project8_expense1.pdf'),
    (8, 'Îmbunătățirea Atracțiilor Locale', 40000, 'edinet_project8_expense2.pdf'),
    (8, 'Centre de Informare Turistică', 25000, 'edinet_project8_expense3.pdf'),
    (8, 'Evenimente Turistice', 10000, 'edinet_project8_expense4.pdf'),

    (9, 'Upgrade pentru Transportul Public', 100000, 'edinet_project9_expense1.pdf'),
    (9, 'Infrastructură de Transport', 75000, 'edinet_project9_expense2.pdf'),
    (9, 'Cercetare în Domeniul Transportului', 50000, 'edinet_project9_expense3.pdf'),
    (9, 'Ateliere de Transport Public Comunitar', 25000, 'edinet_project9_expense4.pdf'),

    (10, 'Implicare în Serviciile Sociale', 110000, 'edinet_project10_expense1.pdf'),
    (10, 'Programe de Suport Comunitar', 85000, 'edinet_project10_expense2.pdf'),
    (10, 'Formare pentru Asistenți Sociali', 55000, 'edinet_project10_expense3.pdf'),
    (10, 'Fond pentru Asistență Comunitară', 30000, 'edinet_project10_expense4.pdf');

-- Rîșcani
INSERT INTO Project (
    project_name, project_description, budget_id, project_status, category_id,
    project_pdf_file_name, project_type, likes, dislikes, votes, necessary_budget, allocated_budget, used_budget
) VALUES
    ('Renovarea Clinicilor de Sănătate', 'Proiectul vizează renovarea și modernizarea clinicilor de sănătate din regiunea Rîșcani pentru a oferi servicii medicale de calitate. În prezent, proiectul se află în faza de implementare, având un buget necesar de 850 de unități monetare.', 3, 'În desfășurare', 1, 'riscani_project1.pdf', 'Asistență Medicală', 0, 0, 0, 850, 0, 0),
    ('Inițiativa de Educație Tehnologică', 'Proiectul vizează dezvoltarea unei inițiative de educație tehnologică pentru a stimula interesul și competențele în domeniul tehnologic în rândul comunității. Deși în faza de planificare, se estimează un buget necesar de 1200 de unități monetare.', 3, 'Planificat', 2, 'riscani_project2.pdf', 'Tehnologie', 0, 0, 0, 1200, 50, 20),
    ('Îmbunătățirea Spațiilor Verzi', 'Proiectul, finalizat cu succes, a avut ca obiectiv îmbunătățirea și extinderea spațiilor verzi din regiunea Rîșcani, contribuind la calitatea mediului înconjurător. Bugetul alocat pentru acest proiect a fost de 1600 de unități monetare.', 3, 'Finalizat', 3, 'riscani_project3.pdf', 'Mediu', 0, 0, 0, 1600, 0, 0),
    ('Modernizarea Infrastructurii Școlare', 'Proiectul se concentrează pe modernizarea infrastructurii școlare, inclusiv renovarea școlilor și dotarea cu echipamente moderne. În prezent, proiectul se află în desfășurare, cu un buget necesar de 700 de unități monetare.', 3, 'Aprobat', 1, 'riscani_project4.pdf', 'Educație', 0, 0, 0, 700, 0, 0),
    ('Promovarea Evenimentelor Culturale', 'Proiectul are ca scop promovarea evenimentelor culturale în regiunea Rîșcani, contribuind la conservarea și dezvoltarea patrimoniului cultural. Este în faza de planificare, cu un buget estimat de 950 de unități monetare.', 3, 'Aprobat', 4, 'riscani_project5.pdf', 'Cultură', 0, 0, 0, 950, 70, 30),
    ('Program de Formare Agricolă', 'Proiectul vizează implementarea unui program de formare agricolă pentru agricultorii din regiunea Rîșcani, promovând practici agricole durabile. Proiectul este în desfășurare, cu un buget necesar de 1400 de unități monetare.', 3, 'În desfășurare', 5, 'riscani_project6.pdf', 'Agricultură', 0, 0, 0, 1400, 0, 0),
    ('Construcția unei Facilități Sportive', 'Proiectul propune construcția unei facilități sportive moderne pentru comunitatea din Rîșcani, facilitând activitățile sportive și recreative. Este în faza de planificare, cu un buget estimat de 800 de unități monetare.', 3, 'Planificat', 6, 'riscani_project7.pdf', 'Sport', 0, 0, 0, 800, 40, 15),
    ('Strategie de Dezvoltare a Turismului', 'Proiectul are ca obiectiv elaborarea și implementarea unei strategii de dezvoltare a turismului în regiunea Rîșcani, promovând atracțiile locale și facilitând creșterea turismului. Este în desfășurare, cu un buget necesar de 1100 de unități monetare.', 4, 'În desfășurare', 8, 'riscani_project8.pdf', 'Turism', 0, 0, 0, 1100, 90, 40),
    ('Îmbunătățiri ale Transportului Public', 'Proiectul propune îmbunătățiri ale infrastructurii de transport public în regiunea Rîșcani, facilitând accesul și mobilitatea comunității. Este în faza de planificare, cu un buget estimat de 1000 de unități monetare.', 4, 'Planificat', 9, 'riscani_project9.pdf', 'Transport', 0, 0, 0, 1000, 0, 0),
    ('Extinderea Centrului de Servicii Sociale', 'Proiectul se concentrează pe extinderea centrului de servicii sociale în regiunea Rîșcani, oferind suport și asistență sporită comunității. Este în desfășurare, cu un buget necesar de 800 de unități monetare.', 4, 'În desfășurare', 10, 'riscani_project10.pdf', 'Servicii Sociale', 0, 0, 0, 800, 40, 15);

-- Riscani
INSERT INTO Expense (
    project_id, expense_name, expense_amount, expense_pdf_file_name
) VALUES
    (11, 'Achiziționare Echipament Clinic', 95000, 'riscani_project1_expense1.pdf'),
    (11, 'Training Personal Medical', 70000, 'riscani_project1_expense2.pdf'),
    (11, 'Workshop-uri Comunitare de Sănătate', 45000, 'riscani_project1_expense3.pdf'),
    (11, 'Campanie de Conștientizare a Sănătății', 25000, 'riscani_project1_expense4.pdf'),

    (12, 'Materiale pentru Educație Tehnologică', 110000, 'riscani_project2_expense1.pdf'),
    (12, 'Cursuri de Programare', 85000, 'riscani_project2_expense2.pdf'),
    (12, 'Workshop-uri de Inovație', 55000, 'riscani_project2_expense3.pdf'),
    (12, 'Evenimente Tehnologice', 30000, 'riscani_project2_expense4.pdf'),

    (13, 'Achiziționare Materiale pentru Îmbunătățirea Spațiilor Verzi', 90000, 'riscani_project3_expense1.pdf'),
    (13, 'Cercetare a Biodiversității', 65000, 'riscani_project3_expense2.pdf'),
    (13, 'Curățenie Ecologică', 40000, 'riscani_project3_expense3.pdf'),
    (13, 'Evenimente Comunitare de Plantare', 20000, 'riscani_project3_expense4.pdf'),

    (14, 'Materiale pentru Construcția Școlii', 75000, 'riscani_project4_expense1.pdf'),
    (14, 'Workshop-uri Educaționale', 55000, 'riscani_project4_expense2.pdf'),
    (14, 'Training pentru Profesori', 30000, 'riscani_project4_expense3.pdf'),
    (14, 'Burse pentru Elevi', 50000, 'riscani_project4_expense4.pdf'),

    (15, 'Promovarea Evenimentelor Culturale', 90000, 'riscani_project5_expense1.pdf'),
    (15, 'Cercetare Istorică', 65000, 'riscani_project5_expense2.pdf'),
    (15, 'Workshop-uri Culturale', 40000, 'riscani_project5_expense3.pdf'),
    (15, 'Expoziții de Artă Comunitară', 20000, 'riscani_project5_expense4.pdf'),

    (16, 'Seminte și Unelte Agricole', 110000, 'riscani_project6_expense1.pdf'),
    (16, 'Workshop-uri Agricole', 80000, 'riscani_project6_expense2.pdf'),
    (16, 'Cercetare Practici Durabile', 55000, 'riscani_project6_expense3.pdf'),
    (16, 'Promovarea Pieței Fermierilor', 30000, 'riscani_project6_expense4.pdf'),

    (17, 'Achiziționare Echipamente Sportive', 100000, 'riscani_project7_expense1.pdf'),
    (17, 'Construcție Facilitate Sportivă', 75000, 'riscani_project7_expense2.pdf'),
    (17, 'Evenimente Sportive Comunitare', 50000, 'riscani_project7_expense3.pdf'),
    (17, 'Training Sportiv pentru Tineret', 25000, 'riscani_project7_expense4.pdf'),

    (18, 'Campanie de Marketing pentru Turism', 55000, 'riscani_project8_expense1.pdf'),
    (18, 'Îmbunătățirea Atracțiilor Locale', 40000, 'riscani_project8_expense2.pdf'),
    (18, 'Centre de Informare Turistică', 25000, 'riscani_project8_expense3.pdf'),
    (18, 'Evenimente Turistice', 10000, 'riscani_project8_expense4.pdf'),

    (19, 'Modernizarea Transportului Public', 100000, 'riscani_project9_expense1.pdf'),
    (19, 'Infrastructura de Transport', 75000, 'riscani_project9_expense2.pdf'),
    (19, 'Cercetare în Transporturi', 50000, 'riscani_project9_expense3.pdf'),
    (19, 'Workshop-uri Comunitare pentru Transport', 25000, 'riscani_project9_expense4.pdf'),

    (20, 'Campanie pentru Servicii Sociale', 110000, 'riscani_project10_expense1.pdf'),
    (20, 'Programe de Suport Comunitar', 85000, 'riscani_project10_expense2.pdf'),
    (20, 'Training pentru Asistenți Sociali', 55000, 'riscani_project10_expense3.pdf'),
    (20, 'Fond de Asistență Comunitară', 30000, 'riscani_project10_expense4.pdf');

-- Glodeni
INSERT INTO Project (
    project_name, project_description, budget_id, project_status, category_id,
    project_pdf_file_name, project_type, likes, dislikes, votes, necessary_budget, allocated_budget, used_budget
) VALUES
    ('Renovarea Clinicilor de Sănătate Glodeni', 'Proiectul vizează renovarea și modernizarea clinicilor de sănătate din regiunea Glodeni pentru a oferi servicii medicale de calitate. În prezent, proiectul se află în desfășurare, având un buget necesar de 800 de unități monetare.', 5, 'În desfășurare', 1, 'glodeni_project1.pdf', 'Asistență Medicală', 0, 0, 0, 800, 0, 0),
    ('Inițiativa de Educație Tehnologică Glodeni', 'Proiectul vizează dezvoltarea unei inițiative de educație tehnologică în regiunea Glodeni pentru a stimula interesul și competențele în domeniul tehnologic. Deși în faza de planificare, se estimează un buget necesar de 1100 de unități monetare.', 5, 'Planificat', 2, 'glodeni_project2.pdf', 'Tehnologie', 0, 0, 0, 1100, 60, 25),
    ('Îmbunătățirea Spațiilor Verzi Glodeni', 'Proiectul, finalizat cu succes, a avut ca obiectiv îmbunătățirea și extinderea spațiilor verzi din regiunea Glodeni, contribuind la calitatea mediului înconjurător. Bugetul alocat pentru acest proiect a fost de 1500 de unități monetare.', 5, 'Finalizat', 3, 'glodeni_project3.pdf', 'Mediu', 0, 0, 0, 1500, 0, 0),
    ('Modernizarea Infrastructurii Școlare Glodeni', 'Proiectul se concentrează pe modernizarea infrastructurii școlare în regiunea Glodeni, inclusiv renovarea școlilor și dotarea cu echipamente moderne. În prezent, proiectul se află în desfășurare, cu un buget necesar de 700 de unități monetare.', 5, 'Aprobat', 1, 'glodeni_project4.pdf', 'Educație', 0, 0, 0, 700, 0, 0),
    ('Promovarea Evenimentelor Culturale Glodeni', 'Proiectul are ca scop promovarea evenimentelor culturale în regiunea Glodeni, contribuind la conservarea și dezvoltarea patrimoniului cultural. Este în faza de planificare, cu un buget estimat de 900 de unități monetare.', 5, 'Aprobat', 4, 'glodeni_project5.pdf', 'Cultură', 0, 0, 0, 900, 40, 15),
    ('Program de Formare Agricolă Glodeni', 'Proiectul vizează implementarea unui program de formare agricolă în regiunea Glodeni pentru agricultorii locali, promovând practici agricole durabile. Proiectul este în desfășurare, cu un buget necesar de 1300 de unități monetare.', 5, 'În desfășurare', 5, 'glodeni_project6.pdf', 'Agricultură', 0, 0, 0, 1300, 0, 0),
    ('Construcția unei Facilități Sportive Glodeni', 'Proiectul propune construcția unei facilități sportive moderne în regiunea Glodeni, facilitând activitățile sportive și recreative. Este în faza de planificare, cu un buget estimat de 750 de unități monetare.', 5, 'Planificat', 6, 'glodeni_project7.pdf', 'Sport', 0, 0, 0, 750, 30, 10),
    ('Strategie de Dezvoltare a Turismului Glodeni', 'Proiectul are ca obiectiv elaborarea și implementarea unei strategii de dezvoltare a turismului în regiunea Glodeni, promovând atracțiile locale și facilitând creșterea turismului. Este în desfășurare, cu un buget necesar de 1200 de unități monetare.', 6, 'În desfășurare', 8, 'glodeni_project8.pdf', 'Turism', 0, 0, 0, 1200, 80, 35),
    ('Îmbunătățiri ale Transportului Public Glodeni', 'Proiectul propune îmbunătățiri ale infrastructurii de transport public în regiunea Glodeni, facilitând accesul și mobilitatea comunității. Este în faza de planificare, cu un buget estimat de 1000 de unități monetare.', 6, 'Planificat', 9, 'glodeni_project9.pdf', 'Transport', 0, 0, 0, 1000, 0, 0),
    ('Extinderea Centrului de Servicii Sociale Glodeni', 'Proiectul se concentrează pe extinderea centrului de servicii sociale în regiunea Glodeni, oferind suport și asistență sporită comunității. Este în desfășurare, cu un buget necesar de 750 de unități monetare.', 6, 'În desfășurare', 10, 'glodeni_project10.pdf', 'Servicii Sociale', 0, 0, 0, 750, 30, 10);

-- Glodeni
INSERT INTO Expense (
    project_id, expense_name, expense_amount, expense_pdf_file_name
) VALUES
    (21, 'Achiziționare Echipament Clinic', 100000, 'glodeni_project1_expense1.pdf'),
    (21, 'Training Personal Medical', 75000, 'glodeni_project1_expense2.pdf'),
    (21, 'Workshop-uri Comunitare de Sănătate', 50000, 'glodeni_project1_expense3.pdf'),
    (21, 'Campanie de Conștientizare a Sănătății', 25000, 'glodeni_project1_expense4.pdf'),

    (22, 'Materiale pentru Educație Tehnologică', 110000, 'glodeni_project2_expense1.pdf'),
    (22, 'Cursuri de Programare', 85000, 'glodeni_project2_expense2.pdf'),
    (22, 'Workshop-uri de Inovație', 55000, 'glodeni_project2_expense3.pdf'),
    (22, 'Evenimente Tehnologice', 30000, 'glodeni_project2_expense4.pdf'),

    (23, 'Achiziționare Materiale pentru Îmbunătățirea Spațiilor Verzi', 95000, 'glodeni_project3_expense1.pdf'),
    (23, 'Cercetare a Biodiversității', 65000, 'glodeni_project3_expense2.pdf'),
    (23, 'Curățenie Ecologică', 40000, 'glodeni_project3_expense3.pdf'),
    (23, 'Evenimente Comunitare de Plantare', 20000, 'glodeni_project3_expense4.pdf'),

    (24, 'Materiale pentru Construcția Școlii', 70000, 'glodeni_project4_expense1.pdf'),
    (24, 'Workshop-uri Educaționale', 55000, 'glodeni_project4_expense2.pdf'),
    (24, 'Training pentru Profesori', 30000, 'glodeni_project4_expense3.pdf'),
    (24, 'Burse pentru Elevi', 50000, 'glodeni_project4_expense4.pdf'),

    (25, 'Promovarea Evenimentelor Culturale', 90000, 'glodeni_project5_expense1.pdf'),
    (25, 'Cercetare Istorică', 65000, 'glodeni_project5_expense2.pdf'),
    (25, 'Workshop-uri Culturale', 40000, 'glodeni_project5_expense3.pdf'),
    (25, 'Expoziții de Artă Comunitară', 20000, 'glodeni_project5_expense4.pdf'),

    (26, 'Seminte și Unelte Agricole', 110000, 'glodeni_project6_expense1.pdf'),
    (26, 'Workshop-uri Agricole', 80000, 'glodeni_project6_expense2.pdf'),
    (26, 'Cercetare Practici Durabile', 55000, 'glodeni_project6_expense3.pdf'),
    (26, 'Promovarea Pieței Fermierilor', 30000, 'glodeni_project6_expense4.pdf'),

    (27, 'Achiziționare Echipamente Sportive', 100000, 'glodeni_project7_expense1.pdf'),
    (27, 'Construcție Facilitate Sportivă', 75000, 'glodeni_project7_expense2.pdf'),
    (27, 'Evenimente Sportive Comunitare', 50000, 'glodeni_project7_expense3.pdf'),
    (27, 'Training Sportiv pentru Tineret', 25000, 'glodeni_project7_expense4.pdf'),

    (28, 'Campanie de Marketing pentru Turism', 55000, 'glodeni_project8_expense1.pdf'),
    (28, 'Îmbunătățirea Atracțiilor Locale', 40000, 'glodeni_project8_expense2.pdf'),
    (28, 'Centre de Informare Turistică', 25000, 'glodeni_project8_expense3.pdf'),
    (28, 'Evenimente Turistice', 10000, 'glodeni_project8_expense4.pdf'),

    (29, 'Modernizarea Transportului Public', 100000, 'glodeni_project9_expense1.pdf'),
    (29, 'Infrastructura de Transport', 75000, 'glodeni_project9_expense2.pdf'),
    (29, 'Cercetare în Transporturi', 50000, 'glodeni_project9_expense3.pdf'),
    (29, 'Workshop-uri Comunitare pentru Transport', 25000, 'glodeni_project9_expense4.pdf'),

    (30, 'Campanie pentru Servicii Sociale', 110000, 'glodeni_project10_expense1.pdf'),
    (30, 'Programe de Suport Comunitar', 85000, 'glodeni_project10_expense2.pdf'),
    (30, 'Training pentru Asistenți Sociali', 55000, 'glodeni_project10_expense3.pdf'),
    (30, 'Fond de Asistență Comunitară', 30000, 'glodeni_project10_expense4.pdf');
