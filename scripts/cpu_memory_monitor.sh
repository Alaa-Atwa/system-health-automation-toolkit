#!/usr/bin/env bash


CPUs=$(top -b -n 1 | grep "Cpu")

echo $CPUs
