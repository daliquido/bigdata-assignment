import pandas as pd
import os

DATA_DIR = "data/f7"
OUTPUT_DIR = "data/cleaned"

os.makedirs(OUTPUT_DIR, exist_ok=True)

def clean_csv(file_name):
  def clean_csv(file_name):

      # Read the CSV file
    df = pd.read_csv(os.path.join(DATA_DIR, file_name))

    # Remove duplicate rows
    df = df.drop_duplicates()

    # Replace empty strings with NaN
    df = df.replace("", pd.NA)

    # Drop rows where all values are missing
    df = df.dropna(how="all")

    # Convert date columns if they exist
    date_columns = [
        "event_time",
        "date",
        "sent_at",
        "started_at",
        "finished_at",
        "first_purchase_date"
    ]

    for col in date_columns:
        if col in df.columns:
            df[col] = pd.to_datetime(df[col], errors="coerce")

    # Save cleaned CSV
    output_path = os.path.join(OUTPUT_DIR, file_name)
    df.to_csv(output_path, index=False)

    print(f"Saved cleaned file to {output_path}")


files = [
    "events.csv",
    "campaigns.csv",
    "messages.csv",
    "friends.csv",
    "client_first_purchase_date.csv"
]

for f in files:
    clean_csv(f)

print("Data cleaning completed.")
