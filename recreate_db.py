from src.models import db, User, Requirement, Task


def recreate_database():
    db.connect()

    try:
        db.drop_tables([User, Requirement, Task])
    except:
        db.rollback()

    db.create_tables([User, Requirement, Task])

    db.close()


if __name__ == "__main__":
	recreate_database()
