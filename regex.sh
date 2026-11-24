#!/bin/bash

extract_dates() {
    echo "Dates found:"
    grep -oE '\b[0-9]{2}-[0-9]{2}-[0-9]{4}\b' "$textfile" || echo "No dates found."
}

extract_phones() {
    echo "Phone numbers found:"
    grep -oE '\b[6-9][0-9]{9}\b' "$textfile" || echo "No phone numbers found."
}
