# Recursive File Organizer

**Recursive File Organizer** is a Bash script designed to automate the process of organizing and sorting files into specific directories based on their types. The script prompts the user to create or name directories, then recursively scans a given directory (or a default one) and moves files like executables, libraries, source files, and header files into their respective folders.

This script is particularly useful for developers who want to maintain a clean and organized file structure without manually sorting files. With the ability to handle nested directories and check for existing files, **Recursive File Organizer** ensures that your workspace remains tidy and efficient.

## Prerequisites

To successfully run **Recursive File Organizer**, ensure that your system meets the following requirements:

- **Operating System**: Linux (the script is designed specifically for Linux systems and may not work correctly on other operating systems).
- **Bash Version**: The script is compatible with Bash versions 4.x and above.
- **Permissions**: Ensure that you have the necessary permissions to create directories and move files within your working directory.
- **Test Directory**: A directory named `testfiles` on your desktop (or another directory specified by you) should contain some executable files, libraries, C source files, and header files for testing purposes.

## Installation

1. **Clone the Repository**: Start by cloning the `Bash-Scripting-Projects` repository to your local machine and then move the `Recursive File Organizer` folder from the repository to your Desktop directory:

```bash
    git clone https://github.com/dbouros/Bash-Scripting-Projects.git
```

2. **Navigate to the Desktop Directory**: Ensure you are in the Desktop directory where the script should be executed:

```bash
    cd ~/Desktop
```

3. **Make the Script Executable**: Grant execute permissions to the script:

```bash
    chmod +x RecursiveFileOrganizer.sh
```

## Running the Project

To run the script, ensure that the file `RecursiveFileOrganizer.sh` is placed and executed inside the Desktop directory, then you have two main options:

1. **With Default Settings**: If you want to organize files from the `testfiles` directory on your desktop, simply execute the script without any arguments (Make sure you have a `testfiles` directory on your desktop containing some executable files, libraries, C source files, and header files for testing purposes):

``` bash
    ./RecursiveFileOrganizer.sh
```

2. **With Custom Directories**: You can also specify directories as arguments when running the script. The script will organize the files within those directories (Those files still need to be executable files, libraries, C source files, and header files):

```bash
    ./RecursiveFileOrganizer.sh dir1 dir2 dir3
```

## Script Prompts

Upon running the script, you will be asked whether you want to create the default set of folders (`bin`, `lib`, `src`, `inc`). These will be the  folders that will contain your organized files according to their type. If you choose not to use the default folders, you will be prompted to provide custom names for these folders and they will be created at the home directory `~/` with the names you provided.

## Output

After processing, the script will display the number of files moved to each directory, helping you quickly verify the organization process.
