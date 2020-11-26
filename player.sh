while true
do
         clear
echo
echo

echo PRESS 1 : skip + 10 sec
echo PRESS 2 : skip - 10 sec
echo PRESS 3 : play/pause
echo PRESS 4 : brightness + 10
echo PRESS 5 : brightness - 10
echo PRESS 6 : exit
echo
echo
echo
read -p ">> "  -n1 ch
case $ch in                                                               
             1)  playerctl position 10+ ;;  
             2)  playerctl position 10- ;;                                        
             3)  playerctl play-pause ;;
             4)  xbacklight -inc 10 ;;
             5)  xbacklight -dec 10 ;;
             6)  exit
         esac    
done
