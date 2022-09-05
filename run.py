from db.session import get_session
from db.tables.tables import Persons

with get_session() as db_session:
    new_person = Persons(
        name='Emi',
        surname='Dobrian',
        birth_date='1999-07-22'
    )
    db_session.add(new_person)
    db_session.commit()

    my_user = db_session.query(Persons).filter(Persons.id == 1).first()
    db_session.delete(my_user)
    db_session.commit()

    my_user = db_session.query(Persons).filter(Persons.id == 2).first()

    change_user = db_session.query(Persons).filter(Persons.id == 1).first()
    change_user.name = 'New'
    db_session.commit()
