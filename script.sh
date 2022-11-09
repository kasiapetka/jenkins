#!/bin/bash
NAME=$1 
SURNAME=$2
SHOW=$3

if [ "$SHOW" = "true" ]; then
  echo "Hi $NAME $SURNAME"
else
  echo "Mark show if You want to see the name"
fi