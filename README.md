# kmrf

kmfr is short for Keep Most Recent Files. You specify a directory and a number N.
kmfr will then purge (delete) all files and subdirectory except the N most recently modified files.

## Installation

## Usage

Use the -t flag first to check which files are going to be deleted.
Use at your own risk, there may be unexpected outcomes.

```
Usage: kmrf -d directory -q 10 [-t]
	-d  path to directory you would like to purge
	-q  quantity of files/subdir you would like to keep. Files older than the number input will be deleted. We only keep the N most recent files/folder.
	-t  Dry run. No file will be deleted. They will only be displayed on screen

Example: keep-newest-file.sh -d /backup/data/ -q 10
Watch out for the trailing slash [/] !
```
