input=$1
echo $input
vLen=`echo ${#input}`
echo $vLen
tar -zxvf cmdm_IH_csvs_218132.tar.gz --directory \Extracted_Source; echo "extracted tar file to extracted folder"
output=${input:0:${#input}-1}
echo ${#output}
echo $output
#Leave the echo end in the below command to avoid adding a new line character at the end of the file.
#for a in `cat native_location_na_ih_BASE.csv`; do echo ${a//"218971"/${output:0:${#output}-1}}; done > native_location_na_ih_${output:0:${#output}-1}.csv; echo end
#!/bin/sh 
find ./Extracted_Source -type f | xargs sed -i -e "s/218132/${output:0:${#output}-1}/" {} \;
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
echo "Current Time : $current_time"
#for f in ./Extracted_Source/*; do mv -- "$f" "$f_${current_time:0:${#current_time}-1}";
for f in * ; do echo "${f%.*}-${current_time:0:${#current_time}-1}.${f##*.}"; done;
#find ./Extracted_Source -exec -e touch -t ${current_time:0:${#current_time}-1} {} \;
tar -czvf cmdm_IH_csvs_${output:0:${#output}-1}_${current_time:0:${#current_time}-1}.tar.gz Extracted_Source;
#./Extracted_Source/*
