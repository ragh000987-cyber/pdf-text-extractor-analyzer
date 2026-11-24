#!/bin/bash

extract_pdf() {
    if [ ! -f "$1" ]; then
        echo "Error: PDF file not found."
        return 1
    fi

    filename=$(basename "$1" .pdf)
    textfile="extracted/$filename.txt"

    if pdftotext "$1" "$textfile"; then
        if grep -q '[^[:space:]]' "$textfile"; then
            echo "Text extracted successfully."
            return 0
        else
            echo "No extractable text found."
            return 1
        fi
    else
        echo "Error: Text extraction failed."
        return 1
    fi
}
