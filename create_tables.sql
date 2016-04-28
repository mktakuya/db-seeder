CREATE TABLE company_names(
    code        serial  PRIMARY KEY,
    name        text    UNIQUE   NOT NULL
);

CREATE TABLE car_names (
    code        serial  PRIMARY KEY,
    name        text    UNIQUE  NOT NULL
);

CREATE TABLE car_types (
    code        serial  PRIMARY KEY,
    name        text    UNIQUE  NOT NULL
);

CREATE TABLE specs (
    company_name_code       integer REFERENCES company_names(code),
    car_name_code           integer REFERENCES car_names(code),
    car_type_code           integer REFERENCES car_types(code),
    vehcle_model            text    NOT NULL,
    drive_type              text    NOT NULL,
    full_length             integer NOT NULL,
    full_width              integer NOT NULL,
    full_height             integer NOT NULL,
    wheel_base              integer NOT NULL,
    min_ground_clearrance   integer NOT NULL,
    weight                  integer NOT NULL,
    capacity                integer NOT NULL,
    grade                   text    NOT NULL,
    engine_cycle            text    NOT NULL,
    fuel                    text    NOT NULL,
    cylinders_num           text    NOT NULL,
    valve_system            text    NOT NULL,
    total_displacement      integer NOT NULL,
    max_output              integer NOT NULL,
    max_torque              integer NOT NULL,
    tank_cap                integer NOT NULL,
    trancemission           text    NOT NULL,
    tire_standard           text    NOT NULL,
    fuel_comsumption        real    NOT NULL,
    min_turning_rad         real    NOT NULL,
    standard_price_tokyo    integer NOT NULL,
    appearance_photo        text    NOT NULL,
    driver_seat_photo       text    NOT NULL,
    PRIMARY KEY(car_name_code, grade, capacity)
);

CREATE TABLE stocks (
    car_name_code   integer REFERENCES car_names(code),
    grade           text    NOT NULL,
    capacity        integer NOT NULL,
    num             integer NOT NULL,
    PRIMARY KEY(car_name_code, grade, capacity)
);

CREATE TABLE terms (
    abbrev_name     text    UNIQUE  PRIMARY KEY,
    formal_name     text    UNIQUE  NOT NULL
);

GRANT ALL ON company_names, car_names, car_types, specs, stocks, terms TO PUBLIC;
