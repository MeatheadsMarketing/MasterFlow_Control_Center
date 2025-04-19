import streamlit as st
import pandas as pd

st.set_page_config(page_title="🧠 MasterFlow Clarity Hack Dashboard", layout="wide")
st.title("🧠 Clarity Hack: MasterFlow v1.0 System Map")

# Phase Overview Table
st.subheader("📘 Phase Breakdown")
phase_data = [
    ["Phase 1 – Core Control", ".sh, .py", "Launch Stack, Sync Builds", "Runs the assistant stack in one click", "✅"],
    ["Phase 2 – Logs + Sync", "Markdown, Logs", "Streamlit + Notion View", "Exports readable, shareable assistant logs", "✅"],
    ["Phase 3 – Mobile Remote", "iPad/SSH", "Remote Triggers", "Control flows from Stream Deck or iPad", "✅"],
    ["Phase 4 – Utilities", "Screen Validators", "Health Checks", "Prevents errors and folder misplacement", "✅"],
    ["Phase 5 – Final Package", "README, Scripts", "GitHub/Notion Export", "Locks and zips final system for release", "✅"],
    ["Phase 6 – Tutor Audit", "Script Folders", "Audit Reports + Grades", "Grades, tags, and explains your code quality", "✅"]
]

df = pd.DataFrame(phase_data, columns=["Phase", "Inputs", "Outputs", "Purpose", "Status"])
st.dataframe(df, use_container_width=True)

# Folder Summary Table
st.subheader("📁 Folder Role Summary")
folder_data = [
    ["/Phase_1_Core_Control/", "Launch and Sync core system runners"],
    ["/Phase_2_Log_Display/", "Preview GPT logs, Markdown files"],
    ["/Phase_3_Mobile_Remote/", "Control from iPad / Stream Deck"],
    ["/Phase_4_Utilities/", "Validate screen config and file integrity"],
    ["/Phase_5_Final_Package/", "Prepare release-ready artifacts"],
    ["/Phase_6_Tutor_Audit/", "Audit logic and file-level grades"],
    ["/FrontendFlows/", "Visual interface: dashboards, control layers"]
]
df_folders = pd.DataFrame(folder_data, columns=["Folder", "Purpose"])
st.table(df_folders)

# Clarity Hack Footer
st.markdown("---")
st.markdown("✅ **This dashboard represents a frozen snapshot of the system in its final state. Each file, folder, and phase has a defined purpose and grading record.**")
