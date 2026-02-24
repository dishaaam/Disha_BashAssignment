#!/bin/bash

echo "===== AUTOMATED BACKUP SCRIPT ====="
echo ""

# Take source directory
read -p "Enter directory to backup: " source

# Check if source exists
if [ ! -d "$source" ]; then
    echo "Source directory does not exist."
    exit 1
fi

# Take destination directory
read -p "Enter backup destination: " destination

# Create destination if not exists
mkdir -p "$destination"

# Ask backup type
echo ""
echo "Backup Type:"
echo "1. Simple copy"
echo "2. Compressed archive (tar.gz)"
read -p "Enter choice: " choice

# Timestamp
timestamp=$(date +%Y%m%d_%H%M%S)

# Backup name
backup_name="backup_$timestamp"

# Start time
start=$(date +%s)

echo ""
echo "[*] Starting backup..."
echo "[*] Source: $source"
echo "[*] Destination: $destination"

if [ "$choice" -eq 1 ]; then
    cp -r "$source" "$destination/$backup_name"
    final_path="$destination/$backup_name"
    echo "[*] Simple copy created..."

elif [ "$choice" -eq 2 ]; then
    tar -czf "$destination/$backup_name.tar.gz" "$source"
    final_path="$destination/$backup_name.tar.gz"
    echo "[*] Compressed archive created..."

else
    echo "Invalid choice."
    exit 1
fi

# End time
end=$(date +%s)
duration=$((end - start))

# Verify backup
if [ -e "$final_path" ]; then
    echo ""
    echo "Backup completed successfully!"
else
    echo "Backup failed."
    exit 1
fi

# Get size
size=$(du -sh "$final_path" | awk '{print $1}')

echo ""
echo "===== Backup Details ====="
echo "File: $(basename "$final_path")"
echo "Location: $destination"
echo "Size: $size"
echo "Time taken: $duration seconds"
echo ""
