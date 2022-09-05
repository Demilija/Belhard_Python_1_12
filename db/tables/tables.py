from db.base import Base
from sqlalchemy import Column, Integer, String, DATETIME, Float, ForeignKey


class Persons(Base):
    __tablename__ = 'persons'

    id = Column(Integer(), nullable=False, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    surname = Column(String(50), nullable=False)
    birth_date = Column(DATETIME, nullable=False)


class UserTypes(Base):
    __tablename__ = 'user_types'

    id = Column(String(), nullable=False, primary_key=True)
    name = Column(String(), nullable=False)


class Users(Base):
    __tablename__ = 'users'

    login = Column(String(), nullable=False, primary_key=True)
    password = Column(String(), nullable=False)
    user_type_id = Column(String(), ForeignKey('user_types.id'), nullable=False)
    person_id = Column(Integer(), ForeignKey('persons.id'), nullable=False)


class Emails(Base):
    __tablename__ = 'emails'

    id = Column(Integer(), nullable=False, primary_key=True, autoincrement=True)
    email = Column(String(), nullable=False)
    user_login = Column(String(), ForeignKey('users.login'), nullable=False)


class Genres(Base):
    __tablename__ = 'genres'

    id = Column(String(), primary_key=True, nullable=False)
    name = Column(String(), nullable=False)


class Films(Base):
    __tablename__ = 'films'

    id = Column(Integer(), nullable=False, primary_key=True, autoincrement=True)
    duration = Column(Integer(), nullable=False)
    name = Column(String(), nullable=False)
    release_date = Column(DATETIME, nullable=False)
    rating = Column(Float, nullable=False)
    directors_id = Column(Integer(), ForeignKey('persons.id'), nullable=False)


class UserFavoriteFilms(Base):
    __tablename__ = 'user_favorite_films'

    user_login = Column(String(), ForeignKey('users.login'), nullable=False, primary_key=True)
    film_id = Column(Integer(), ForeignKey('films.id'), nullable=False)


class FilmsGenres(Base):
    __tablename__ = 'films_genres'

    film_id = Column(Integer(), ForeignKey('films.id'), primary_key=True)
    film_genre_id = Column(String(), ForeignKey('genres.id'), nullable=False, primary_key=True)


class Charecters(Base):
    __tablename__ = 'charecters'

    id = Column(Integer(), nullable=False, primary_key=True, autoincrement=True)
    name = Column(String(), nullable=False)
    comment = Column(String())
    film_id = Column(Integer(), ForeignKey('films.id'), nullable=False)


class CharactersActors(Base):
    __tablename__ = 'characters_actors'

    character_id = Column(Integer(), ForeignKey('charecters.id'), nullable=False, primary_key=True)
    person_id = Column(Integer(), ForeignKey('persons.id'), nullable=False, primary_key=True)
