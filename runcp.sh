#!/bin/sh

file=$1
base=${file%.*}
input="${base}.in"
expected="${base}.out"

if [ -z "$file" ] || [ ! -f "$file" ] || [ ! -f "$input" ] || [ ! -f "$expected" ]; then
  echo "Usage: $0 filename.cpp"
  echo "Code file, input file, or expected output file not found!"
  exit 1
fi

g++ -std=c++17 -O2 -DDEBUG -o "$base" "$file"
if [ $? -ne 0 ]; then
  echo "Compile Error!"
  exit 1
fi

echo "Input:"
cat "$input"
echo "-----------------------------------"

out=$(./"$base" < "$input")
echo "Output:"
echo "$out"
echo "-----------------------------------"

if [ "$out" = "$(cat "$expected")" ]; then
  echo "VERDICT: \033[0;32mPASSED\033[0m"
else
  echo "VERDICT: \033[0;31mFAILED\033[0m"
  echo "Expected:"
  cat "$expected"
fi

echo "-----------------------------------"

# Remove executable
rm $base
