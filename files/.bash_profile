if [ -f $HOME/.profile ]; then
	. $HOME/.profile
fi

if [ -f $HOME/.bashrc ]; then
	. $HOME/.bashrc
fi

if [ -f $HOME/.bash_profile_local ]; then
	. $HOME/.bash_profile_local
fi
