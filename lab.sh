path=$1
limit=$2
cd $path
line=$(df -h $path | awk 'NR == 2 {print $5}')
line2=$(echo $line | tr -d '%')
echo $line2
if [ "$line2" -gt  "$limit" ]; then
mkdir -p "$path/old"
path_to_old=$(echo $path/old)
find "$path" -type f -atime +0 -path "$path/lost+found" -exec mv {} /old \;
new_cd=$(echo $path | sed 's|/[^/]*$||')
cd "$new_cd"
mkdir -p backup
new_cd=$(echo $new_cd/backup)
tar -czvf $new_cd/archiver.tar.gz -C / $path_to_old
rm -r $path_to_old
fi