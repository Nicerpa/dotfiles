#! /bin/python
import subprocess

output = subprocess.check_output("wifi-list", shell=True).decode('utf-8')
output = output.replace('*', ' ')

lines = output.strip().split('\n')[1:]

for line in lines:
    split_line = line.split()
    print(split_line[1])
