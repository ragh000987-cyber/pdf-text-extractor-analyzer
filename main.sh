#!/bin/bash

cd "$(dirname "$0")" || exit 1

source extractor.sh
source regex.sh
source analyser.sh
source report.sh

mkdir -p input extracted reports

select_pdf() {
    read -r -p "Enter PDF filename: " selected

    pdf="input/$selected"

    extract_pdf "$pdf"
}

echo "========================================"
echo "     PDF TEXT EXTRACTOR & ANALYZER"
echo "========================================"

until select_pdf; do
    echo "Please enter a valid PDF filename."
done

while true; do

    echo
    echo "========================================"
    echo "              MAIN MENU"
    echo "========================================"
    echo "1. Display extracted text"
    echo "2. Extract dates"
    echo "3. Extract phone numbers"
    echo "4. Search keyword"
    echo "5. Count keyword occurrences"
    echo "6. Display word frequencies"
    echo "7. Top 10 frequent words"
    echo "8. Document statistics"
    echo "9. Generate analysis report"
    echo "10. Select another PDF"
    echo "0. Exit"
    echo "========================================"

    read -r -p "Enter your choice: " choice

    case "$choice" in

        1)
            cat "$textfile"
            ;;

        2)
            extract_dates
            ;;

        3)
            extract_phones
            ;;

        4)
            search_keyword
            ;;

        5)
            keyword_count
            ;;

        6)
            printf "%-20s %s\n" "Word" "Frequency"
            word_frequency
            ;;

        7)
            printf "%-20s %s\n" "Word" "Frequency"
            top_words
            ;;

        8)
            statistics
            ;;

        9)
            generate_report
            ;;

        10)
            until select_pdf; do
                echo "Please enter a valid PDF filename."
            done
            ;;

        0)
            echo "Program terminated successfully."
            exit 0
            ;;

        *)
            echo "Invalid choice. Please try again."
            ;;

    esac

done
