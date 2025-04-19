#!/bin/bash

BASE_FOLDER="$(pwd)"
echo "[+] Organizing MasterFlow files in: $BASE_FOLDER"

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

# Move files using manual if-blocks
move_file() {
  filename="$1"
  target_folder="$2"
  src="$BASE_FOLDER/$filename"
  dest="$BASE_FOLDER/$target_folder"

  if [ -f "$src" ]; then
    if $DRY_RUN; then
      echo "[DRY-RUN] Would move: $filename -> $target_folder/"
    else
      mv "$src" "$dest/"
      echo "[✓] Moved: $filename -> $target_folder/"
    fi
  else
    echo "[!] File not found: $filename"
  fi
}

move_file "MasterFlow_Deployment_Kit_CoreControl.zip" "Phase_1_Core_Control"
move_file "MasterFlow_LogDisplay_SyncScripts.zip" "Phase_2_Log_Display"
move_file "MasterFlow_Phase3_Mobile_StreamDeck.zip" "Phase_3_Mobile_Remote"
move_file "MasterFlow_Phase4_SystemUtilities.zip" "Phase_4_Utilities"
move_file "MasterFlow_FinalPhase_Packaging.zip" "Phase_5_Final_Package"
move_file "MasterFlow_Simulators.zip" "Simulators"

echo "[✓] Folder organization process complete."
