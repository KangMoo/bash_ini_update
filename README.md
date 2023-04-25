# INI File Modification Script Usage

This script modifies the value of a given section and key in an INI file. If the specified section and key do not exist, the script adds a new value.

## Example

You must source the bash file into your script:

``` bash
> . update_config.sh
```

Suppose you have a sample INI file (`config.ini`) like the following:
``` ini
[database]
host = localhost
port = 3306
```

To use the script to change the `host` value to `new_host_value`, call the script as follows:

``` ini
update_config "config.ini" "database" "host" "new_host_value"
```

The `config.ini` file will then be modified as shown below:

``` ini
[database]
host = new_host_value
port = 3306
```

## Usage

1. Save this script as a separate file (e.g., `update_ini.sh`).
2. Source the script where needed. Example: `source "update_ini.sh"`
3. Call the `update_config` function to modify the values in the INI file.

## Arguments
When calling the `update_config` function, provide the following arguments:

- `ini_file`: Path to the INI file to modify
- `section`: Configuration section to change
- `key`: Configuration key to change
- `new_value`: New value to assign to the configuration key

## Note

- This script works well for most general use cases. However, it may not work perfectly for very complex INI file structures.
- The script creates a temporary file named `temp.ini` during execution. If a file with the same name already exists in the directory, it will be overwritten. Make sure to backup or rename any existing `temp.ini` files before running the script.
