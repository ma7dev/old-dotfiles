# Git shortcuts
updateGit() {
    local action=$1; shift
    case $action in
        # popd needs special care not to pass empty string instead of no args
        popd) [[ $\# -eq 0 ]] && builtin popd || builtin popd $* ;;
        cd|pushd) builtin $action $* ;;
        *) return ;;
    esac
    # now do stuff in the new directory
    source ~/.config/bash/bash_profile;
}
# clone username repo
clone() {
	git clone ssh://git@github.com/1/2.git;
}

# add
add() {
	git add .;
}

# commit
commit() {
	git commit;
}

# commitq bla bla bla
commitq() {
	git commit \"$@\";
}

# push / push secondBranch
push() {
	branch="master";
	if [ "$#" -ne 0 ]; then
		branch="$1";
		git checkout -b $branch;
	fi
	git push origin $branch;
}

# pull / pull secondBranch
pull() {
	branch="master";
	if [ "$#" -ne 0 ]; then
		branch="$1";
		git checkout -b $branch;
	fi
	git pull origin $branch;
}

# remote username repo
remote() {
	git remote add origin git@github.com:1/2.git;
}
