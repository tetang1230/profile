if [ -f ~/.bashrc ];
then
    . ~/.bashrc
fi
#必须先安装好cowsay
cowsay -l | awk 'BEGIN{srand();a=""}{if(NR != 1){ if(a==""){a=$0}else{a = (a" "$0)} }} END {len = split(a, c, " "); txt=" \"i fuck you\" " ; system("cowsay -f " c[int(rand()*len+0.5)] " 来吧，骚年，开工了！" ); }'
