#!/bin/bash

declare -i heads_count=0
declare -i tails_count=0

flip_coin() {
    local result=$((RANDOM % 2))

    if ((result == 0)); then
        echo "Heads"
        heads_count+=1
    else
        echo "Tails"
        tails_count+=1
    fi
}

read -p "Enter the number of times to flip the coin: " num_flips

for ((i=1; i<=num_flips; i++)); do
    result=$(flip_coin)
    echo "Flip $i: $result"
done

echo "Heads count: $heads_count"
echo "Tails count: $tails_count"

