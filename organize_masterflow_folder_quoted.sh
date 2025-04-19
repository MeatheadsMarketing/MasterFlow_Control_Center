#!/bin/bash

# Use current directory (e.g., Desktop folder) as the base
BASE_FOLDER="$(pwd)"
echo "[+] Organizing MasterFlow files in: $BASE_FOLDER"

# Dry-run mode
DRY_RUN=false
if [ "$1" == "--dry-run" ]; then
  DRY_RUN=true
  echo "⚠️ Dry-run enabled. No files will be moved."
fi

# Target folders
folders=(
  "Phase_1_Core_Control"
  "Phase_2_Log_Display"
  "Phase_3_Mobile_Remote"
  "Phase_4_Utilities"
  "Phase_5_Final_Package"
  "Simulators"
)

for folder in "${folders[@]}"; do
  mkdir -p "$BASE_FOLDER/$folder"
done

# File-to-folder mappings using quoted keys (zsh-safe)
declare -A files
files["MasterFlow_Deployment_Kit_CoreControl.zip"]="Phase_1_Core_Control"
files["MasterFlow_LogDisplay_SyncScripts.zip"]="Phase_2_Log_Display"
files["MasterFlow_Phase3_Mobile_StreamDeck.zip"]="Phase_3_Mobile_Remote"
files["MasterFlow_Phase4_SystemUtilities.zip"]="Phase_4_Utilities"
files["MasterFlow_FinalPhase_Packaging.zip"]="Phase_5_Final_Package"
files["MasterFlow_Simulators.zip"]="Simulators"

# Move files or simulate
for file in "${!files[@]}"; do
  src="$BASE_FOLDER/$file"
  dest="$BASE_FOLDER/${files[$file]}"
  if [ -f "$src" ]; then
    if $DRY_RUN; then
      echo "[DRY-RUN] Would move: $file -> $dest/"
    else
      mv "$src" "$dest/"
      echo "[✓] Moved: $file -> $dest/"
    fi
  else
    echo "[!] File not found: $file"
  fi
done

echo "[✓] Folder organization process complete."
