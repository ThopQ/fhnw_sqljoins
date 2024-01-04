# MySQL Join CheatSheet 📄

## Summary

SQL Joins are used to connect the Datasets of two tables inside a relational Database based on a related Column in both Tables.

## Overview

### Tables

These are the tables to demonstrate the database schema. The tables show a simple blog with users and posts that belong to them.

#### users-Table

| id (PK) | name                 | verified_at         | email                       |
| ------- | -------------------- | ------------------- | --------------------------- |
| **1**   | Thomas iseli         | 2023-12-02 20:01:00 | thoemu.iseli@webyourself.ch |
| **2**   | Flavio Studer        | 2023-12-03 20:01:00 | flaevu.studer@gmail.com     |
| **3**   | Josephine Schatzmann | 2023-12-04 20:01:00 | josischatz@me.com           |
| **4**   | Vivi Häfeli          | 2023-12-05 20:01:00 | vivih03@gmail.com           |

#### posts-Table

| id (PK) | title             | body                                             | user_id (FK) |
| ------- | ----------------- | ------------------------------------------------ | ------------ |
| **1**   | Nature's Beauty   | A post describing the serene beauty.             | 2            |
| **2**   | Tech Trends       | Discussion on the latest trends.                 | 1            |
| **3**   | Healthy Eating    | Tips for maintaining a healthy diet.             | 3            |
| **4**   | Space Exploration | Insights into the latest space.                  | 1            |
| **5**   | Art in the City   | Exploring the vibrant street art in the city.    |              |
| **6**   | Fitness Goals     | Sharing personal fitness goals and progress.     | 2            |
| **7**   | Books to read     | Suggesting great reads for the month.            | 3            |
| **8**   | Gardening Tips    | Providing useful tips for gardening enthusiasts. | 2            |
| **9**   | Books to read     | Keep in mind this title is duplicated.           | 3            |

## Mysql Joins

### Inner Joins

![Alt text](/assets/inner-join.png)

An inner join between two tables will return only records where a joining field, such as a foreign key, finds a match in both tables.
In our case we could use it to show all blog posts with the corresponding user that wrote the post.

That also means, we will only get posts, that actually have a user. If the `user_id` is `NULL`, the post will not visible in the query result! As it is the case with post **5** "Art in the City".

```sql
SELECT posts.title, posts.body, users.name
FROM posts
INNER JOIN users ON posts.user_id = users.id;
```

### Self Join

A self join is used to compare the data of one table to its own data.
In our example we can use it to find duplicated blog post titles.

```sql
SELECT A.title, A.id AS PostID1, B.id AS PostID2
FROM posts AS A, posts AS B
WHERE A.id != B.id
AND A.title = B.title;

```

### Outer Joins

#### Left Join

![Alt text](/assets/left-join.png)

A left join is used to return all records from the left table (the one that appears first in the query), and the matched records from the right table (the one that appears second). If there is no match, the result is NULL on the side of the right table.

We can use this method with our sample data to get a list of all users (left table) and the posts (right table) they have made. If a user has not created any posts (as it is the case with Vivian Häfeli), the user will still be visible, but the post data will be `NULL`.

```sql
SELECT posts.title, posts.body, users.name
FROM users
LEFT JOIN posts ON users.id = posts.user_id;

```

#### Right Join

![Alt text](/assets/right-join.png)

A right join is used to return all records from the right table, and the matched records from the left table. If there is no match, the result is NULL on the side of the left table.

This would be ideal if we want to list all posts (right table) regardless if the have a user (left table) or not. If a post does not belong to a user, the data for the user would be `NULL`.

```sql
SELECT posts.title, posts.body, users.name
FROM users
RIGHT JOIN posts ON users.id = posts.user_id;
```

#### Full Join

A full join is used to display all data of two tables.

This query will return all users and all posts. If a user has no posts, the post columns will be `NULL`. If a post has no associated user, the user columns will be `NULL`.

![Alt text](/assets/outer-join.png)
