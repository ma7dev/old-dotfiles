echo "# Export custome scripts" >> ~/.bashrc;
echo "source ~/.config/bash/scripts/main.sh;" >> ~/.bashrc;

echo "# Apply customized profile" >> ~/.bashrc;
echo "source ~/.config/bash/bash_profile;" >> ~/.bashrc;

echo "# Apply the Template" >> ~/.bashrc;
echo "updateGit() {
    local action="\$1"; shift
    case "\$action" in
        # popd needs special care not to pass empty string instead of no args
        popd) [[ \$\# -eq 0 ]] && builtin popd || builtin popd "\$*" ;;
        cd|pushd) builtin \$action "\$*" ;;
        *) return ;;
    esac
    # now do stuff in the new directory
    source ~/.config/bash/bash_profile;
}
alias cd='updateGit cd'
" >> ~/.bashrc;
