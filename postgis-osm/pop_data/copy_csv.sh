#!/bin/sh
for entry in /work/data/pop_data/data/prefs/*/*/*/*/monthly_mdp_mesh1km.csv
do datapath=`echo $(dirname $entry)`
  # unzip -o $entry -d $datapath
  csvname=`echo $datapath'/monthly_mdp_mesh1km.csv'`
  echo $csvname
  echo "COPY pop FROM '$csvname' with (format csv, header true, null '', force_null(population));" >> /work/data/pop_data/copy_csv.sql
done