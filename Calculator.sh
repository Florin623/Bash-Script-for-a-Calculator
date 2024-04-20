#!/bin/bash

echo "Enter the first number:"
read value1

echo "Enter the operator:"
read operator


div() {
    echo "Enter the second number:"
    read value2
    if (( $(echo "$value2 != 0" | bc -l) )) # using bc for floating-point operations
    then
    	echo "Result: "
        echo "$value1/$value2" | bc -l

    elif (( $(echo "$value1 > 0" | bc -l) && $(echo "$value2 == 0" | bc -l) ))
    then
        echo -e "\n+inf"

    elif (( $(echo "$value1 < 0" | bc -l) && $(echo "$value2 == 0" | bc -l) ))
    then
        echo -e "\n-inf"

    elif (( $(echo "$value1 == 0" | bc -l) && $(echo "$value2 == 0" | bc -l) ))
    then
        echo -e "\nUndefined!"
    fi
}


factorial() {
    fact=1
    for (( i=1; i<=value1; i++ ))
    do
        fact=$(echo "$fact * $i" | bc)
    done
    echo "Result:"
    echo "$fact"
}


if [ "$operator" == "+" ]
then
    echo "Enter the second number:"
    read value2
    echo "Result:"
    echo "$value1+$value2" | bc -l

elif [ "$operator" == "-" ]
then
    echo "Enter the second number:"
    read value2
    echo "Result:"
    echo "$value1-$value2" | bc -l

elif [ "$operator" == "*" ]
then
    echo "Enter the second number:"
    read value2
    echo "Result:"
    echo "$value1*$value2" | bc -l

elif [ "$operator" == "/" ]
then
    div

elif [ "$operator" == "^" ]
then
    echo "Enter the second number:"
    read value2
    echo "Result:"
    result=$(echo "scale=10; $value1^$value2" | bc -l)
    echo "$result"

elif [ "$operator" == "!" ]
then
    factorial

else
    echo -e "\nInvalid operator!"
fi
