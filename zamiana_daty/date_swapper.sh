#!/bin/bash
if [ "$#" -eq "1" ]; then
file_name=$1;
    awk 'BEGIN { regex_date="([0-9]{2})-([0-9]{2})-([0-9]{4})"}
        {
        while(match($0, regex_date , tab)){
            new_date = sprintf("%s/%s/%s", substr(tab[3], 3, 2), tab[2], tab[1]);
            sub(regex_date, new_date, $0);
        }

        print $0
        }'  $file_name | tee $file_name
else 
    echo nie podano argumentu
    exit
fi
# Zamienić wszystkie daty formatu DD-MM-YYYY (np. 30-04-2020) na YY/MM/DD (20/04/30).

# wywolanie:
# ./date_swapper.sh datetxt.txt