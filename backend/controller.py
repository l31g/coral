import global
from global import session_maker, session, engine

def sizeof(table_name):
    size = session.query(table_name).count()
    return size

def connectDB(dialect):
    engine = create_engine(dialect, echo=True)

    session_maker.configure(bind=engine)
    session = session_maker()
    if(session is not None):
        return True
    else:
        return False

def objcomp(obj1, obj2):
    return (obj1 is obj2)

def save():
    global session
    session.commit()

def objClass(obj):
    return obj.__class__