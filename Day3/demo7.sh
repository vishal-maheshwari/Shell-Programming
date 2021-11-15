#!/bin/env bash
goldprice=$(grep gounce gs.txt | cut -d "<" -f 2 | cut -d ">" -f 2)
echo GOLDPRICEUS  $goldprice
echo "Gold Price in India"
echo  "($goldprice * 74.33)/ 28.34 * 10*1.05 " | bc -l
silverprice=$(grep sounce gs.txt | cut -d "<" -f 2 | cut -d ">" -f 2)
echo "SILVERPRICEUS" $silverprice
echo "Silver  Price in India"
echo  "($silverprice * 74.33)/ 28.34 * 1000*1.05 " | bc -l
