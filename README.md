# CSV File Selector and Viewer

This Ruby script allows you to fetch all CSV files from a specified directory, select one of them via a user-friendly prompt, and display its contents in a neatly formatted table. The script uses a multi-class design pattern to separate the fetching, selecting, and reading functionalities for better code organization.

## Features

- **CSV File Fetching**: Scans a specific directory to find all `.csv` files.
- **User-friendly Selection**: Displays the list of files using `tty-prompt` for easy selection.
- **CSV File Reading**: Reads and displays the contents of the selected CSV file in a table format using the `csv` and `console_table` gems.

## Gems Used

The following gems are required to run this script:

- `tty-prompt` - For creating interactive prompts.
- `csv` - For reading the CSV files.
- `console_table` - For displaying the CSV content in a table format.

