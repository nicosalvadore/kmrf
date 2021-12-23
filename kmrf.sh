#! /bin/bash

set -e

directory=''
quantity=0
dryrun=0

print_usage() {
  echo
  echo "Usage: $0 -d directory -q 10 [-t]"
  echo "	-d  path to directory you would like to purge"
  echo "	-q  quantity of files/subdir you would like to keep. Files older than the number input will be deleted. We only keep the N most recent files/folder."
  echo "	-t  Dry run. No file will be deleted. They will only be displayed on screen"
  echo
  echo "Example: keep-newest-file.sh -d /backup/data/ -q 10"
  echo "Watch out for the trailing slash [/] !"
  echo
}

while getopts 'd:q:th' flag; do
  case "${flag}" in
    d) directory="${OPTARG}";;
    q) quantity="${OPTARG}" ;;
    t) dryrun=1 ;;
    h) print_usage
       exit 1 ;;
    *) print_usage
       exit 1 ;;
  esac
done

if [[ $directory == '' || $quantity == 0 ]]; then
  print_usage
  exit 1
fi

if [[ $dryrun == 1  ]]; then
	echo "The following files will be deleted if you run the same command without the -t flag :"
	ls -1t $directory | tail -n +$(($quantity + 1))

else
	echo "The following files have been deleted :"
	ls -1t $directory | tail -n +$(($quantity + 1))
	ls -1t $directory | tail -n +$(($quantity + 1)) | xargs -i rm -rf "$directory{}"
fi
