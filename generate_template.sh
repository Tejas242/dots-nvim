#!/bin/sh

# filename
filename=$1
# file extension
extension="${filename##*.}"

if [ "$extension" = "cpp" ]; then
   cp -n ~/Templates/cp/template.cpp ./$filename
   # Replace $(DATE) with the current date
   sed -i "s/\$(DATE)/$(date +'%Y-%m-%d %H:%M:%S')/g" ./$filename
else
  echo "Template not found"
  exit 1
fi

base=${filename%.*}
input="${base}.in"
output="${base}.out"

# Open nvim with split view
nvim -c "vsp $input" -c "sp $output" "$filename"

