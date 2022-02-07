Templates for `.profile, .bash_profile, .inputrc, .vimrc, .zshenv`

Use this at your own risk.

# Setup

Depending on your preference and system config, use either of:

1. Extend personal `.profile`
```
cd ~
echo '. ~/src/user-profile/.profile' >> .profile
```

2. Symlink files

```
cd ~
ln -nfs src/user-profile/.inputrc .inputrc
ln -nfs src/user-profile/.vimrc .vimrc
ln -nfs src/user-profile/.bash_profile .bash_profile
ln -nfs src/user-profile/.zshenv .zshenv
```

VS Code
```sh
cd "~/Library/Application Support/Code/User"
ln -ns ~/src/user-profile/vs_code_keybindings.json keybindings.json
```
