"""E-Motion | Value Network monitoring — tableau de bord PLM.

Lancement Windows : demarrer.bat (depuis le dossier du projet).
"""
from pathlib import Path

import streamlit as st

st.set_page_config(page_title="E-Motion | Value Network monitoring", layout="wide",
                   initial_sidebar_state="collapsed")

from views import exchange, risk, structure, suppliers  # noqa: E402
from views.common import get_data  # noqa: E402

st.logo(str(Path(__file__).parent / "assets" / "logo.svg"), size="large")
pages = [
    st.Page(structure.render, title="Structure produit", url_path="structure", default=True),
    st.Page(suppliers.render, title="Analyse par pays", url_path="fournisseurs"),
    st.Page(risk.render, title="Analyse coût & risque", url_path="risques"),
]
nav = st.navigation(pages, position="top")
get_data()
exchange.render()
nav.run()
