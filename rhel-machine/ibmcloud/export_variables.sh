for i in `cat variables.tf| grep variable | cut -d '"' -f2` 
do
    echo ${i}=
done
