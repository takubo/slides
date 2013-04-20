#!/bin/sh

page1()
{
echo ''
echo ''
yellow; bold
echo '	AWK Hacks'
reset
echo ''
echo ''
echo ''
echo '        田窪守雄'
echo ''
echo '      @takubo_morio'
echo ''
echo '      github.com/takubo'
}

page2()
{
yellow; bold
echo '* 自己紹介（表向き）'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  田窪守雄'
echo ''
echo '  愛媛生まれ、関西（明石）在住'
echo '  組み込み系Cプログラマー'
echo ''
echo '      @takubo_morio'
echo ''
echo '      github.com/takubo'
}

page3()
{
yellow; bold
echo '* 自己紹介（真実）'
reset
yellow
echo '----------------------------------------'
reset
echo '諸君　私はAWKが好きだ'
echo '諸君　私はAWKが大好きだ'
echo ''
echo 'AWKが好きだ'
echo 'AWKが好きだ'
echo 'AWKが好きだ'
echo 'AWKが好きだ'
echo 'AWKが好きだ'
echo 'AWKが好きだ'
echo 'AWKが好きだ'
}

page4()
{
yellow; bold
echo '* こんなものを作ってます'
reset
yellow
echo '----------------------------------------'
reset
echo '  awkGL'
echo '	gawkのOpenGL拡張'
echo ''
echo '  OpenCV-AWK'
echo '	gawkのOpenCV拡張'
echo ''
echo '  AVD(AWK Visual Debugger)'
echo '	Vim上で動くdgawkのフロントエンド'
echo ''
echo '  CACC'
echo '	とある黒魔術'
}

page5()
{
echo ''
echo ''
echo '    デモしてみます。'
}

page6()
{
echo ''
echo ''
echo '    なぜ、AWK を使うんですか？'
echo ''
echo '    なぜ、それを AWK でやるんですか？'
echo ''
echo '    AWKじゃなきゃダメなんですか？'
echo ''
echo ''
}

page7()
{
yellow; bold
echo '* なぜ、AWKを使うのか？'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  そこにAWKがあるから'
echo ''
}

page8()
{
yellow; bold
echo '* なぜ、AWKを使うのか？'
reset
yellow
echo '----------------------------------------'
reset
echo '  言語仕様が美しい'
echo ''
echo '  学習コストが極めて低い'
echo ''
echo '  小さいのにパワフル'
echo ''
echo '  『プログラミング言語 AWK』というバイブル'
echo ''
echo '  Cとよく似た文法'
}

page9()
{
yellow; bold
echo '* なぜ、AWKを使うのか？'
reset
yellow
echo '----------------------------------------'
reset
echo '  言語仕様が美しい'
echo ''
echo '  学習コストが極めて低い'
echo ''
echo '  小さいのにパワフル'
echo ''
echo '  『プログラミング言語 AWK』というバイブル'
echo ''
yellow
echo '  Cとよく似た文法'
reset
}

page10()
{
yellow; bold
echo '* CACC'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  CACC'
}

page11()
{
yellow; bold
echo '* CACC'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  C AWK Common Code'
echo ''
}

page12()
{
yellow; bold
echo '* CACC'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  C AWK 共通 コード'
}

page13()
{
echo ''
echo ''
echo ''
echo '    実際にやってみます。'
}

page14()
{
echo ''
echo ''
echo ''
echo '    今日のHackは以上です。    '
}

page15()
{
echo ''
echo ''
echo '	AWK、いつやるか?'
}

page16()
{
echo ''
echo ''
echo '	AWK、いつやるか?'
echo ''
echo '	今でしょ！'
}

page17()
{
echo ''
echo ''
echo ''
echo '   ご清聴、ありがとうございました。'
echo ''
echo ''
}

page_num=17


no_color() { echo -n '\033[m'; }

red() { echo -n '\033[31m'; }

yellow() { echo -n '\033[33m'; }

magenta() { echo -n '\033[35m'; }

cyan() { echo -n '\033[36m'; }

reset() { echo -n '\033[00m'; }

bold() { echo -n '\033[01m'; }

underline() { echo -n '\033[04m'; }

blink() { echo -n '\033[05m'; }


clear() { echo -n '\033[2J'; }

cursor_top() { echo -n '\033[0;0H'; }

no_cursor() { echo -n '\033[>5h'; }

show_cursor() { echo -n '\033[>5l'; }


getkey() { stty -echo raw; dd bs=1 count=1 2>/dev/null; stty cooked echo; }


# init
#trap "stty sane" KILL
#trap "stty sane" STOP
trap "stty sane" INT
#trap "stty sane" TERM
no_cursor

i=1
while : ; do
	clear
	cursor_top	# mintty only
	reset
	if [ $i -le 0 ] ; then i=1; fi
	if [ $i -gt $page_num ] ; then break; fi
	page$i $i
	case `getkey` in
		'' | 'q' ) break ;;
		'' | ' ' ) i=`expr $i + 1` ;;
		'' | 'b' ) i=`expr $i - 1` ;;
		'e'        ) i=$page_num ;;
		'' | 'z' ) stty sane; kill -TSTP $$; no_cursor ;;
	esac
done

# final
show_cursor
no_color
clear

exit




#end() { show_cursor; no_color; clear; }




#presen $1


#page1()
#{
#    bold
#    #underline
#    #magenta
#    echo $1
#    bold
#    yellow
#    echo $1 �ޔ�
#    reset
#    echo TT
#}
#
#page2()
#{
#    underline
#    echo $1
#    yellow
#    echo $1 �ޔ�
#    reset
#    echo TT
#}






