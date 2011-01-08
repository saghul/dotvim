#!/usr/bin/env python
# coding=utf8

# Copyright (C) 2010 Saúl ibarra Corretgé <saghul@gmail.com>
#


import subprocess
import sys


plugins = {
           "snipmate": "https://github.com/msanders/snipmate.vim.git",
           "command-t": "https://github.com/wincent/Command-T.git",
           "nerdtree": "https://github.com/scrooloose/nerdtree.git",
           "taglist": "https://github.com/mexpolk/vim-taglist.git",
           "tasklist": "https://github.com/nowk/vim-tasklist.git",
           "autoclose": "https://github.com/vim-scripts/AutoClose.git",
           "ack": "https://github.com/mileszs/ack.vim.git",
           "conque-shell": "https://github.com/vim-scripts/Conque-Shell.git"
          }


def exec_process(cmdline, silent, input=None, **kwargs):
    """Execute a subprocess and returns the returncode, stdout buffer and stderr buffer.
       Optionally prints stdout and stderr while running."""
    try:
        sub = subprocess.Popen(cmdline, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, **kwargs)
        stdout, stderr = sub.communicate(input=input)
        returncode = sub.returncode
        if not silent:
            sys.stdout.write(stdout)
            sys.stderr.write(stderr)
    except OSError,e:
        if e.errno == 2:
            raise RuntimeError('"%s" is not present on this system' % cmdline[0])
        else:
            raise
    if returncode != 0:
        raise RuntimeError('Got return value %d while executing "%s", stderr output was:\n%s' % (returncode, " ".join(cmdline), stderr.rstrip("\n")))
    return stdout


class GitClientError(Exception): pass
class GitClient(object):

    @staticmethod
    def clone(repo, dest):
        try:
            data = ["git", "clone", "--quiet"] + [repo, dest]
            exec_process(data, True, input=None)
        except RuntimeError, e:
            raise GitClientError(e)


git_client = GitClient()

def main():
    for dir, repo in plugins.iteritems():
        print "Cloning %s into %s..." % (repo, dir)
        git_client.clone(repo, dir)


if __name__ == '__main__':
    main()


