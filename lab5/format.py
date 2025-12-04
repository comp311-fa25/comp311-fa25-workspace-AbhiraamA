import csv
import sys

def convert_to_csv(input_file, output_file):
    with open(input_file, 'r') as infile:
        lines = []
        for line in infile:
            stripped = line.strip()
            if not stripped:
                continue
            if stripped.lower().startswith("0x"):
                lines.append(stripped)
            else:
                lines.append(f"0x{stripped}")

    # Group instructions into chunks of 8
    grouped_instructions = [lines[i:i+8] for i in range(0, len(lines), 8)]

    # If the last group has fewer than 8 instructions, pad with "0x0"
    if grouped_instructions and len(grouped_instructions[-1]) < 8:
        grouped_instructions[-1] += ['0x0'] * (8 - len(grouped_instructions[-1]))

    # Add 5 additional rows of "0x0"
    for _ in range(5):
        grouped_instructions.append(['0x0'] * 8)

    # Write to CSV file
    with open(output_file, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        for group in grouped_instructions:
            writer.writerow(group)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    convert_to_csv(input_file, output_file)
    print(f"Conversion complete. The file has been saved as {output_file}.")
