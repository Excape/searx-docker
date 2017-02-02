#!/bin/bash
# symlink hooks
if [ ! -h ../.git/hooks/post-receive ]
then
    ln -s ../../git-hooks/post-receive ../.git/hooks/post-receive
fi
