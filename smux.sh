#!/bin/bash
#SMUX
#Make by Dcove.
green="\033[32m"
red="\033[31m"
origin="\033[0m"
if [ ! -d "$HOME/.smux" ] ; then
	if [ ! -f "$HOME/.smux/smuxsh" ] ;then
		bash $HOME/.smux/smuxsh
	else
		touch /$HOME/.smux/smuxsh
	fi
else
	mkdir $HOME/.smux
fi
function logo(){
echo -e "$red
              XXX
          XXXX
 XXXXXXXXX
 XX                     S
 XX                     M
 XXXXXXXXXXXXXXXX       U
               XV       X
              XV
         -<XXXXXXXX
             XX  XX
             XX  XX
             XX  XX
             XX  XX
             XX  XX
             XX  XX
	      XXXX
"
}
function main(){
if [[ $smuxer = "1" ]] ; then
	clear
	echo -e "$red请正确输入！"
	logo
fi
echo -e "$origin
_________________________________________
|               S M U X                 |
|_______________________________________|
|$green请选择功能$origin                             |
|_______________________________________|
|$green 1.切换清华大学tuna镜像站apt源$origin         |
|_______________________________________|
|$green 2.zsh的安装和配置$origin                     |
|_______________________________________|
|$green 3.进入SmuxSh$origin                          |
|_______________________________________|
|$green本SMUX具有超级$red牛$green力。$origin                   |
|_______________________________________|
"
read -p "选择：" smuxc1
case $smuxc1 in
	 1)
		echo "
		_____________________________________
		|              请选择               |
		|___________________________________|
		|1.切换默认apt源为清华大学          |
		|___________________________________|
		|2.添加清华大学apt源                |
		|___________________________________|
		"
		read smuxc2
		case $smuxc2 in
			1)
				echo 切换中，请稍候
				echo "deb http://mirrors.tuna.tsinghua.edu.cn/termux stable main" >> sources.list
				echo 创建文件完成
				mkdir $HOME/smux
				cp /data/data/com.termux/usr/etc/apt/sources.list $HOME/smux/sources.list.backup
				echo 备份原文件完成
				mv ./sources.list /data/data/com.termux/apt/
				echo 移动文件完成
				apt update
				echo apt缓存更新完成
				echo "清华大学源切换成功，原文件在主目录/smux/sources.list.backup"
				;;
			2)
				echo "deb http://mirrors.tuna.tsinghua.edu.cn/termux stable main" >> /data/data/com.termux/usr/etc/apt/sources.list
				apt update
				echo "清华大学源添加成功"
				;;
			*)
				smuxer=1
				main
			esac
			;;
		2)
			pkg install zsh wget
			sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
			;;
		moo)
			apt moo
			;;
		3)
			smuxsh
			;;
		*)
			smuxer=1
			main
esac
}
function smuxsh() {
	echo Welcome to SMUXSH!
	echo 输入小写字母：smuxsh 打开菜单
	smuxsh2
}
function smuxsh2() {
	echo `pwd`">"
	read -p ">" $smuxsha
	case $smuxsha in
		smuxsh)
			echo smuxsh菜单
			echo 1.切换smuxsh使用的shell
			read $smuxshb
			case $smuxshb in
				1)
					echo 1.bash
					echo 2.dash
					echo 3.zsh
					read $smuxshsh
					case $smuxshsh in
						1)
							rm -f ~/.smux/smuxsh
							echo "smuxsh=bash" >> ~/.smux/shell
							clear
							echo done.
							exit
							;;
						2)	
							rm -f ~/.smux/smuxsh

							echo "smuxsh=dash" >> ~/.smux/shell
							clear
							echo done.
							smuxsh
							;;
						3)
							rm -f ~/.smux/smuxsh

							echo "smuxsh=zsh"
							clear
							echo Done.
							smuxsh
							;;
						*)
							echo -e "$red请正确输入!"
							smuxsh2
					esac
					;;
				*)
					echo -e "$red请正确输入！"
					smuxsh2
			esac
			;;
		*)
			echo "$smuxsha" >> ~/.smux/shdo
			if [[ $smuxsh = "bash" ]] ; then
				bash ~/.smux/shdo
			elif [[ $smuxsh = "dash" ]] ; then
				dash ~/.smux/shdo
			elif [[ $smuxsh = "zsh" ]] ; then
				zsh ~/.smux/shdo
			fi
			rm -f ~/.smux/shdo
			smuxsh2
	esac
}
clear
logo
main&
