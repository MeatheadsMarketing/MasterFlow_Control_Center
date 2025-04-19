import streamlit as st
import importlib.util
import os

st.set_page_config(page_title="🧠 FrontendFlow Launcher", layout="wide")
st.title("🚀 FrontendFlow – Auto-Tab Launcher")

TAB_FOLDER = "FrontendFlow/dashboards/"
tabs = {}

# Dynamically discover dashboards
for section in os.listdir(TAB_FOLDER):
    section_path = os.path.join(TAB_FOLDER, section)
    if os.path.isdir(section_path):
        for file in os.listdir(section_path):
            if file.endswith(".py") and not file.startswith("__"):
                label = f"{section.replace('_', ' ').title()} – {file.replace('_', ' ').replace('.py', '').title()}"
                tabs[label] = os.path.join(section_path, file)

# Sidebar tab selector
selected = st.sidebar.radio("📂 Select Dashboard", list(tabs.keys()))

# Dynamic tab loader
tab_path = tabs[selected]
with open(tab_path, "r") as f:
    code = f.read()
exec(code, globals())
