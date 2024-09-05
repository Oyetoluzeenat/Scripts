# URL of the CSV file to download
FILE_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

# Name of the output file
OUTPUT_FILE="annual-enterprise-survey-2023-financial-year-provisional.csv"

# Create the 'raw' directory if it doesn't exist
mkdir -p raw

# Use curl to download the file
curl -o raw/$OUTPUT_FILE $FILE_URL

# Notify the user of the download status

if [ $? -eq 0 ]; then
    echo "File downloaded successfully and saved as raw"
else
    echo "Failed to download the file"
fi

# Input and output file names
input_file="raw/annual-enterprise-survey-2023-financial-year-provisional.csv"
output_dir="Transformed"
output_file="$output_dir/2023_year_finance.csv"

# Ensure the output directory exists
mkdir -p "$output_dir"

# Select and reorder columns, and save to the output file
awk -F',' 'BEGIN {OFS=","} 
NR==1 {
    # Find the column indices for the desired columns
    for (i=1; i<=NF; i++) {
        if ($i == "year") year_idx=i;
        else if ($i == "Value") value_idx=i;
        else if ($i == "Units") units_idx=i;
        else if ($i == "variable_code") variable_code_idx=i;
    }
    # Print the header for the selected columns
    print "year", "Value", "Units", "variable_code"
} 
NR>1 {
    # Print the selected columns based on the indices found in the header row
    print $year_idx, $value_idx, $units_idx, $variable_code_idx
}' "$input_file" > "$output_file"

# Confirm that the file was saved to the directory
if [ -f "$output_file" ]; then
    echo "The file has been successfully saved to $output_dir."
else
    echo "There was an error saving the file."
fi

# Make directory
mkdir -p "Gold"

# Move the transformed data to the Gold directory
mv "Transformed/2023_year_finance.csv" "Gold/2023_year_finance.csv"