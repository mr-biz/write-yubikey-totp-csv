#!/bin/bash

CSV_FILE="/path/to/your/totp.csv"


if [ ! -f "$CSV_FILE" ]; then
  echo "CSV file not found: $CSV_FILE"
  exit 1
fi

fix_base32() {
  local secret=$1
  echo "$secret" | tr -d '=' | tr '[:lower:]' '[:upper:]' | tr '01' 'OI'
}

# Skip the header row
tail -n +2 "$CSV_FILE" | while IFS=, read -r name login_username secret; do
  if [ -z "$name" ] || [ -z "$login_username" ] || [ -z "$secret" ]; then
    continue # Skip lines with missing data
  fi

  fixed_secret=$(fix_base32 "$secret")

  if ! [[ "$fixed_secret" =~ ^[A-Z2-7]+$ ]]; then
    echo "Invalid base32 secret for $name: $secret"
    continue
  fi

  echo "Adding TOTP for $name"
  echo "Original secret: $secret"
  echo "Fixed secret: $fixed_secret"
  ykman oath accounts add "$name" "$fixed_secret"
done
