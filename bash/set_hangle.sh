# Korean (Hangul) - input method

#sudo yum install ibus-hangul
#sudo yum install im-chooser
#sudo yum install kde-l10n-ko
echo "
#ibus kde hangle
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
" >> ~/.bashrc
source ~/.bashrc
cat ~/.bashrc

echo "please set input method"
im-chooser &
ibus-setup

