#! /usr/bin/env python3

import os
import pathlib
import sys

import homely.files as files
import homely.system as system

HERE = os.path.dirname(os.path.realpath(__file__))


def main():
    # Better handle if XDG_CONFIG_HOME is unset or empty (during initial bootstrap)
    default_config_home = "$HOME/.config"
    config_home = os.getenv("XDG_CONFIG_HOME", default_config_home) or default_config_home

    # TODO to auto rename to an "x.old" and warn?
    files.symlink("bashrc", ".bashrc")
    files.symlink("bash_profile", ".bash_profile")
    files.symlink("profile", ".profile")  # TODO maybe add lines instead?
    files.symlink("editorconfig", ".editorconfig")

    if system.haveexecutable("latexmk"):
        files.symlink("latexmkrc", ".latexmkrc")

    if system.haveexecutable("task"):
        files.symlink("taskrc", ".taskrc")

    if system.haveexecutable("asdf"):
        files.symlink("tool-versions", ".tool-versions")
        files.symlink("asdfrc", ".asdfrc")
        files.symlink("default-golang-pkgs", ".default-golang-pkgs")

    # git common config:
    # TODO error if git not present
    # TODO into separate function
    gitpath = os.path.join(HERE, "common.gitconfig")
    system.execute(["git", "config", "--global", "include.path", gitpath])
    # NOTE this might overwrite if there's another include.path already present
    # TODO revert/cleanup somehow?
    # TODO check that path specification using ~/ works

    # TODO does pipinstall use system pip or HOMELY's one?

    files.symlink("vimrc", ".vimrc")
    # install vim-plug
    files.mkdir(".vim")
    files.mkdir(".vim/autoload")
    files.mkdir(".vim/swaps")
    files.mkdir(".vim/backups")
    files.mkdir(".vim/doc")
    files.download(
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
        "~/.vim/autoload/plug.vim",
    )
    # link custom ftplugin files
    files.symlink("vim-ftplugin", ".vim/ftplugin")

    # Font config
    files.mkdir(f"{config_home}/fontconfig")
    files.symlink("fonts.conf", f"{config_home}/fontconfig/fonts.conf")

    if system.haveexecutable("pipenv"):
        # TODO warn that they need to reload for this to take effect
        files.lineinfile(".bashrc.local", 'eval "$(pipenv --completion)"')

    if system.haveexecutable("i3"):
        # ~/.local/bin is towards the front of PATH thanks to .profile
        files.symlink("i3exit.sh", "~/.local/bin/i3exit")
        files.symlink("locker.sh", "~/.local/bin/locker")
        files.symlink("i3.conf", "~/.i3/config")

    if system.haveexecutable("sway"):
        sway_dest_dir = pathlib.Path(f"{config_home}/sway")
        files.mkdir(str(sway_dest_dir))
        files.symlink("sway/config", str(sway_dest_dir / "config"))
        dest_conf_d = sway_dest_dir / "config.d"
        files.mkdir(str(dest_conf_d))
        # Symlink all content from sway/config.d to ~/sway/config.d
        # Rather than symlinking the directory itself, to allow for local-machine inclusions
        for i in pathlib.Path(HERE, "sway/config.d").iterdir():
            files.symlink(str(i), str(dest_conf_d / i.name))

        dest_scripts_dir = sway_dest_dir / "scripts"
        for i in pathlib.Path(HERE, "sway/scripts").iterdir():
            files.symlink(str(i), str(dest_scripts_dir / i.name))

    if system.haveexecutable("waybar"):
        waybar_dest_dir = pathlib.Path(config_home, "waybar")
        files.symlink("waybar/config", str(waybar_dest_dir / "config"))
        files.symlink("waybar/style.css", str(waybar_dest_dir / "style.css"))
        files.mkdir(str(waybar_dest_dir))
        for i in pathlib.Path(HERE, "waybar/scripts").iterdir():
            files.symlink(str(i), str(waybar_dest_dir / "scripts" / i.name))

    if system.haveexecutable("kitty"):
        files.mkdir(f"{config_home}/kitty")
        files.symlink("kitty.conf", f"{config_home}/kitty/kitty.conf")

    if system.haveexecutable("pre-commit"):
        # Install pre-commit in all new/cloned repos
        # See also https://pre-commit.com/#pre-commit-init-templatedir
        template_path = "{}/.git-template".format(os.environ["HOME"])
        system.execute(["git", "config", "--global", "init.templateDir", template_path])
        system.execute(["pre-commit", "init-templatedir", template_path])

    return 0


if __name__ in ("__main__", "HOMELY"):
    sys.exit(main())
