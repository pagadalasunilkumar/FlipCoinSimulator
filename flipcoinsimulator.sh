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

while (( (heads_count - tails_count < 2) && (tails_count - heads_count < 2) )); do
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
    echo "Heads won by $((heads_count - tails_count)) points."
elif (( tails_count > heads_count )); then
    echo "Tails won by $((tails_count - heads_count)) points."
else
    echo "It's a tie! Continuing until a difference of 2 points is achieved."

    while (( (heads_count - tails_count < 2) && (tails_count - heads_count < 2) )); do
        result=$(flip_coin)

        if [[ $result == "Heads" ]]; then
            heads_count+=1
        else
            tails_count+=1
        fi
    done

    echo "Final Result after the tie-breaker:"
    echo "Heads count: $heads_count"
    echo "Tails count: $tails_count"

    if (( heads_count > tails_count )); then
        echo "Heads won by $((heads_count - tails_count)) points."
    else
        echo "Tails won by $((tails_count - heads_count)) points."
    fi
fi

