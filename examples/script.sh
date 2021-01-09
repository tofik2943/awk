#!/bin/bash
awk 'BEGIN{
        FS=";"
        OFS=";"
        my_regex="[[:space:]]+";
        przecinek="[,]";
        regex1="\\.\\][,]"}
 
    {gsub("\\. ", "\.0 ", $0)}              #  (kropka spacja) -> (kropka zero spacja). 
    #{gsub(my_regex, ",", $0)}               #  jedna lub wiecej spacji -> przecinek


    {sub("(,],)|(],)", "]", $0)}          #   ,],  oraz ], -> ]
    # dzialaja oba     
    {sub("(,\\],)|(\\],)", "\]", $0)}     #   ,],  oraz ], -> ]

    #{gsub( "\,\," , ",", $0)}      #  dwa przecinki -> jeden przecinek
    #{gsub( "(,){2}" , ",", $0)}    #  dwa przecinki -> jeden przecinek 
    #{gsub( ",{2}" , ",", $0)}      #  dwa przecinki -> jeden przecinek
    {gsub( "[,]{2}" , ",", $0)}     #  dwa przecinki -> jeden przecinek


    {gsub("\\.\,", ",", $0)}           #  kropka przecinek -> przecinek

    {gsub("\\[,", "[", $0)}             #   [, ->  [ 
    $0 ~ regex1 {gsub(regex1, "]",$0)}  # .], -> ]




    {print $0}' ./rekordy2.csv | tee ./new.csv

   