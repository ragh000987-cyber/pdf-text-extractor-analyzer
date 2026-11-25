#!/bin/bash

generate_report() {
    reportfile="reports/${filename}_report.txt"
 {
        echo "========================================"
        echo "       PDF TEXT ANALYSIS REPORT"
        echo "========================================"
        echo "PDF File: $pdf"
        echo "Generated on: $(date)"

        echo
        echo "DOCUMENT STATISTICS"
        statistics

        echo
        echo "EXTRACTED DATES"
        extract_dates

        echo
        echo "EXTRACTED PHONE NUMBERS"
        extract_phones

        echo
        echo "TOP 10 FREQUENT WORDS"
        printf "%-20s %s\n" "Word" "Frequency"
        top_words

        echo
        echo "COMPLETE WORD FREQUENCY"
        printf "%-20s %s\n" "Word" "Frequency"
        word_frequency

        echo
        echo "END OF REPORT"

    } > "$reportfile"

    echo "Report generated successfully."
    echo "Location: $reportfile"
}
