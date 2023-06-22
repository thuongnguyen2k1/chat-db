CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users(
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

CREATE TABLE chatmessage(
    message_id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    room_id uuid,
    FOREIGN KEY(room_id) REFERENCES chatroom(room_id),
    written_by INTEGER,
    FOREIGN KEY(written_by) REFERENCES users(id),
    message text,
    message_type text,
    created_at timestamp without time zone default (now() at time zone 'utc'),
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    reply_message_id uuid
);

CREATE TABLE userchatroom(
    user_id INTEGER,
    FOREIGN KEY(user_id) REFERENCES users(id),
    room_id uuid,
    FOREIGN KEY(room_id) REFERENCES chatroom(room_id),
    PRIMARY KEY(user_id, room_id)
);