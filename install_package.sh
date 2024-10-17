#!/bin/bash

# Prompt the user for a comma-separated list of package names
echo "Enter the names of the packages you want to install (comma-separated):"
read package_list

# Convert the comma-separated list into an array
IFS=',' read -ra packages <<< "$package_list"

# Initialize an array to store packages that couldn't be installed
declare -a failed_packages=()

# Loop through each package in the list
for package_name in "${packages[@]}"; do
    package_name=$(echo "$package_name" | xargs)  # Trim leading/trailing whitespace

    # Check if the package exists on PyPI using pip install --dry-run
    if pip install --dry-run "$package_name" > /dev/null 2>&1; then
        echo "Installing $package_name..."

        # Install the package
        pip install "$package_name"

        # Add the package to requirements.in
        echo "$package_name" >> requirements.in

        # Compile the updated requirements.txt
        pip-compile --output-file=requirements.txt

        echo "$package_name has been installed and added to requirements.in and requirements.txt"
    else
        echo "Error: Package '$package_name' not found on PyPI."
        failed_packages+=("$package_name")  # Add to the list of failed packages
    fi
done

# Check if there were any failed installations
if [ ${#failed_packages[@]} -gt 0 ]; then
    echo "The following packages could not be installed:"
    for failed_package in "${failed_packages[@]}"; do
        echo "$failed_package"
    done
    echo "Please check the spelling of the package you wish to install and try again."
else
    echo "All packages were installed successfully!"
fi