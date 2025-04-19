#!/bin/bash

# Define base folder
BASE_FOLDER="$HOME/iCloud Drive/Master_Flow_Command_Center"

echo "[+] Organizing MasterFlow files inside: $BASE_FOLDER"

# Create target folders
mkdir -p "$BASE_FOLDER/Phase_1_Core_Control"
mkdir -p "$BASE_FOLDER/Phase_2_Log_Display"
mkdir -p "$BASE_FOLDER/Phase_3_Mobile_Remote"
mkdir -p "$BASE_FOLDER/Phase_4_Utilities"
mkdir -p "$BASE_FOLDER/Phase_5_Final_Package"
mkdir -p "$BASE_FOLDER/Simulators"

# Move files into proper folders
mv "$BASE_FOLDER"/MasterFlow_Deployment_Kit_CoreControl.zip "$BASE_FOLDER/Phase_1_Core_Control/"
mv "$BASE_FOLDER"/MasterFlow_LogDisplay_SyncScripts.zip "$BASE_FOLDER/Phase_2_Log_Display/"
mv "$BASE_FOLDER"/MasterFlow_Phase3_Mobile_StreamDeck.zip "$BASE_FOLDER/Phase_3_Mobile_Remote/"
mv "$BASE_FOLDER"/MasterFlow_Phase4_SystemUtilities.zip "$BASE_FOLDER/Phase_4_Utilities/"
mv "$BASE_FOLDER"/MasterFlow_FinalPhase_Packaging.zip "$BASE_FOLDER/Phase_5_Final_Package/"
mv "$BASE_FOLDER"/MasterFlow_Simulators.zip "$BASE_FOLDER/Simulators/"

echo "[✓] Folder organization complete."
