function git-altered --description 'Get git status -s -b for each subdirectory'
	for dir in (ls)
set git_status (git -C $dir status -s -b)
if string match -v -q "## master...origin/master" $git_status
echo "$dir $git_status"
end
set -e git_status
end
end
