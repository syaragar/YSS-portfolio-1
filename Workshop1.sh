if [ $# -gt 0 ];
then
cd $1
fi

commit_count=$(git rev-list --all --count)
lastest_author=$( git log --pretty=format:"Author Name - %an , Author email - %ae " -11)
latest_comment=$( git log --pretty=format:"%s" -1)

echo ""
echo "The total Number of Commits are : $commit_count"
echo "The author information for the most recent commit : $lastest_author"
echo "The comments for the most recent commit: $latest_comment"
echo ""

