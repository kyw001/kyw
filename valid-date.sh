#!/bin/bash

# Function to convert month to proper format
convert_month() {
    local month_input=$1
    case "${month_input,,}" in
        jan|january|1) echo "Jan";;
        feb|february|2) echo "Feb";;
        mar|march|3) echo "Mar";;
        apr|april|4) echo "Apr";;
        may|5) echo "May";;
        jun|june|6) echo "Jun";;
        jul|july|7) echo "Jul";;
        aug|august|8) echo "Aug";;
        sep|september|9) echo "Sep";;
        oct|october|10) echo "Oct";;
        nov|november|11) echo "Nov";;
        dec|december|12) echo "Dec";;
        *) echo "Invalid";;
    esac
}

# Function to check leap year
is_leap_year() {
    local year=$1
    if (( year % 4 == 0 )); then
        if (( year % 100 == 0 )); then
            if (( year % 400 == 0 )); then
                return 0
            else
                return 1
            fi
        else
            return 0
        fi
    else
        return 1
    fi
}

# Main script starts here
if [[ $# -ne 3 ]]; then
    echo "입력값 오류"
    exit 1
fi

month_input=$1
day=$2
year=$3

# Validate the year
if ! [[ $year =~ ^[0-9]{4}$ ]]; then
    echo "잘못된 연도 형식 + $month_input $day $year 는 유효하지 않습니다"
    exit 1
fi

# Convert and validate the month
month=$(convert_month $month_input)
if [[ $month == "Invalid" ]]; then
    echo "잘못된 월 형식 + $month_input $day $year 는 유효하지 않습니다"
    exit 1
fi

# Validate the day
if ! [[ $day =~ ^[0-9]+$ ]]; then
    echo "잘못된 일 형식 + $month_input $day $year 는 유효하지 않습니다"
    exit 1
fi

# Convert day to integer
day=$(echo $day | sed 's/^0*//')

# Define days in each month
days_in_month=(31 28 31 30 31 30 31 31 30 31 30 31)

# Adjust for leap year
if is_leap_year $year && [[ $month == "Feb" ]]; then
    days_in_month[1]=29
fi

# Month index mapping
declare -A month_map=( ["Jan"]=0 ["Feb"]=1 ["Mar"]=2 ["Apr"]=3 ["May"]=4 ["Jun"]=5 ["Jul"]=6 ["Aug"]=7 ["Sep"]=8 ["Oct"]=9 ["Nov"]=10 ["Dec"]=11 )

# Get the month index
month_index=${month_map[$month]}

# Check if the day is valid for the given month
if (( day >= 1 && day <= ${days_in_month[$month_index]} )); then
    echo "${month^} $day $year"
else
    echo "잘못된 일 수 + $month_input $day $year 는 유효하지 않습니다"
    exit 1
fi