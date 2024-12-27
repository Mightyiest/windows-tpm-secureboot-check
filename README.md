# windows-tpm-secureboot-check

A simple batch script to check TPM 2.0 and Secure Boot status on Windows systems, along with displaying motherboard information. Provides color-coded output for easy readability.

## Features

*   Checks if TPM 2.0 is **Enabled** or **Disabled/Not Found**.
*   Checks if Secure Boot is **Enabled** or **Disabled**.
*   Displays Motherboard **model, manufacturer, version, and serial number**.
*   Color-coded output:
    *   **Green:** Enabled
    *   **Red:** Disabled or Not Found
*   Easy to use - just run the `.bat` file as administrator.

## Requirements

*   Windows 10 or Windows 11 (older versions might work but are not officially tested).
*   Administrator privileges to run the script.
*   A console/terminal that supports ANSI escape codes for colored output (most modern terminals do, including the standard Command Prompt in recent Windows versions).

## How to Use

1.  Download the `check_tpm_secureboot.bat` file from this repository.
2.  Right-click on the `check_tpm_secureboot.bat` file and select "Run as administrator".
3.  The script will output the TPM 2.0 status, Secure Boot status, and motherboard information to the console.

## Screenshot

## Notes

*   The script uses `wmic` (Windows Management Instrumentation Command-line) to retrieve motherboard information. Ensure that `wmic` is not disabled or removed from your system.
*   If you are using an older or very basic terminal that does not support ANSI escape codes, you can modify the script to remove the color-coding. See the [previous conversation history] (link to this chat) for a non-colored version.

## Contributing

Feel free to open issues or pull requests to suggest improvements or report bugs.

## License

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.
