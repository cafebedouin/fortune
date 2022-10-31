#!/bin/bash

sudo cp ~/bin/fortune/zuihitsu /usr/share/games/fortunes/;
sudo strfile /usr/share/games/fortunes/zuihitsu;
sudo chmod og+r /usr/share/games/fortunes/zuihitsu;
sudo chmod og+r /usr/share/games/fortunes/zuihitsu.dat
fortune zuihitsu
