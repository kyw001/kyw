#!/bin/bash

PHONE_BOOK="phone_book.txt"
NAME="$1"
PHONE="$2"
declare -A AREA_CODES=(
    [02]="서울"
    [031]="경기"
    [032]="인천"
    [033]="강원"
    [041]="충남"
    [042]="대전"
    [043]="충북"
    [044]="세종"
    [051]="부산"
    [052]="울산"
    [053]="대구"
    [054]="경북"
    [055]="경남"
    [061]="전남"
    [062]="광주"
    [063]="전북"
    [064]="제주"
    [010]="무선전화"
    [011]="무선전화"
    [016]="무선전화"
    [017]="무선전화"
    [018]="무선전화"
    [019]="무선전화"
)


if [ $# -ne 2 ]; then
    echo "사용법: ./phone_book.sh <이름> <전화번호>"
    exit 1
fi

if [[ ! "$PHONE" =~ ^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$ ]]; then
    echo "입력값이 올바르지 않습니다. 번호 입력 예시 : 02-2222-2222 "
    exit 1
fi


if [ ! -f "$PHONE_BOOK" ]; then
    touch "$PHONE_BOOK"
fi


AREA_CODE=$(echo "$PHONE" | cut -d'-' -f1)
AREA="${AREA_CODES[$AREA_CODE]}"
if [ -z "$AREA" ]; then
    echo "알 수 없는 지역번호입니다."
    exit 1
fi

EXISTING_PHONE=$(grep "^$NAME " "$PHONE_BOOK" | cut -d' ' -f2 )
if [ "$EXISTING_PHONE" == "$PHONE" ]; then
    echo "동일한 이름과 전화번호가 이미 존재합니다."
    exit 0
elif [ -n "$EXISTING_PHONE" ]; then
    echo "$NAME의 기존 번호 $EXISTING_PHONE을(를) 새 번호 $PHONE으로 업데이트하겠습니다."
    sed -i "/^$NAME /d" "$PHONE_BOOK"
fi

echo "$NAME $PHONE $AREA" >> "$PHONE_BOOK"
sort -o "$PHONE_BOOK" "$PHONE_BOOK"
echo "전화번호부가 업데이트되었습니다."