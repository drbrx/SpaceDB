from sqlalchemy import (
    create_engine, Column, Integer, String, ForeignKey,
    Float, Boolean, Text, DateTime
)
from sqlalchemy.orm import relationship, declarative_base

Base = declarative_base()

class Piattaforma(Base):
    __tablename__ = 'piattaforma'
    Id = Column(Integer, primary_key=True)
    Nome = Column(String(64), nullable=False)
    Longitudine = Column(Float, nullable=False)
    Latitudine = Column(Float, nullable=False)

class TipoAllegato(Base):
    __tablename__ = 'tipoallegato'
    Id = Column(Integer, primary_key=True)
    Nome = Column(String(64), nullable=False)
    VisibileAlPubblico = Column(Boolean, nullable=False)

class Missione(Base):
    __tablename__ = 'missione'
    Numero = Column(Integer, primary_key=True)
    Nome = Column(String(128), nullable=False)
    Descrizione = Column(Text, nullable=False)
    Data = Column(DateTime, nullable=False)
    PiattaformaId = Column(Integer, ForeignKey('piattaforma.Id'), nullable=False)

class Allegato(Base):
    __tablename__ = 'allegato'
    Id = Column(Integer, primary_key=True)
    Nome = Column(String(64), nullable=False)
    Path = Column(String(256), nullable=False)
    IdTipo = Column(Integer, ForeignKey('tipoallegato.Id'), nullable=False)
    IdMissione = Column(Integer, ForeignKey('missione.Numero'), nullable=False)

class ModelloStadio(Base):
    __tablename__ = 'modellostadio'
    Id = Column(Integer, primary_key=True)
    Nome = Column(String(64), nullable=False)
    Descrizione = Column(Text, nullable=False)

class Strumento(Base):
    __tablename__ = 'strumento'
    CodiceComponente = Column(String(32), primary_key=True)
    Nome = Column(String(64), nullable=False)

class Stadio(Base):
    __tablename__ = 'stadio'
    Id = Column(Integer, primary_key=True)
    CodiceVersione = Column(Integer, nullable=False)
    Posizione = Column(Integer, nullable=False)
    Note = Column(Text)
    IdAttaccoStadioPrecedente = Column(String(32), ForeignKey('strumento.CodiceComponente'))
    IdAttaccoStadioSuccessivo = Column(String(32), ForeignKey('strumento.CodiceComponente'))
    IdMissione = Column(Integer, ForeignKey('missione.Numero'), nullable=False)
    IdModello = Column(Integer, ForeignKey('modellostadio.Id'), nullable=False)

class StadioStrumento(Base):
    __tablename__ = 'stadio_strumento'
    IdStadio = Column(Integer, ForeignKey('stadio.Id'), primary_key=True)
    IdStrumento = Column(String(32), ForeignKey('strumento.CodiceComponente'), primary_key=True)
    Numero = Column(Integer, nullable=False)