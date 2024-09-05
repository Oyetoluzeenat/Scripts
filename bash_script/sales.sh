# Database connection details
DB_NAME="posey"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"

# echo "Hello bash1!"

# Directory containing the CSV files
CSV_DIR="parch_posey"

# List of CSV files
CSV_FILES=("accounts.csv" "orders.csv" "region.csv" "sales_reps.csv" "web_events.csv")

# Table names corresponding to each CSV file
TABLES=("accounts" "orders" "region" "sales_reps" "web_events")

# Full path to the CSV file
FULL_PATH="$CSV_DIR/$CSV_FILE"

# Loop through CSV files and corresponding table names
for i in "${!CSV_FILES[@]}"; do
    CSV_FILE="${CSV_FILES[$i]}"
    TABLE="${TABLES[$i]}"

    # Full path to the CSV file
    FULL_PATH="$CSV_DIR/$CSV_FILE"

    echo "Processing $CSV_FILE into table $TABLE..."

    # Check if the CSV file exists before processing
    if [ -f "$FULL_PATH" ]; then
        echo "File $FULL_PATH exists, ready to copy into $TABLE."
        
        # Add your psql COPY command here, for example:
        psql -U "$DB_USER" -h "$DB_HOST" -d "$DB_NAME" -c "\COPY \"$TABLE\" FROM '$FULL_PATH' WITH (FORMAT csv, HEADER true);"

        # You could also add error checking here if the psql command fails

    else
        echo "File $FULL_PATH does not exist. Skipping..."
    fi
done