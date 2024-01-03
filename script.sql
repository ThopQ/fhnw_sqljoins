INSERT INTO users (id, name, verified_at, email) VALUES
(1, 'Thomas Iseli', '2023-12-02 20:01:00', 'thoemu.iseli@webyourself.ch'),
(2, 'Flavio Studer', '2023-12-03 20:01:00', 'flaevu.studer@gmail.com'),
(3, 'Josephine Schatzmann', '2023-12-04 20:01:00', 'josischatz@me.com'),
(4, 'Vivi Häfeli', '2023-12-05 20:01:00', 'vivih03@gmail.com');

INSERT INTO posts (id, title, body, user_id) VALUES
(1, 'Nature\'s Beauty', 'A post describing the serene beauty.', 2),
(2, 'Tech Trends', 'Discussion on the latest trends.', 1),
(3, 'Healthy Eating', 'Tips for maintaining a healthy diet.', 3),
(4, 'Space Exploration', 'Insights into the latest space.', 1),
(5, 'Art in the City', 'Exploring the vibrant street art in the city.', 4),
(6, 'Fitness Goals', 'Sharing personal fitness goals and progress.', 2),
(7, 'Books to read', 'Suggesting great reads for the month.', 3),
(8, 'Gardening Tips', 'Providing useful tips for gardening enthusiasts.', 4);
