#!/bin/bash

flip_coin() {
    local result=$((RANDOM % 2))

    if ((result == 0)); then
        echo "Heads"
    else
        echo "Tails"
    fi
}

winner=$(flip_coin)

echo "The winner is: $winner"
