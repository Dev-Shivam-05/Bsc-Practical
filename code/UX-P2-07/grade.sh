#!/usr/bin/env bash
# Practical 7 (Unit 3): Student grade using nested if. Run: bash grade.sh
# Grade limits are NOT given in the question; these are assumed. Change them if your teacher says so.
read -p "Enter marks (0-100): " m
if [ "$m" -ge 0 ] 2>/dev/null && [ "$m" -le 100 ]; then
    if [ "$m" -ge 80 ]; then
        echo "Grade: A"
    else
        if [ "$m" -ge 60 ]; then
            echo "Grade: B"
        else
            if [ "$m" -ge 50 ]; then
                echo "Grade: C"
            else
                if [ "$m" -ge 35 ]; then
                    echo "Grade: D"
                else
                    echo "Fail"
                fi
            fi
        fi
    fi
else
    echo "Invalid marks"
fi
