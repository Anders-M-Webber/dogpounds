repo init -u url    # to checkout the "manifest.xml" and config for git email and username
repo sync   # if project exists, then update ("git remote update" and "git rebase "), or download ("git clone").
repo status     # check status of local files, wrapper of "git diff-files" and "git diff-index"

repo diff    # list all local modified files

repo checkout
repo branches
repo upload     # git push
repo download    # git fetch
repo prune     #  git branch -d

repo forall -c command    # go through all files 
repo forall -c git status   # equally repo status
repo forall -c git clean -dxf   # equally to !!!DELETE!!! whole repository (not recoverable)
repo forall -c git clean -dxfn   # dry run, will show to-be-deleted files
repo forall -vc "git reset --hard"    # to revert all changes
repo forall ~/WORKING_DIRECTORY/frameworks/native/services/surfaceflinger/  -c  'git checkout .'   # restore changed files at directory

