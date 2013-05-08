import cor_global
from cor_global import session_maker, session, engine
from sqlalchemy import create_engine

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
    global server
    server = s

def setPort(p):
    global port
    port = p

def setUser(u):
    global user
    user = u

def setPass(p):
    global password
    password = p

def setConnType(ct):
    global dbtype
    dbtype = ct

def setDBName(db):
    global DBName
    DBName = db

def connectDB():
    #remember to add the @
    uri = "%s:///%s:%s%s:%s%s" % (dbtype, user, password, server, port, DBName)
    #print uri + "\n"
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