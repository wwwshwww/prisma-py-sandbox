CREATE TABLE
    users (
        id UUID PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

CREATE TABLE
    posts (
        id UUID PRIMARY KEY,
        user_id UUID NOT NULL,
        content VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL,
        CONSTRAINT fk_posts_users FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
    );

CREATE INDEX user_id_idx ON posts (user_id);

CREATE TABLE
    tags (
        id UUID PRIMARY KEY,
        name VARCHAR(50) UNIQUE NOT NULL
    );

CREATE TABLE
    post_tags (
        post_id UUID NOT NULL,
        tag_id UUID NOT NULL,
        CONSTRAINT fk_post_tags_posts FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE,
        CONSTRAINT fk_post_tags_tags FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
    );