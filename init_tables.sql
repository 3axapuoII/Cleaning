

CREATE TABLE users (
    id serial NOT NULL,
    login varchar(30) NOT NULL UNIQUE,
    password varchar(60) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE user_infos (
    id serial NOT NULL,
    avatar character varying(256) COLLATE pg_catalog."default",
    first_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(30) COLLATE pg_catalog."default",
	createdAt date NULL,
    updatedAt date NULL,
    userId serial NOT NULL,
	CONSTRAINT user_infos_pkey PRIMARY KEY (id),
    CONSTRAINT user_infos_email_key UNIQUE (email)
);

CREATE TABLE roles (
    id serial NOT NULL,
    name varchar(30) NOT NULL,
    CONSTRAINT roles_pkey PRIMARY KEY (id),
    CONSTRAINT roles_name_key UNIQUE (name)
);

CREATE TABLE users_roles (
    id serial NOT NULL,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reviews (
    id serial NOT NULL,
    comment character varying(255) COLLATE pg_catalog."default" NOT NULL,
    rate integer NOT NULL,
    "date" timestamp with time zone NOT NULL,
    CONSTRAINT reviews_pkey PRIMARY KEY (id)
);

CREATE TABLE Services (
    id serial NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    price double precision NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    squere integer,
    CONSTRAINT "Services_pkey" PRIMARY KEY (id),
    CONSTRAINT "Services_name_key" UNIQUE (name)
);

CREATE TABLE Rooms (
     id serial NOT NULL,
    name character varying(256) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Rooms_pkey" PRIMARY KEY (id)
);

CREATE TABLE Orders (
    id serial NOT NULL,
    address character varying(1000) COLLATE pg_catalog."default" NOT NULL,
    price double precision NOT NULL,
    review character varying(1000) COLLATE pg_catalog."default" NOT NULL,
    begin_date date NOT NULL,
    end_date date NOT NULL,
    CONSTRAINT "Orders_pkey" PRIMARY KEY (id)
);

CREATE TABLE Baskets (
    id serial NOT NULL,
    quantity integer,
    price double precision NOT NULL,
    CONSTRAINT "Baskets_pkey" PRIMARY KEY (id)
);


INSERT INTO roles (name) VALUES ('admin');
INSERT INTO users (login, password) VALUES 
('Zaxar12321','$2b$10$8tt8dzwj6EjQAOqEEQD1muaqDR/VpjDO2Xe/bMSbfYRh3SOOwGxK.'),
('Zaxar12312321','$2b$10$tFWEw0eEHuUHgW1tf4dOcOH4RwQxdTvVh2xeE7wlgLjh/Sw...9iO');
INSERT INTO user_infos (avatar, first_name, email, phone) VALUES 
(null,'Zakhar321', 'Zakhar1233323@mail.ru', null),
(null,'Zakhar321231', 'Zakhar1233323213@mail.ru', null);
INSERT INTO users_roles (user_id, role_id) VALUES 
(1,1),
(2,1);
INSERT INTO reviews (comment, rate, date) VALUES 
('Comment1', 5, '2023-01-18'),
('Comment2', 3, '2022-06-25');
INSERT INTO Services (name, price, description, squere) VALUES 
('Service1', 100.20, 'Desc1', 15),
('Service2', 3.50, 'Desc2', 3);
INSERT INTO Rooms (name) VALUES 
('Room1'),
('Room2');
INSERT INTO Orders (address, price, review, begin_date, end_date) VALUES 
('Address1', 5, 'Review1', '2023-01-18', '2023-01-18'),
('Address2', 15, 'Review2', '2022-01-18', '2022-01-18');
INSERT INTO Baskets (quantity, price) VALUES 
(1, 5),
(3, 15);




