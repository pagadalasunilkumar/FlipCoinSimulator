#!/bin/bash

declare -i heads_count=0
declare -i tails_count=0

flip_coin() {
    local result=$((RANDOM % 2))

    if ((result == 0)); then
        echo "Heads"
    else
        echo "Tails"
    fi
}

while (( heads_count < 21 && tails_count < 21 )); do
    result=$(flip_coin)

    if [[ $result == "Heads" ]]; then
        heads_count+=1
    else
        tails_count+=1
    fi
done

echo "Final Result:"
echo "Heads count: $heads_count"
echo "Tails count: $tails_count"

if (( heads_count > tails_count )); then
    echo "Heads won by $((heads_count - tails_count)) times."
elif (( tails_count > heads_count )); then
    echo "Tails won by $((tails_count - heads_count)) times."
else
    echo "It's a tie!"
fi

