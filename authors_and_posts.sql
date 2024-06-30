CREATE TABLE AUTHORS(
id serial primary key,
first_name varchar(255) not null,
last_name varchar(255) not null ,
email varchar(255) not null,
created_at timestamp
);

alter table authors alter created_at set default now();

insert into AUTHORS(first_name, last_name, email)
values('Fuad', 'Muradov', 'fuadmuradov@gmail.com'),
      ('Elvin', 'Ahmadli', 'elvinahmadli@gmail.com'),
      ('Rufet', 'Mazamov', 'mazamov@gmail.com');

alter table authors add column about text,
                    add column nick varchar(255);

alter table authors add constraint add_unique_for_nick UNIQUE (nick, email);

CREATE TABLE posts(
    id serial primary key,
    title varchar(255) not null,
    created_at timestamp default now(),
    updated_at timestamp default now()
                  );

insert into posts(title) values ('harry potter'),
                                ('hobits'),
                                ('king of the rings'),
                                ('game of the thrones');




create table  authors_posts(
    id serial primary key,
    authors_id Integer references AUTHORS(id),
    posts_id integer references posts(id)
 );



insert into authors_posts(authors_id, posts_id) values (1,1),
                                                       (1,2),
                                                       (1,3),
                                                       (2,1),
                                                       (2,3),
                                                       (2,4),
                                                       (3,3),
                                                       (3,2);

create or replace view authors_posts_view
as
select a.id, a.first_name || ' ' || a.last_name as full_name, p.id as post_id, p.title, p.created_at from AUTHORS a
left join authors_posts ap on a.id = ap.authors_id
    left join posts p on ap.posts_id = p.id;

select * from authors_posts_view;

create table subscribers(
    id serial primary key,
    email varchar(255)
);

alter table subscribers alter email set not null;


create table tags(
    id serial primary key,
    tag varchar(255),
    created_at timestamp default now()
);

create table posts_to_tags(
    id serial primary key,
    posts_id Integer references posts(id),
    tags Integer references tags(id)
);

create index tags_tag
on tags(tag);

alter table authors  add column github text,
    add column update_at timestamp default now();

select * from authors;