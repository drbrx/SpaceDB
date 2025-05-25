import streamlit as st
import mysql.connector
import json

db_config = {}
with open("config.json", "r") as file:
    db_config = json.load(file)

conn = mysql.connector.connect(
    host=db_config["host"],
    port=db_config["port"],
    user=db_config["user"],
    password=db_config["password"],
    database="progettobosio",
    charset="utf8mb4",
    collation="utf8mb4_general_ci",
)
cursor = conn.cursor(dictionary=True)

st.sidebar.title("Operazioni DB")
pagina = st.sidebar.selectbox(
    "OPERAZIONI",
    [
        "Missioni per sito di lancio",
        "Moduli per missione",
        "Aggiungi stadio",
        "Rimuovi stadio",
        "Estrai allegati",
        "Imposta quantità strumento",
        "Visualizza tabelle",
    ],
)

if pagina == "Missioni per sito di lancio":
    st.title("Missioni per sito di lancio")
    sito_id = st.number_input("ID piattaforma", min_value=1)
    skip = st.number_input("Skip", min_value=0)
    take = st.number_input("Take", min_value=1, value=10)
    if st.button("Mostra"):
        cursor.callproc("GetMissioniBySitoLancio", (sito_id, skip, take))
        for result in cursor.stored_results():
            st.dataframe(result.fetchall())

elif pagina == "Moduli per missione":
    st.title("Moduli usati in una missione")
    missione_id = st.number_input("ID Missione", min_value=1)
    if st.button("Estrai moduli"):
        cursor.callproc("GetModuliByMissione", (missione_id,))
        for result in cursor.stored_results():
            st.json(result.fetchall())

elif pagina == "Aggiungi stadio":
    st.title("Aggiungi uno stadio a una missione")
    idMissione = st.number_input("ID Missione", min_value=1)
    id_modello = st.number_input("ID Modello Stadio", min_value=1)
    versione = st.number_input("Codice Versione", min_value=1)
    note = st.text_area("Note (facoltativo)")
    attacco_prec = st.text_input(
        "Codice attacco stadio precedente (facoltativo)", value=""
    )
    if st.button("Aggiungi stadio"):
        try:
            cursor.callproc(
                "AggiungiStadioMissione",
                (idMissione, id_modello, versione, note, attacco_prec or None),
            )
            conn.commit()
            st.success("Stadio aggiunto con successo.")
        except mysql.connector.Error as err:
            st.error(f"Errore MySQL: {err.msg}")
        except Exception as e:
            st.error(f"Errore generico: {str(e)}")

elif pagina == "Rimuovi stadio":
    st.title("Rimuovi uno stadio da una missione")
    idMissione = st.number_input("ID Missione", min_value=1)
    posizione = st.number_input("Posizione da rimuovere", min_value=1)
    if st.button("Rimuovi stadio"):
        try:
            cursor.callproc("RimuoviStadioMissione", (idMissione, posizione))
            conn.commit()
            st.success("Stadio rimosso e posizioni aggiornate.")
        except mysql.connector.Error as err:
            st.error(f"Errore MySQL: {err.msg}")
        except Exception as e:
            st.error(f"Errore generico: {str(e)}")

elif pagina == "Estrai allegati":
    st.title("Estrai allegati di una missione")
    idMissione = st.number_input("ID Missione", min_value=1)
    pubblico = st.radio("Estrai solo allegati pubblici", [True, False])
    if st.button("Estrai allegati"):
        cursor.callproc("EstraiAllegatiMissione", (idMissione, pubblico))
        for result in cursor.stored_results():
            st.dataframe(result.fetchall())

elif pagina == "Imposta quantità strumento":
    st.title("Imposta quantità di uno strumento in uno stadio")
    idStadio = st.number_input("ID Stadio", min_value=1)
    idStrumento = st.text_input("Codice strumento")
    qty = st.number_input("Quantità", min_value=0)
    if st.button("Aggiorna quantità"):
        try:
            cursor.callproc(
                "ImpostaQuantitaStrumentoStadio", (idStadio, idStrumento, qty)
            )
            conn.commit()
            st.success("Quantità aggiornata.")
        except mysql.connector.Error as err:
            st.error(f"Errore MySQL: {err.msg}")
        except Exception as e:
            st.error(f"Errore generico: {str(e)}")

elif pagina == "Visualizza tabelle":
    st.title("Visualizza contenuto di una tabella")

    tabelle = [
        "allegato",
        "missione",
        "modellostadio",
        "piattaforma",
        "stadio",
        "stadio_strumento",
        "strumento",
        "tipoallegato",
    ]
    tabella = st.selectbox("Tabella", tabelle)

    skip = st.number_input("Skip", min_value=0)
    take = st.number_input("Take", min_value=0, value=50)

    if st.button("Carica contenuto"):
        try:
            query = f"SELECT * FROM {tabella} LIMIT %s OFFSET %s"
            cursor.execute(query, (take, skip))
            rows = cursor.fetchall()
            if rows:
                st.dataframe(rows)
            else:
                st.info("Nessun risultato.")
        except mysql.connector.Error as err:
            st.error(f"Errore MySQL: {err.msg}")
        except Exception as e:
            st.error(f"Errore generico: {str(e)}")
