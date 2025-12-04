import sys

def csv_to_binary_format(csv_file, output_file):
    """Convert CSV hex values to 0b binary format for Digital"""
    with open(csv_file, 'r') as f:
        lines = f.readlines()
    
    binary_values = []
    for line in lines:
        line = line.strip()
        if not line:
            continue
        # Split by comma
        values = line.split(',')
        for val in values:
            val = val.strip()
            if val.startswith('0x'):
                # Convert hex to int, then to 32-bit binary
                int_val = int(val, 16)
                binary = format(int_val, '032b')
                binary_values.append(f'0b{binary}')
            elif val == '0':
                binary_values.append('0b00000000000000000000000000000000')
    
    # Write each binary value on a new line
    with open(output_file, 'w') as f:
        for binary in binary_values:
            f.write(binary + '\n')
    
    print(f"Converted {len(binary_values)} instructions to binary format")
    print(f"Output saved to {output_file}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python csv_to_binary.py <input_csv> <output_file>")
        sys.exit(1)
    
    csv_to_binary_format(sys.argv[1], sys.argv[2])
