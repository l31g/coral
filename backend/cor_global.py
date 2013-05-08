import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, ForeignKey, String
from sqlalchemy.orm import sessionmaker
from sqlalchemy.schema import PrimaryKeyConstraint

Base = declarative_base()
session_maker = sessionmaker()
engine = None
session = None



