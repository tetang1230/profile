if [ -f ~/.bashrc ];
then
    . ~/.bashrc
fi
#必须先安装好cowsay
#如果随机的有问题,直接用15代替………………先这么弄吧
cowsay -l | awk 'BEGIN{srand();a=""}{if(NR != 1){ if(a==""){a=$0}else{a = (a" "$0)} }} END {len = split(a, c, " "); txt=" \"i fuck you\"     " ; if(!c[int(rand()*len+0.5)]){ system("cowsay -f " c[15] " 来吧，骚年，开工了！" );} else { system("cowsay -f " c[int(rand()*len+0.5)] " 来吧，骚年，开工了！" ); }}'
