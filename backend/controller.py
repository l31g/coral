import global
from global import session_maker, session, engine

server = None
port = None
user = None
password = None
dbtype = None
DBName = None


def sizeof(table_name):
    size = session.query(table_name).count()
    return size

def setServer(s):
    server = s

def setPort(p):
    port = p

def setUser(u):
    user = u

def setPass(p):
    password = p

def setConnType(ct):
    dbtype = ct

def setDBName(db):
    DBName = db

def connectDB():
    uri = "%s://%s:%s@%s:%s/%s" % (dbtype, user, password, server, port, DBName)
    engine = create_engine(uri, echo=True)

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