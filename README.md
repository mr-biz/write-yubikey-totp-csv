# write-yubikey-totp-csv

This script automates the process of adding Time-based One-Time Password (TOTP) accounts to your YubiKey from a CSV file. It's particularly useful for users migrating from password managers or other TOTP applications to YubiKey.

## Features

- Processes CSV files exported from password managers
- Automatically fixes common issues with base32-encoded secrets
- Skips invalid entries and provides error messages
- Supports batch adding of multiple TOTP accounts

## Prerequisites

- A YubiKey device
- Python 3.6+
- YubiKey Manager CLI (ykman)
- pandas library for Python

## Installation

1. Ensure you have Python 3.6 or later installed on your system.

2. Install the YubiKey Manager CLI:
   `pip install yubikey-manager`

3. Install the pandas library:
   `pip install pandas`

4. Clone this repository:
   `git clone https://github.com/mr-biz/write-yubikey-totp-csv.git`
   `cd write-yubikey-totp-csv`

5. Make the script executable:
   `chmod +x write-yubikey-totp-csv.sh`

## Usage

1. Prepare your CSV file with the following columns:
   name,login_username,secret

2. Edit the `write-yubikey-totp-csv.sh` script to point to your CSV file:
   CSV_FILE="/path/to/your/totp.csv"

3. Run the script:
   `./write-yubikey-totp-csv.sh`

4. Follow the prompts to add TOTP accounts to your YubiKey.

## Removing TOTP Codes

To remove all TOTP codes from your YubiKey:

`ykman oath reset`

**Warning**: This will delete all OATH accounts stored on your YubiKey.

## Troubleshooting

- Ensure your YubiKey is properly connected and recognized by your system.
- If you encounter "Permission denied" errors, make sure the script is executable.
- For "No YubiKey detected" errors, try reinserting your YubiKey or using a different USB port.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check [issues page](https://github.com/mr-biz/write-yubikey-totp-csv/issues) if you want to contribute.

## License

[MIT](https://choosealicense.com/licenses/mit/)
