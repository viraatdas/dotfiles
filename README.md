# dotfiles

## Configuring ZSH

Summarized from https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/

### Downloading ZSH
On Ubuntu: 
`apt install zsh`

On CentOS
`yum install zsh`

### Change default shell

On Ubuntu:
`chsh -s /usr/bin/zsh root`

On CentOS:
`chsh -s /bin/zsh root`

### Install Oh-My-ZSH 

On Ubuntu:
`apt install wget git`

On CentOS:
`yum install wget git`

Now download the installer script and execute it.
`wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh`

### Configuring ZSH
`cp zshrc ~/.zshrc` <br/>
`source ~/.zshrc`

### Initial Configuration
In zshrc, configure the `SCRIPT` path
