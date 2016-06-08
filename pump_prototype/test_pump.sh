#!/bin/sh

source pump_config

rm main.o

./pump distcc main.cpp -o main.o
