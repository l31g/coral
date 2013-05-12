import sqlalchemy
import types, new
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, ForeignKey, String
from sqlalchemy.schema import PrimaryKeyConstraint


server = None
port = None
user = None
password = None
dbtype = None
DBName = None

Base = declarative_base()
session_maker = sessionmaker()
engine = None
session = None



def funcToMethod(func, clas, method_name=None):
   setattr(clas, method_name or func.__name__, func)

def global_get(table_name, **kwargs):

    results = list()
    global session
    for instance in session.query(table_name).filter_by(**kwargs):
        results.append(instance)

    return results

def sizeof(query_result):

    num = query_result.count()
    return int(num)

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
    global engine, session, session_maker
    #remember to add the @

    if (dbtype == "sqlite"):
        uri = "%s:///:memory:" % (dbtype)
    else:
        uri = "%s://%s:%s@%s:%s/%s" % (dbtype, user, password, server, port, DBName)
    #print uri + "\n"
    engine = create_engine(uri, echo=False)

    engine.execute("select 1").scalar()

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
