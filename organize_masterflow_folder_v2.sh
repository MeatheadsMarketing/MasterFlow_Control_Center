#!/bin/bash

# Default base folder (update if iCloud Drive path differs)
DEFAULT_PATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Master_Flow_Command_Center"
ALT_PATH="$HOME/iCloud Drive/Master_Flow_Command_Center"

# Determine correct iCloud folder path
if [ -d "$DEFAULT_PATH" ]; then
  BASE_FOLDER="$DEFAULT_PATH"
elif [ -d "$ALT_PATH" ]; then
  BASE_FOLDER="$ALT_PATH"
else
  echo "✗ iCloud folder not found. Please update BASE_FOLDER manually."
  exit 1
fi

echo "[+] Organizing MasterFlow files in: $BASE_FOLDER"

# Dry-run mode support
DRY_RUN=false
if [ "$1" == "--dry-run" ]; then
  DRY_RUN=true
  echo "⚠️ Dry-run enabled. No files will be moved."
fi

# Create folders
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

# File-to-folder mappings
declare -A files=(
  ["MasterFlow_Deployment_Kit_CoreControl.zip"]="Phase_1_Core_Control"
  ["MasterFlow_LogDisplay_SyncScripts.zip"]="Phase_2_Log_Display"
  ["MasterFlow_Phase3_Mobile_StreamDeck.zip"]="Phase_3_Mobile_Remote"
  ["MasterFlow_Phase4_SystemUtilities.zip"]="Phase_4_Utilities"
  ["MasterFlow_FinalPhase_Packaging.zip"]="Phase_5_Final_Package"
  ["MasterFlow_Simulators.zip"]="Simulators"
)

# Move or simulate moving
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
