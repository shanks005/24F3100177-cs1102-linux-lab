#!/usr/bin/awk -f

# Set the field separator to comma
BEGIN { FS = "," }

# Strip prefixes like Mr. and Mrs. before checking for 'A'
{
    name = $2
    gsub(/^Mr\.|^Mrs\./, "", name)  # Remove Mr. or Mrs. prefix
    gsub(/^ */, "", name)            # Trim leading spaces
}

# Match names starting with 'A' and the specified gender
name ~ /^A/ && $3 ~ /^[FM]/ {
    sum += $9    # Add the CS score (9th field)
    c++          # Increment the counter
}

# Print the average score or a message if no match is found
END {
    if (c > 0) 
        print "Average CS Score for", gender, "students starting with A:", sum / c
    else
        print "No matching records found."
}

