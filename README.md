# dotfiles

This is my environment. There are two dependencies:

- [brew](https://brew.sh/)
- [nix](https://nixos.org/download/) (single-user)

Initial setup is a bit awkward as this is somewhat self-referential. Homebrew
and Nix need to be not only installed but also activated, which is done through
zshrc, which is managed by this repo.

## macOS Setup

> Starting from a brand new Mac.

### Homebrew

Open Safari and go to [brew.sh](https://brew.sh); copy-paste the "Install
Homebrew" command. It requires `sudo` privileges, and will not only install
bomebrew itself in `/opt/homebrew`, it will also take care of installing the
Xcode Command Line Tools.

In the "end of install" instructions, Homebrew will tell you to run a few
commands to add brew to your `PATH`. Only the last one (starting with `eval`)
needs to be run at this point, as the others are included in the files
(`zshrc`) we'll get from this repo. At the time of writing, that is:

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Now, on to installing Nix. I prefer a single-user install, so this is not as
straightforward as following the instructions on the website.

### Nix

First, we need to tell macOS we want a `/nix` mount point:

```bash
sudo bash -c 'echo nix > /etc/synthetic.conf'
```

Next, create a new APFS (Encrypted) volume on your main hard drive using Disk
Utility. It should be just a couple clicks. Note that the password is not saved
into your keychain until the next time you mount the disk, so you may want to
unmount & remount it while you have the password in your clipboard. **Call it
'Nix'.**

Next, edit `/etc/fstab` (ideally using `sudo vifs`) to add the following line:

```plain
LABEL=Nix /nix apfs rw,nobrowse
```

Next, reboot your new macOS machine to get your Nix volume mounted
automagically onto `/nix`, all readable and writable by your user, ready for
the Nix installation.

Find a place you like and clone this repo into it.

```bash
git clone https://github.com/gaverhae/dotfiles.git
```

Then, install Nix:

```bash
./dotfiles/home/bin/reset-nix
```

### Bootstrap

There are a few things we still need to do. First, install `direnv`:

```
/opt/homebrew/bin/brew install direnv
```

Finally, we can locally activate direnv  & nix and do a "normal" sync to get
everything up to date:

```
eval "$(direnv hook zsh)"
source ~/.nix-profile/etc/profile.d/nix.sh
cd dotfiles
direnv allow
go sync
```

> Note: at the time of writing, `go sync` is still limited to telling you (via
> `git diff`) what needs to be done to bring your machine in line, but is not
> actually making any change to your machine configuration.

### zsh

Once you are done with syncing, or at least gotten as far as installing `zsh`
from `brew`, you can follow these steps to set it up as your default shell:

```
sudo bash -c 'echo /opt/homebrew/bin/zsh >> /etc/shells'
chsh -s /opt/homebrew/bin/zsh
```
