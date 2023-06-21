CREATE TABLE user(
    id SERIAL PRIMARY KEY,
    full_name text
);

CREATE TABLE chatroom(
    room_id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    type text,
    created_at timestamp without time zone default (now() at time zone 'utc'),
    updated_at timestamp without time zone,
    room_name text
);

CREATE TABLE chatroom(
    room_id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    type text,
    created_at timestamp without time zone default (now() at time zone 'utc'),
    updated_at timestamp without time zone,
    room_name text
);

CREATE TABLE userchatroom(
    user_id INTEGER,
    FOREIGN KEY(user_id) REFERENCES user(id),
    room_id uuid,
    FOREIGN KEY(user_id) REFERENCES chatroom(room_id),
    PRIMARY KEY(user_id, room_id)
);