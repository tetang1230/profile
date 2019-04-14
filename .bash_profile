if [ -f ~/.bashrc ];
then
    . ~/.bashrc
fi
#必须先安装好cowsay
#如果随机的有问题,直接用15代替………………先这么弄吧
#随机从新优化下
#33和38是fuck的景象,还是屏蔽掉吧...
#再改进一次数字所以可能不准,每个版本的cowsay都会新增或减少,如果直接用联合索引来代替,会比较准确

#cowsay -l | awk 'BEGIN{srand();a=""}{if(NR != 1){ if(a==""){a=$0}else{a = (a" "$0)} }} END {len = split(a, c, " "); txt=" \"i fuck you\"     " ; r=int(rand()*len); if(r==0 || r == 33 || r == 38){ system("cowsay -f " c[7] " 来吧，骚年，开工了！" );} else { print r; system("cowsay -f " c[r] "  来吧，骚年，开工了！" ); }}'

cowsay -l | awk 'BEGIN{srand();a=""}{if(NR != 1){ if(a==""){a=$0}else{a = (a" "$0)} }} END {len = split(a, c, " "); txt=" \"i fuck you\"     " ; r=int(rand()*len); if(r==0 || c[r] == "telebears" || c[r] == "sodomized"){ system("go go go 开工了！" );} else { system("cowsay -f " c[r] "  go go go，开工了！" ); }}'
