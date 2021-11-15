#!/bin/env bash
#Current gold and silver prices in India
extractPrice() {
	sed  -e 's/.*">//' -e 's/<.*//'
}


prices=$(curl -s "https://www.jmbullion.com/products/#" | 
						egrep '(gounce|sounce)' )
goldPriceInDollarPerOz=$(echo "$prices" | sed 2d | extractPrice)
		#sed  -e 's/.*">//' -e 's/<.*//')
silverPriceInDollarPerOz=$(echo "$prices" | sed 1d | extractPrice)
		#sed  -e 's/.*">//' -e 's/<.*//')

exchangeRateLine=$(curl -s "https://www.x-rates.com/calculator/?from=USD&to=INR&amount=1.00"| grep "ccOutputRslt")
exchangeRate=$(echo "$exchangeRateLine" | sed -e 's/.*t">//' -e 's/<.*//' )

declare -r GramsPerOunce="28.3495"
declare -ir GoldGramsInIndia=10
declare -ir SilverGramsInIndia=1000
declare -ir TaxRateInIndia=5

computeSellPrice() {
	declare -ir BuySellDifference=2
    SellPrice=$(bc -l <<< "$1 * (100 - $BuySellDifference) / 100")
}


goldBuyPriceIndia=$(bc -l <<< "$goldPriceInDollarPerOz * $exchangeRate * \
	$GoldGramsInIndia / $GramsPerOunce * (100 + $TaxRateInIndia) / 100" )
computeSellPrice $goldBuyPriceIndia
	#$(bc -l <<< "$goldBuyPriceIndia * \ (100 - $BuySellDifference) / 100")
printf "Gold 0.999 purity 10gms buy ₹%.0f and sell ₹%.0f\n" \
	$goldBuyPriceIndia $SellPrice

silverBuyPriceIndia=$(bc -l <<< "$silverPriceInDollarPerOz * $exchangeRate \
 * $SilverGramsInIndia / $GramsPerOunce * (100 + $TaxRateInIndia) / 100" ) 
computeSellPrice $silverBuyPriceIndia
	#$(bc -l <<< "$silverBuyPriceIndia * \
	#	(100 - $BuySellDifference) / 100")
printf "Silver 0.999 purity 1Kg buy ₹%.0f and sell ₹%.0f\n" \
	$silverBuyPriceIndia $SellPrice
