import streamlit as st
import json
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import pymysql.cursors
from models import (
    Missione,
    Piattaforma,
    ModelloStadio,
    Stadio,
    Allegato,
    TipoAllegato,
    Strumento,
    StadioStrumento,
)

with open("config.json") as f:
    config = json.load(f)

# Uso pymysql per evitare probelemi con il formato della password
conn_str = f"mysql+pymysql://{config['user']}:{config['password']}@{config['host']}:{config['port']}/progettobosio"
engine = create_engine(conn_str)
session = sessionmaker(bind=engine)()
conn = engine.raw_connection()

cursor = conn.cursor(pymysql.cursors.DictCursor)

st.title("Gestione Missioni Spaziali")

menu = st.sidebar.selectbox(
    "Selezione operazione",
    [
        "Missioni per sito di lancio",
        "Moduli per missione",
        "Aggiunta stadio",
        "Rimuozione stadio",
        "Estrazione allegati",
        "Impostazione conteggio strumentazione",
        "Visualizzazione tabelle",
    ],
)

if menu == "Missioni per sito di lancio":
    piattaforme = session.query(Piattaforma).all()
    piattaforma = st.selectbox(
        "Seleziona piattaforma", piattaforme, format_func=lambda p: p.Nome
    )  # Uso i dati veri per il menu invece che chiedere input libero
    skip = st.number_input("Skip", min_value=0)
    take = st.number_input("Take", min_value=1)

    missioni = (
        session.query(Missione)
        .filter_by(PiattaformaId=piattaforma.Id)
        .order_by(Missione.Data.desc())
        .offset(skip)
        .limit(take)
        .all()
    )

    for m in missioni:
        st.write(f"{m.Nome} ({m.Data}): {m.Descrizione}")

elif menu == "Moduli per missione":
    missioni = session.query(Missione).all()
    missione = st.selectbox(
        "Missione", missioni, format_func=lambda m: m.Nome
    )  # Uso i dati veri per il menu invece che chiedere input libero
    stadi = (
        session.query(Stadio)
        .filter_by(IdMissione=missione.Numero)
        .order_by(Stadio.Posizione.asc())
        .all()
    )

    for s in stadi:
        strumenti = session.query(StadioStrumento).filter_by(IdStadio=s.Id).all()
        mappa = {str.IdStrumento: str.Numero for str in strumenti}
        modello = session.query(ModelloStadio).filter_by(Id=s.IdModello).first()
        st.write(f"[{s.Posizione}] Modello: {modello.Nome} (ver: {s.CodiceVersione})")
        if len(mappa) > 0:
            st.write(f"|- Attrezzatura: {mappa}")

elif menu == "Aggiunta stadio":
    missioni = session.query(Missione).all()
    modelli = session.query(ModelloStadio).all()
    missione = st.selectbox("Missione", missioni, format_func=lambda m: m.Nome)
    modello = st.selectbox("Modello", modelli, format_func=lambda m: m.Nome)
    versione = st.number_input("Codice Versione", min_value=0)
    note = st.text_area("Note (facoltative)")
    attaccoPrev = st.text_input("Codice attacco precedente (facoltativo)")

    if st.button("Aggiungi"):
        try:
            cursor.callproc(
                "AggiungiStadioMissione",
                (missione.Numero, modello.Id, versione, note, attaccoPrev or None),
            )
            conn.commit()
            st.success("Stadio aggiunto con successo")
        except pymysql.MySQLError as err:
            st.error(f"Errore MySQL: {err.msg}")

elif menu == "Rimuozione stadio":
    missioni = session.query(Missione).all()
    missione = st.selectbox("Missione", missioni, format_func=lambda m: m.Nome)
    posizione = st.number_input("Posizione da rimuovere", min_value=1)

    if st.button("Rimuovi"):
        try:
            cursor.callproc("RimuoviStadioMissione", (missione.Numero, posizione))
            conn.commit()
            st.success("Stadio rimosso correttamente")
        except pymysql.MySQLError as err:
            st.error(f"Errore MySQL: {err.msg}")

elif menu == "Estrazione allegati":
    missioni = session.query(Missione).all()
    missione = st.selectbox("Missione", missioni, format_func=lambda m: m.Nome)
    pubblico = st.radio(
        "Destinazione",
        [True, False],
        format_func=lambda x: "Pubblico" if x else "Interno",
    )

    try:
        allegati = (
            session.query(Allegato, Missione, TipoAllegato)
            .join(Missione, Missione.Numero == Allegato.IdMissione)
            .join(TipoAllegato, TipoAllegato.Id == Allegato.IdTipo)
            .filter(Missione.Numero == missione.Numero)
            .filter((TipoAllegato.VisibileAlPubblico == True) | (pubblico == True))
            .all()
        )

        if allegati:
            st.dataframe(
                [
                    {
                        "Nome": allegato.Allegato.Nome,
                        "Path": allegato.Allegato.Path,
                        "Tipo": allegato.TipoAllegato.Nome,
                    }
                    for allegato in allegati
                ]
            )
        else:
            st.info(f"Nessun allegato valido")
    except pymysql.MySQLError as err:
        st.error(f"Errore MySQL: {err.args[1]}")

elif menu == "Impostazione conteggio strumentazione":
    stadi = session.query(Stadio).all()
    strumenti = session.query(Strumento).all()

    stadio = st.selectbox(
        "Stadio",
        stadi,
        format_func=lambda s: f"Stadio {s.Id} (Missione {s.IdMissione})",
    )
    strumento = st.selectbox("Strumento", strumenti, format_func=lambda s: s.Nome)
    numero = st.number_input("Quantità", min_value=0)

    if st.button("Aggiorna"):
        try:
            cursor.callproc(
                "ImpostaQuantitaStrumentoStadio",
                (stadio.Id, strumento.CodiceComponente, numero),
            )
            conn.commit()
            st.success("Quantità aggiornata")
        except pymysql.MySQLError as err:
            st.error(f"Errore MySQL: {err.msg}")

elif menu == "Visualizzazione tabelle":
    tabelle = {
        "missione": Missione,
        "piattaforma": Piattaforma,
        "modellostadio": ModelloStadio,
        "strumento": Strumento,
        "stadio": Stadio,
        "stadio_strumento": StadioStrumento,
        "allegato": Allegato,
        "tipoallegato": TipoAllegato,
    }

    tabella_nome = st.selectbox("Tabella", list(tabelle.keys()))
    skip = st.number_input("Skip", min_value=0)
    take = st.number_input("Take", min_value=1, value=10)

    model = tabelle[tabella_nome]
    try:
        risultati = session.query(model).offset(skip).limit(take).all()
        rows = []
        for r in risultati:
            d = dict(r.__dict__)
            d.pop(
                "_sa_instance_state", None
            )  # Rimuovo un oggetto di sqlAlchemy che non va serializzato
            rows.append(d)
        st.dataframe(rows)
    except Exception as e:
        st.error(f"Errore: {str(e)}")

cursor.close()
conn.close()
session.close()
