# gdbinit
echo "set history filename ~/.gdb_history" >> ~/.gdbinit
echo "set history save on" >> ~/.gdbinit

#screen rc
echo "hardstatus alwayslastline" >> ~/.screenrc
echo "hardstatus string '%{= kG}[ %{G}%H %{g}][%=%{=kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%=%{g}][%{B}%Y-%m-%d %{W}%c %{g}]'" >> ~/.screenrc

#vimrc 
echo "set expandtab" >> ~/.vimrc
echo "set shiftwidth=2" >> ~/.vimrc
echo "set softtabstop=2">> ~/.vimrc
