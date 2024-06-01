#!/bin/bash

chage_month() {
    case "$1" in
        jan|january|1) echo "Jan" ;;
        feb|february|2) echo "Feb" ;;
        mar|march|3) echo "Mar" ;;
        apr|april|4) echo "Apr" ;;
        may|5) echo "May" ;;
        jun|june|6) echo "Jun" ;;
        jul|july|7) echo "Jul" ;;
        aug|august|8) echo "Aug" ;;
        sep|september|9) echo "Sep" ;;
        oct|october|10) echo "Oct" ;;
        nov|november|11) echo "Nov" ;;
        dec|december|12) echo "Dec" ;;
        *) echo "..." ;;
    esac
}


leap_year1() {
    year=$1
    if (( year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) )); then
        echo 1
    else
        echo 0
    fi
}


validate_date() {
    month=$(chage_month $1)
    day=$2
    year=$3

    if [ "$month" == "..." ]; then
        echo "$1라는 달은 존재하지 않습니다. + $1 $2 $3는 유효하지 않습니다."
        return 1
    fi

    leap_year2=$(leap_year1 $year)
    case "$month" in
        Jan|Mar|May|Jul|Aug|Oct|Dec) max_days=31 ;;
        Apr|Jun|Sep|Nov) max_days=30 ;;
        Feb) max_days=$((leap_year2 ? 29 : 28)) ;;
    esac
    if (( day < 1 || day > max_days )); then
        echo "$2일은 존재하지 않습니다. + $1 $2 $3는 유효하지 않습니다."
        return 1
    fi
    echo "$month $day $year"  
    return 0
}


if [ "$#" -ne 3 ]; then
    echo "입력값 오류"
    exit 1
fi


month=$1
day=$2
year=$3

result=$(validate_date $month $day $year)
if [ $? -eq 0 ]; then
    echo "$result"
else
    echo "$result"
fi