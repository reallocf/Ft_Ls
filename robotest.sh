# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    robotest.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: csummers <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/19 09:12:24 by csummers          #+#    #+#              #
#    Updated: 2016/12/19 09:12:25 by csummers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#
# Notes on using this script:
# This script makes active use of a .tmp folder built in your home directory
# if you use a ~/.tmp folder for something else - take EXTREME caution
#

clear
LAYER_ONE=1
while [[ $LAYER_ONE == 1 ]] ; do
	echo
	echo
	echo
	echo
	echo "Select an option:"
	echo
	echo "1) standard tests"
	echo "2) standard tests passed as params"
	echo "3) error tests"
	echo "4) permissions tests"
	echo "5) time tests"
	echo "h) help"
	echo "q) exit"
	echo
	read -n1 TARGET_ONE
	clear
	mkdir -p ~/.tmp

	case $TARGET_ONE in

		"1")
			mkdir -p ~/.tmp/temp_dir
			touch ~/.tmp/temp_dir/file1
			touch ~/.tmp/temp_dir/zzzzz
			touch ~/.tmp/temp_dir/file2
			touch ~/.tmp/temp_dir/+file
			touch ~/.tmp/temp_dir/zfile
			ln -s ~/.tmp/temp_dir/zzzzz ~/.tmp/temp_dir/link
			ln -s ~/.tmp/temp_dir/link_the_loopy_hero ~/.tmp/temp_dir/link_the_loopy_hero
			mkdir -p ~/.tmp/temp_dir/dir1
			mkdir -p ~/.tmp/temp_dir/dir2
			mkdir -p ~/.tmp/temp_dir/dir1/dir3
			touch ~/.tmp/temp_dir/dir1/dir3/go_go_gadget_robotest
			touch ~/.tmp/temp_dir/dir1/hi_mom
			mkdir -p ~/.tmp/temp_dir/dir1/dir_dir_dir_dir_dir
			(( LAYER_TWO = 1 ))
			while [[ $LAYER_TWO == 1 ]] ; do
				echo
				echo
				echo
				echo
				echo "Select an option:"
				echo
				echo "a) basic test"
				echo "b) -a test"
				echo "c) -l test"
				echo "d) -r test"
				echo "e) -t test"
				echo "f) -R test"
				echo "g) mixed flags test"
				echo "h) -f test (bonus)"
				echo "q) back"
				echo
				read -n1 TARGET_TWO
				
				case $TARGET_TWO in
					
					"a")
						clear
						echo "ls -1 ~/.tmp/temp_dir"
						ls -1 ~/.tmp/temp_dir
						echo
						echo "./ft_ls ~/.tmp/temp_dir"
						./ft_ls ~/.tmp/temp_dir
						echo
						ls -1 ~/.tmp/temp_dir > ~/.tmp/std_1a
						./ft_ls ~/.tmp/temp_dir > ~/.tmp/mine_1a
						diff ~/.tmp/std_1a ~/.tmp/mine_1a > ~/.tmp/res_1a
						if [[ -s ~/.tmp/res_1a ]] ; then
							echo "***FAIL: see ~/.tmp/res_1a for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1a
						fi ;
						rm -f ~/.tmp/std_1a
						rm -f ~/.tmp/mine_1a ;;

					"b")
						clear
						echo "ls -a1 ~/.tmp/temp_dir"
						ls -a1 ~/.tmp/temp_dir
						echo
						echo "./ft_ls -a ~/.tmp/temp_dir"
						./ft_ls -a ~/.tmp/temp_dir
						echo
						ls -a1 ~/.tmp/temp_dir > ~/.tmp/std_1b
						./ft_ls -a ~/.tmp/temp_dir > ~/.tmp/mine_1b
						diff ~/.tmp/std_1b ~/.tmp/mine_1b > ~/.tmp/res_1b
						if [[ -s ~/.tmp/res_1b ]] ; then
							echo "***FAIL: see ~/.tmp/res_1b for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1b
						fi ;
						rm -f ~/.tmp/std_1b
						rm -f ~/.tmp/mine_1b ;;

					"c")
						clear
						echo "ls -l ~/.tmp/temp_dir"
						ls -l ~/.tmp/temp_dir
						echo
						echo "./ft_ls -l ~/.tmp/temp_dir"
						./ft_ls -l ~/.tmp/temp_dir
						echo
						ls -l ~/.tmp/temp_dir > ~/.tmp/std_1c
						./ft_ls -l ~/.tmp/temp_dir > ~/.tmp/mine_1c
						diff ~/.tmp/std_1c ~/.tmp/mine_1c > ~/.tmp/res_1c
						if [[ -s ~/.tmp/res_1c ]] ; then
							echo "***FAIL: see ~/.tmp/res_1c for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1c
						fi ;
						rm -f ~/.tmp/std_1c
						rm -f ~/.tmp/mine_1c ;;

					"d")
						clear
						echo "ls -r1 ~/.tmp/temp_dir"
						ls -r1 ~/.tmp/temp_dir
						echo
						echo "./ft_ls -r ~/.tmp/temp_dir"
						./ft_ls -r ~/.tmp/temp_dir
						echo
						ls -r1 ~/.tmp/temp_dir > ~/.tmp/std_1d
						./ft_ls -r ~/.tmp/temp_dir > ~/.tmp/mine_1d
						diff ~/.tmp/std_1d ~/.tmp/mine_1d > ~/.tmp/res_1d
						if [[ -s ~/.tmp/res_1d ]] ; then
							echo "***FAIL: see ~/.tmp/res_1d for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1d
						fi ;
						rm -f ~/.tmp/std_1d
						rm -f ~/.tmp/mine_1d ;;

					"e")
						clear
						echo "ls -t1 ~/.tmp/temp_dir"
						ls -t1 ~/.tmp/temp_dir
						echo
						echo "./ft_ls -t ~/.tmp/temp_dir"
						./ft_ls -t ~/.tmp/temp_dir
						echo
						ls -t1 ~/.tmp/temp_dir > ~/.tmp/std_1e
						./ft_ls -t ~/.tmp/temp_dir > ~/.tmp/mine_1e
						diff ~/.tmp/std_1e ~/.tmp/mine_1e > ~/.tmp/res_1e
						if [[ -s ~/.tmp/res_1e ]] ; then
							echo "***FAIL: see ~/.tmp/res_1e for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1e
						fi ;
						rm -f ~/.tmp/std_1e
						rm -f ~/.tmp/mine_1e ;;

					"f")
						clear
						echo "ls -R1 ~/.tmp/temp_dir"
						ls -R1 ~/.tmp/temp_dir
						echo
						echo "./ft_ls -R ~/.tmp/temp_dir"
						./ft_ls -R ~/.tmp/temp_dir
						echo
						ls -R1 ~/.tmp/temp_dir > ~/.tmp/std_1f
						./ft_ls -R ~/.tmp/temp_dir > ~/.tmp/mine_1f
						diff ~/.tmp/std_1f ~/.tmp/mine_1f > ~/.tmp/res_1f
						if [[ -s ~/.tmp/res_1f ]] ; then
							echo "***FAIL: see ~/.tmp/res_1f for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1f
						fi ;
						rm -f ~/.tmp/std_1f
						rm -f ~/.tmp/mine_1f ;;

					"g")
						clear
						echo "ls -alrtR ~/.tmp/temp_dir"
						ls -alrtR ~/.tmp/temp_dir
						echo
						echo "./ft_ls -alrtR ~/.tmp/temp_dir"
						./ft_ls -alrtR ~/.tmp/temp_dir
						echo
						ls -alrtR ~/.tmp/temp_dir > ~/.tmp/std_1g
						./ft_ls -alrtR ~/.tmp/temp_dir > ~/.tmp/mine_1g
						diff ~/.tmp/std_1g ~/.tmp/mine_1g > ~/.tmp/res_1g
						if [[ -s ~/.tmp/res_1g ]] ; then
							echo "***FAIL: see ~/.tmp/res_1g for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1g
						fi ;
						rm -f ~/.tmp/std_1g
						rm -f ~/.tmp/mine_1g ;;

					"h")
						clear
						echo "ls -f1 ~/.tmp/temp_dir"
						ls -f1 ~/.tmp/temp_dir
						echo
						echo "./ft_ls -f1 ~/.tmp/temp_dir"
						./ft_ls -f ~/.tmp/temp_dir
						echo
						ls -f1 ~/.tmp/temp_dir > ~/.tmp/std_1f
						./ft_ls -f ~/.tmp/temp_dir > ~/.tmp/mine_1f
						diff ~/.tmp/std_1f ~/.tmp/mine_1f > ~/.tmp/res_1f
						if [[ -s ~/.tmp/res_1f ]] ; then
							echo "***FAIL: see ~/.tmp/res_1f for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_1f
						fi ;
						rm -f ~/.tmp/std_1f
						rm -f ~/.tmp/mine_1f ;;

					"q")
						rm -rf ~/.tmp/temp_dir
						(( LAYER_TWO = 0 )) ;;

					*)
						clear
						echo
						echo "***Please enter a valid option***" ;;
				esac
			done
			clear ;;

		"2")
			mkdir -p ~/.tmp/temp_dir
			touch ~/.tmp/temp_dir/file1
			touch ~/.tmp/temp_dir/zzzzz
			touch ~/.tmp/temp_dir/file2
			touch ~/.tmp/temp_dir/+file
			touch ~/.tmp/temp_dir/zfile
			ln -s ~/.tmp/temp_dir/zzzzz ~/.tmp/temp_dir/link
			ln -s ~/.tmp/temp_dir/link_the_loopy_hero ~/.tmp/temp_dir/link_the_loopy_hero
			mkdir -p ~/.tmp/temp_dir/dir1
			mkdir -p ~/.tmp/temp_dir/dir2
			mkdir -p ~/.tmp/temp_dir/dir1/dir3
			touch ~/.tmp/temp_dir/dir1/dir3/go_go_gadget_robotest
			touch ~/.tmp/temp_dir/dir1/hi_mom
			mkdir -p ~/.tmp/temp_dir/dir1/dir_dir_dir_dir_dir
			(( LAYER_TWO = 1 ))
			while [[ $LAYER_TWO == 1 ]] ; do
				echo
				echo
				echo
				echo
				echo "Select an option:"
				echo
				echo "a) basic test passed as params"
				echo "b) -a test passed as params"
				echo "c) -l test passed as params"
				echo "d) -r test passed as params"
				echo "e) -t test passed as params"
				echo "f) -R test passed as params"
				echo "g) mixed flags test passed as params"
				echo "h) -f test passed as params (bonus)"
				echo "q) back"
				echo
				read -n1 TARGET_TWO
				
				case $TARGET_TWO in
					
					"a")
						clear
						echo "ls -1 ~/.tmp/temp_dir/*"
						ls -1 ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -1 ~/.tmp/temp_dir/*"
						./ft_ls ~/.tmp/temp_dir/*
						echo
						ls -1 ~/.tmp/temp_dir/* > ~/.tmp/std_2a
						./ft_ls ~/.tmp/temp_dir/* > ~/.tmp/mine_2a
						diff ~/.tmp/std_2a ~/.tmp/mine_2a > ~/.tmp/res_2a
						if [[ -s ~/.tmp/res_2a ]] ; then
							echo "***FAIL: see ~/.tmp/res_2a for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2a
						fi ;
						rm -f ~/.tmp/std_2a
						rm -f ~/.tmp/mine_2a ;;

					"b")
						clear
						echo "ls -a1 ~/.tmp/temp_dir/*"
						ls -a1 ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -a ~/.tmp/temp_dir/*"
						./ft_ls -a ~/.tmp/temp_dir/*
						echo
						ls -a1 ~/.tmp/temp_dir/* > ~/.tmp/std_2b
						./ft_ls -a ~/.tmp/temp_dir/* > ~/.tmp/mine_2b
						diff ~/.tmp/std_2b ~/.tmp/mine_2b > ~/.tmp/res_2b
						if [[ -s ~/.tmp/res_2b ]] ; then
							echo "***FAIL: see ~/.tmp/res_2b for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2b
						fi ;
						rm -f ~/.tmp/std_2b
						rm -f ~/.tmp/mine_2b ;;

					"c")
						clear
						echo "ls -l ~/.tmp/temp_dir/*"
						ls -l ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -l ~/.tmp/temp_dir/*"
						./ft_ls -l ~/.tmp/temp_dir/*
						echo
						ls -l ~/.tmp/temp_dir/* > ~/.tmp/std_2c
						./ft_ls -l ~/.tmp/temp_dir/* > ~/.tmp/mine_2c
						diff ~/.tmp/std_2c ~/.tmp/mine_2c > ~/.tmp/res_2c
						if [[ -s ~/.tmp/res_2c ]] ; then
							echo "***FAIL: see ~/.tmp/res_2c for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2c
						fi ;
						rm -f ~/.tmp/std_2c
						rm -f ~/.tmp/mine_2c ;;

					"d")
						clear
						echo "ls -r1 ~/.tmp/temp_dir/*"
						ls -r1 ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -r ~/.tmp/temp_dir/*"
						./ft_ls -r ~/.tmp/temp_dir/*
						echo
						ls -r1 ~/.tmp/temp_dir/* > ~/.tmp/std_2d
						./ft_ls -r ~/.tmp/temp_dir/* > ~/.tmp/mine_2d
						diff ~/.tmp/std_2d ~/.tmp/mine_2d > ~/.tmp/res_2d
						if [[ -s ~/.tmp/res_2d ]] ; then
							echo "***FAIL: see ~/.tmp/res_2d for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2d
						fi ;
						rm -f ~/.tmp/std_2d
						rm -f ~/.tmp/mine_2d ;;

					"e")
						clear
						echo "ls -t1 ~/.tmp/temp_dir/*"
						ls -t1 ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -t ~/.tmp/temp_dir/*"
						./ft_ls -t ~/.tmp/temp_dir/*
						echo
						ls -t ~/.tmp/temp_dir/* > ~/.tmp/std_2e
						./ft_ls -t ~/.tmp/temp_dir/* > ~/.tmp/mine_2e
						diff ~/.tmp/std_2e ~/.tmp/mine_2e > ~/.tmp/res_2e
						if [[ -s ~/.tmp/res_2e ]] ; then
							echo "***FAIL: see ~/.tmp/res_2e for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2e
						fi ;
						rm -f ~/.tmp/std_2e
						rm -f ~/.tmp/mine_2e ;;

					"f")
						clear
						echo "ls -R1 ~/.tmp/temp_dir/*"
						ls -R1 ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -R ~/.tmp/temp_dir/*"
						./ft_ls -R ~/.tmp/temp_dir/*
						echo
						ls -R1 ~/.tmp/temp_dir/* > ~/.tmp/std_2f
						./ft_ls -R ~/.tmp/temp_dir/* > ~/.tmp/mine_2f
						diff ~/.tmp/std_2f ~/.tmp/mine_2f > ~/.tmp/res_2f
						if [[ -s ~/.tmp/res_2f ]] ; then
							echo "***FAIL: see ~/.tmp/res_2f for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2f
						fi ;
						rm -f ~/.tmp/std_2f
						rm -f ~/.tmp/mine_2f ;;

					"g")
						clear
						echo "ls -alrtR ~/.tmp/temp_dir/*"
						ls -alrtR ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -alrtR ~/.tmp/temp_dir/*"
						./ft_ls -alrtR ~/.tmp/temp_dir/*
						echo
						ls -alrtR ~/.tmp/temp_dir/* > ~/.tmp/std_2g
						./ft_ls -alrtR ~/.tmp/temp_dir/* > ~/.tmp/mine_2g
						diff ~/.tmp/std_2g ~/.tmp/mine_2g > ~/.tmp/res_2g
						if [[ -s ~/.tmp/res_2g ]] ; then
							echo "***FAIL: see ~/.tmp/res_2g for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2g
						fi ;
						rm -f ~/.tmp/std_2g
						rm -f ~/.tmp/mine_2g ;;

					"h")
						clear
						echo "ls -f1 ~/.tmp/temp_dir/*"
						ls -f1 ~/.tmp/temp_dir/*
						echo
						echo "./ft_ls -f1 ~/.tmp/temp_dir/*"
						./ft_ls -f ~/.tmp/temp_dir/*
						echo
						ls -f1 ~/.tmp/temp_dir/* > ~/.tmp/std_2f
						./ft_ls -f ~/.tmp/temp_dir/* > ~/.tmp/mine_2f
						diff ~/.tmp/std_2f ~/.tmp/mine_2f > ~/.tmp/res_2f
						if [[ -s ~/.tmp/res_2f ]] ; then
							echo "***FAIL: see ~/.tmp/res_2f for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_2f
						fi ;
						rm -f ~/.tmp/std_2f
						rm -f ~/.tmp/mine_2f ;;

					"q")
						rm -rf ~/.tmp/temp_dir
						(( LAYER_TWO = 0 )) ;;

					*)
						clear
						echo
						echo "***Please enter a valid option***" ;;
				esac
			done
			clear ;;

		"3")
			(( LAYER_TWO = 1 ))
			while [[ $LAYER_TWO == 1 ]] ; do
				echo
				echo
				echo
				echo
				echo "Select an option:"
				echo
				echo "a) improper flags test"
				echo "b) -l norights dir test"
				echo "c) -R norights dir test"
				echo "d) -lR norights dir test"
				echo "q) back"
				echo
				read -n1 TARGET_TWO

				case $TARGET_TWO in

					"a")
						clear
						echo "ls -1 --"
						ls -1 --
						echo
						echo "./ft_ls --"
						./ft_ls --
						echo
						echo "ls --a"
						ls --a
						echo
						echo "./ft_ls --a"
						./ft_ls --a
						echo
						echo "ls -."
						ls -.
						echo
						echo "./ft_ls -."
						./ft_ls -.
						echo
						echo "ls -z"
						ls -z
						echo
						echo "./ft_ls -z"
						./ft_ls -z
						echo
						echo "***Does the error result look reasonable?***" ;;

					"b")
						clear
						mkdir -p ~/.tmp/norights
						chmod 000 ~/.tmp/norights
						echo "ls -l ~/.tmp/norights"
						ls -l ~/.tmp/norights
						echo
						echo "./ft_ls -l ~/.tmp/norights"
						./ft_ls -l ~/.tmp/norights
						chmod 777 ~/.tmp/norights
						rm -d ~/.tmp/norights
						echo
						echo "***Does the error result look reasonable?***" ;;

					"c")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch ~/.tmp/temp_dir/file1
						touch ~/.tmp/temp_dir/file2
						touch ~/.tmp/temp_dir/file3
						mkdir -p ~/.tmp/temp_dir/dir1
						mkdir -p ~/.tmp/temp_dir/dir2
						mkdir -p ~/.tmp/temp_dir/norights
						chmod 000 ~/.tmp/temp_dir/norights
						echo "ls -1R ~/.tmp/temp_dir"
						ls -1R ~/.tmp/temp_dir
						echo
						echo "./ft_ls -R ~/.tmp/temp_dir"
						./ft_ls -R ~/.tmp/temp_dir
						ls -R ~/.tmp/temp_dir > ~/.tmp/std_3c
						./ft_ls -R ~/.tmp/temp_dir > ~/.tmp/mine_3c
						diff ~/.tmp/std_3c ~/.tmp/mine_3c > ~/.tmp/res_3c
						echo
						if [[ -s ~/.tmp/res_3c ]] ; then
							echo "***FAIL: see ~/.tmp/res_3c for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							echo
							echo "***Does the error result look reasonable?***"
							echo "Note that ls DOES in fact throw 2 error messages"
							rm -f ~/.tmp/res_3c
						fi ;
						rm -f ~/.tmp/std_3c
						rm -f ~/.tmp/mine_3c
						chmod 777 ~/.tmp/temp_dir/norights
						rm -rf ~/.tmp/temp_dir ;;

					"d")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch ~/.tmp/temp_dir/file1
						touch ~/.tmp/temp_dir/file2
						touch ~/.tmp/temp_dir/file3
						mkdir -p ~/.tmp/temp_dir/dir1
						mkdir -p ~/.tmp/temp_dir/dir2
						mkdir -p ~/.tmp/temp_dir/norights
						chmod 000 ~/.tmp/temp_dir/norights
						echo "ls -1lR ~/.tmp/temp_dir"
						ls -1lR ~/.tmp/temp_dir
						echo
						echo "./ft_ls -lR ~/.tmp/temp_dir"
						./ft_ls -lR ~/.tmp/temp_dir
						ls -lR ~/.tmp/temp_dir > ~/.tmp/std_3d
						./ft_ls -lR ~/.tmp/temp_dir > ~/.tmp/mine_3d
						diff ~/.tmp/std_3d ~/.tmp/mine_3d > ~/.tmp/res_3d
						echo
						if [[ -s ~/.tmp/res_3d ]] ; then
							echo "***FAIL: see ~/.tmp/res_3d for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							echo
							echo "***Does the error result look reasonable?***"
							echo "Note that ls DOES in fact throw 2 error messages"
							rm -f ~/.tmp/res_3d
						fi ;
						rm -f ~/.tmp/std_3d
						rm -f ~/.tmp/mine_3d
						chmod 777 ~/.tmp/temp_dir/norights
						rm -rf ~/.tmp/temp_dir ;;

					"q")
						rm -rf ~/.tmp/temp_dir
						(( LAYER_TWO = 0 )) ;;

					*)
						clear
						echo
						echo "***Please enter a valid option***" ;;
				esac
			done
			clear ;;

		"4")
			(( LAYER_TWO = 1 ))
			while [[ $LAYER_TWO == 1 ]] ; do
				echo
				echo
				echo
				echo
				echo "Select an option:"
				echo
				echo "a) standard permissions test"
				echo "b) -l character devices test"
				echo "c) -l block devices test"
				echo "q) back"
				echo
				read -n1 TARGET_TWO

				case $TARGET_TWO in

					"a")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch ~/.tmp/temp_dir/file1
						touch ~/.tmp/temp_dir/file2
						touch ~/.tmp/temp_dir/file3
						touch ~/.tmp/temp_dir/file4
						touch ~/.tmp/temp_dir/file5
						touch ~/.tmp/temp_dir/file6
						touch ~/.tmp/temp_dir/file7
						touch ~/.tmp/temp_dir/file8
						touch ~/.tmp/temp_dir/file9
						chmod 444 ~/.tmp/temp_dir/file1
						chmod 222 ~/.tmp/temp_dir/file2
						chmod 111 ~/.tmp/temp_dir/file3
						chmod 4000 ~/.tmp/temp_dir/file4
						chmod 2000 ~/.tmp/temp_dir/file5
						chmod 1000 ~/.tmp/temp_dir/file6
						chmod 4777 ~/.tmp/temp_dir/file7
						chmod 2777 ~/.tmp/temp_dir/file8
						chmod 1777 ~/.tmp/temp_dir/file9
						echo "ls -l ~/.tmp/temp_dir"
						ls -l ~/.tmp/temp_dir
						echo
						echo "./ft_ls -l ~/.tmp/temp_dir"
						./ft_ls -l ~/.tmp/temp_dir
						echo
						ls -l ~/.tmp/temp_dir > ~/.tmp/std_4a
						./ft_ls -l ~/.tmp/temp_dir > ~/.tmp/mine_4a
						diff ~/.tmp/std_4a ~/.tmp/mine_4a > ~/.tmp/res_4a
						if [[ -s ~/.tmp/res_4a ]] ; then
							echo "***FAIL: see ~/.tmp/res_4a for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_4a
						fi ;
						chmod 777 ~/.tmp/temp_dir/file1
						chmod 777 ~/.tmp/temp_dir/file2
						chmod 777 ~/.tmp/temp_dir/file3
						chmod 777 ~/.tmp/temp_dir/file4
						chmod 777 ~/.tmp/temp_dir/file5
						chmod 777 ~/.tmp/temp_dir/file6
						chmod 777 ~/.tmp/temp_dir/file7
						chmod 777 ~/.tmp/temp_dir/file8
						chmod 777 ~/.tmp/temp_dir/file9
						rm -rf ~/.tmp/temp_dir
						rm -f ~/.tmp/std_4a
						rm -f ~/.tmp/mine_4a ;;
						

					"b")
						clear
						echo "ls -l /dev/ptyp*"
						ls -l /dev/ptyp*
						echo
						echo "./ft_ls -l /dev/ptyp*"
						./ft_ls -l /dev/ptyp*
						echo
						ls -l /dev/ptyp* > ~/.tmp/std_4b
						./ft_ls -l /dev/ptyp* > ~/.tmp/mine_4b
						diff ~/.tmp/std_4b ~/.tmp/mine_4b > ~/.tmp/res_4b
						if [[ -s ~/.tmp/res_4b ]] ; then
							echo "***FAIL: see ~/.tmp/res_4b for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_4b
						fi ;
						rm -f ~/.tmp/std_4b
						rm -f ~/.tmp/mine_4b ;;

					"c")
						clear
						echo "ls -l /dev/disk*"
						ls -l /dev/disk*
						echo
						echo "./ft_ls -l /dev/disk*"
						./ft_ls -l /dev/disk*
						echo
						ls -l /dev/disk* > ~/.tmp/std_4c
						./ft_ls -l /dev/disk* > ~/.tmp/mine_4c
						diff ~/.tmp/std_4c ~/.tmp/mine_4c > ~/.tmp/res_4c
						if [[ -s ~/.tmp/res_4c ]] ; then
							echo "***FAIL: see ~/.tmp/res_4c for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_4c
						fi ;
						rm -f ~/.tmp/std_4c
						rm -f ~/.tmp/mine_4c ;;

					"q")
						rm -rf ~/.tmp/temp_dir
						(( LAYER_TWO = 0 )) ;;

					*)
						clear
						echo
						echo "***Please enter a valid option***" ;;
				esac
			done
			clear ;;

		"5")
			(( LAYER_TWO = 1 ))
			while [[ $LAYER_TWO == 1 ]] ; do
				echo
				echo
				echo
				echo
				echo "Select an option:"
				echo
				echo "a) standard test"
				echo "b) nanosecond test"
				echo "c) equal time test"
				echo "d) access time test (bonus)"
				echo "e) change time test (bonus)"
				echo "q) back"
				echo
				read -n1 TARGET_TWO

				case $TARGET_TWO in

					"a")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch -t 9999081011 ~/.tmp/temp_dir/file1
						touch ~/.tmp/temp_dir/file2
						touch -t 9999115045 ~/.tmp/temp_dir/file3
						touch -t 17091104 ~/.tmp/temp_dir/file4
						touch ~/.tmp/temp_dir/file5
						touch -t 12115659 ~/.tmp/temp_dir/file6
						touch -t 17012020 ~/.tmp/temp_dir/file7
						touch -t 9412290106 ~/.tmp/temp_dir/file8
						touch -t 1612250101 ~/.tmp/temp_dir/file9
						echo "ls -lt ~/.tmp/temp_dir"
						ls -lt ~/.tmp/temp_dir
						echo
						echo "./ft_ls -lt ~/.tmp/temp_dir"
						./ft_ls -lt ~/.tmp/temp_dir
						echo
						ls -lt ~/.tmp/temp_dir > ~/.tmp/std_5a
						./ft_ls -lt ~/.tmp/temp_dir > ~/.tmp/mine_5a
						diff ~/.tmp/std_5a ~/.tmp/mine_5a > ~/.tmp/res_5a
						if [[ -s ~/.tmp/res_5a ]] ; then
							echo "***FAIL: see ~/.tmp/res_5a for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_5a
						fi ;
						rm -f ~/.tmp/std_5a
						rm -f ~/.tmp/mine_5a ;;

					"b")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch ~/.tmp/temp_dir/file1
						touch ~/.tmp/temp_dir/file3
						touch ~/.tmp/temp_dir/file6
						touch ~/.tmp/temp_dir/file9
						touch ~/.tmp/temp_dir/file5
						touch ~/.tmp/temp_dir/file2
						touch ~/.tmp/temp_dir/file8
						touch ~/.tmp/temp_dir/file7
						touch ~/.tmp/temp_dir/file4
						echo "ls -lt ~/.tmp/temp_dir"
						ls -lt ~/.tmp/temp_dir
						echo
						echo "./ft_ls -lt ~/.tmp/temp_dir"
						./ft_ls -lt ~/.tmp/temp_dir
						echo
						ls -lt ~/.tmp/temp_dir > ~/.tmp/std_5b
						./ft_ls -lt ~/.tmp/temp_dir > ~/.tmp/mine_5b
						diff ~/.tmp/std_5b ~/.tmp/mine_5b > ~/.tmp/res_5b
						if [[ -s ~/.tmp/res_5b ]] ; then
							echo "***FAIL: see ~/.tmp/res_5b for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_5b
						fi ;
						rm -f ~/.tmp/std_5b
						rm -f ~/.tmp/mine_5b ;;

					"c")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch ~/.tmp/temp_dir/file1
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file3
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file6
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file9
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file5
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file2
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file8
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file7
						touch -r ~/.tmp/temp_dir/file1 ~/.tmp/temp_dir/file4
						echo "ls -lt ~/.tmp/temp_dir"
						ls -lt ~/.tmp/temp_dir
						echo
						echo "./ft_ls -lt ~/.tmp/temp_dir"
						./ft_ls -lt ~/.tmp/temp_dir
						echo
						ls -lt ~/.tmp/temp_dir > ~/.tmp/std_5c
						./ft_ls -lt ~/.tmp/temp_dir > ~/.tmp/mine_5c
						diff ~/.tmp/std_5c ~/.tmp/mine_5c > ~/.tmp/res_5c
						if [[ -s ~/.tmp/res_5c ]] ; then
							echo "***FAIL: see ~/.tmp/res_5c for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_5c
						fi ;
						rm -f ~/.tmp/std_5c
						rm -f ~/.tmp/mine_5c ;;

					"d")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch -at 9999081011 ~/.tmp/temp_dir/file1
						touch ~/.tmp/temp_dir/file2
						touch -at 9999115045 ~/.tmp/temp_dir/file3
						touch -at 17091104 ~/.tmp/temp_dir/file4
						touch ~/.tmp/temp_dir/file5
						touch -at 12115659 ~/.tmp/temp_dir/file6
						touch -at 17012020 ~/.tmp/temp_dir/file7
						touch -at 9412290106 ~/.tmp/temp_dir/file8
						touch -at 1612250101 ~/.tmp/temp_dir/file9
						echo "ls -lu ~/.tmp/temp_dir"
						ls -ltu ~/.tmp/temp_dir
						echo
						echo "./ft_ls -lu ~/.tmp/temp_dir"
						./ft_ls -ltu ~/.tmp/temp_dir
						echo
						ls -ltu ~/.tmp/temp_dir > ~/.tmp/std_5a
						./ft_ls -ltu ~/.tmp/temp_dir > ~/.tmp/mine_5a
						diff ~/.tmp/std_5a ~/.tmp/mine_5a > ~/.tmp/res_5a
						if [[ -s ~/.tmp/res_5a ]] ; then
							echo "***FAIL: see ~/.tmp/res_5a for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_5a
						fi ;
						rm -f ~/.tmp/std_5a
						rm -f ~/.tmp/mine_5a ;;

					"e")
						clear
						mkdir -p ~/.tmp/temp_dir
						touch ~/.tmp/temp_dir/file1
						touch ~/.tmp/temp_dir/file2
						touch ~/.tmp/temp_dir/file3
						touch ~/.tmp/temp_dir/file4
						touch ~/.tmp/temp_dir/file5
						touch ~/.tmp/temp_dir/file6
						touch ~/.tmp/temp_dir/file7
						touch ~/.tmp/temp_dir/file8
						touch ~/.tmp/temp_dir/file9
						chmod 744 ~/.tmp/temp_dir/file2
						chmod 744 ~/.tmp/temp_dir/file4
						chmod 744 ~/.tmp/temp_dir/file6
						chmod 744 ~/.tmp/temp_dir/file8
						chmod 744 ~/.tmp/temp_dir/file3
						chmod 644 ~/.tmp/temp_dir/file2
						chmod 644 ~/.tmp/temp_dir/file4
						chmod 644 ~/.tmp/temp_dir/file6
						chmod 644 ~/.tmp/temp_dir/file8
						chmod 644 ~/.tmp/temp_dir/file3
						echo "ls -lu ~/.tmp/temp_dir"
						ls -ltc ~/.tmp/temp_dir
						echo
						echo "./ft_ls -lu ~/.tmp/temp_dir"
						./ft_ls -ltc ~/.tmp/temp_dir
						echo
						ls -ltc ~/.tmp/temp_dir > ~/.tmp/std_5a
						./ft_ls -ltc ~/.tmp/temp_dir > ~/.tmp/mine_5a
						diff ~/.tmp/std_5a ~/.tmp/mine_5a > ~/.tmp/res_5a
						if [[ -s ~/.tmp/res_5a ]] ; then
							echo "***FAIL: see ~/.tmp/res_5a for diff***"
						else
							echo "***SUCCESS: diff of two outputs is empty***"
							rm -f ~/.tmp/res_5a
						fi ;
						rm -f ~/.tmp/std_5a
						rm -f ~/.tmp/mine_5a ;;

					"q")
						rm -rf ~/.tmp/temp_dir
						(( LAYER_TWO = 0 )) ;;

					*)
						clear
						echo
						echo "***Please enter a valid option***" ;;
				esac
			done
			clear ;;

		"h")
			clear
			echo "DDDDD       OOO     N    N   TTTTTTT    PPPP       A      N    N   IIIIIII     CCCC"
			echo "D    D     O   O    NN   N      T       P   P     A A     NN   N      I       C"
			echo "D     D   O     O   N N  N      T       P   P    A   A    N N  N      I      C"
			echo "D     D   O     O   N  N N      T       PPPP    AAAAAAA   N  N N      I      C"
			echo "D    D     O   O    N   NN      T       P       A     A   N   NN      I       C"
			echo "DDDDD       OOO     N    N      T       P       A     A   N    N   IIIIIII     CCCC"
			echo
			echo
			echo
			echo
			echo "INSTRUCTIONS:"
			echo
			echo "Put this file in the cloned directory"
			echo
			echo "Make sure you have already made an executable via make"
			echo
			echo "Navigate using the letters on your keyboard corresponding to what you want to do"
			echo
			echo
			echo
			echo "This script make use of ~/.tmp/ greatly, so USE CAUTION if you use this dir for other things"
			echo
			echo
			echo "Ping csummers if you find any bugs or want to suggest more fun tests"
			echo "Or just want to hang out with him"
			echo "He gets lonely on cold nights alone in the lab"
			echo "And nothing warms him up like free snacks :+1:" ;;

		"q")
			(( LAYER_ONE = 0 )) ;;

		*)
			echo
			echo "***Please enter a valid option***" ;;
	esac
done