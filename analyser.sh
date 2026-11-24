#!/bin/bash

search_keyword() {
    read -r -p "Enter keyword: " keyword

    if [ -z "$keyword" ]; then
        echo "Keyword cannot be empty."
        return 1
    fi

    grep -inF -- "$keyword" "$textfile" || echo "Keyword not found."
}

keyword_count() {
    read -r -p "Enter keyword: " keyword

    if [ -z "$keyword" ]; then
        echo "Keyword cannot be empty."
        return 1
    fi

    count=$(grep -oiF -- "$keyword" "$textfile" | wc -l)

    echo "Total occurrences: $count"
}

word_frequency() {
    awk '{
        for(i=1; i<=NF; i++) {
            word=tolower($i)
            gsub(/[^a-z]/, "", word)

            if(word != "")
                count[word]++
        }
    }
    END {
        for(word in count)
            printf "%-20s %d\n", word, count[word]
    }' "$textfile" | sort -k2,2nr
}

top_words() {
    word_frequency | head -10
}

statistics() {
    echo "Pages: $(pdfinfo "$pdf" | awk '/^Pages:/ {print $2}')"
    echo "Words: $(wc -w < "$textfile")"
    echo "Lines: $(wc -l < "$textfile")"
    echo "Characters: $(wc -m < "$textfile")"
}
