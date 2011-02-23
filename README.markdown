Git Campfire Hook
=================

Making a better git post-receive Campfire hook. Most of them seem like they were
hacked over from old svn hooks--ours certainly is--and they don't handle edge
cases and branches well.


Installation
============

    bundle install

To install, run `hook.rb` from your repository's post-receive hook. The hook
should contain something like this:

    while read old_rev new_rev ref; do
      ruby ../git-campfire-hook/lib/hook.rb $ref $old_rev $new_rev
    done

Make sure the `post-receive` script is executable (otherwise it'll be ignored by
git).

    git config --add hooks.campfire.subdomain "YOUR_SUBDOMAIN"
    git config --add hooks.campfire.token "YOUR_TOKEN"

By default, this hook will use the first room available in CF, if you want a specific room:
    git config --add hooks.campfire.room "YOUR_ROOM"
