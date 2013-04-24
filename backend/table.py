import global
from global import session_maker, session, engine, Base

#Table definitions from Code Generator
#Plus add the following functions:

#CoRAL: isTaking(Class.name cName) {}
#CoRAL: Class.get(key:credits greaterthan:4.0)
def findBy(table_name, *kwargs):
    result = session.query(table_name).filter_by(kwargs)
    return result

#Default constructor for classes:
#ClassName(attr1='', attr2='') or ClassName('', '')

#Other translations:
#CoRAL: semesters = <“fall”, 2009 | “spring”, 2010>
semesters_class = objClass(semesters)
semesters_class("fall", 2009)
semesters_class("spring", 2010)
