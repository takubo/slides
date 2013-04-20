#!/bin/sh

page1()
{
echo ''
echo ''
yellow; bold
echo '	AWK Hacks!!'
reset
echo ''
echo ''
echo ''
echo '	 田窪守雄'
echo ''
echo '      @takubo_morio'
echo ''
echo '      github.com/takubo'
echo ''
}

page2()
{
echo ''
echo ''
echo ''
echo '	  ちょっとアンケート'
echo ''
echo ''
echo ''
}

page3()
{
yellow; bold
echo '* アンケート1) AWK使ってますか?'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo ''
}

page4()
{
yellow; bold
echo '* アンケート1) AWK使ってますか?'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  ア．よく使う'
echo ''
echo '  イ．たまに使う'
echo ''
echo '  ウ．(まったく/ほとんど)使ったことがない'
echo ''
echo '  エ．AWK? 何それ? おいしいの?'
}

page5()
{
yellow; bold
echo '* AWK何に使ってますか?(複数回答可)'
reset
yellow; bold
echo '*    何を作ってますか?'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo ''
}

page6()
{
yellow; bold
echo '* アンケート2) AWK何に使ってますか?(複数回答可)'
reset
yellow; bold
echo '*                 何を作ってますか?'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  ア．3Dグラフィックスによる情報の可視化'
echo ''
echo '  イ．産業機器設計のための数値シミュレーション'
echo ''
echo '  ウ．ネットワーク機器のテストのための'
echo '      簡易TCP/IPサーバ/クライアント'
echo ''
echo '  エ．その他'
}

page7()
{
yellow; bold
echo '* 自己紹介'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  田窪守雄'
echo ''
echo '  愛媛生まれ、関西(明石)在住'
echo '  組み込み系Cプログラマー'
echo ''
echo '  言語マニア'
echo ''
echo '  AWK使い'
echo '  (AWKの拡張ライブラリとか作ってます)'
echo ''
}

page8()
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

page9()
{
yellow; bold
echo '* 発表の流れ'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ' Hack #1. AWKで3Dグラフィックを描く'
echo '          (awkGLの紹介)'
echo ''
echo ' Hack #2. AWKで顔認識する'
echo '          (OpenCV-AWKの紹介)'
echo ''
echo ' Hack #3. AWKプログラムをデバッグする'
echo '          (AVDの紹介)'
echo ''
echo ' Hack #4. AWKの黒魔術を使う'
echo '          (CACCの紹介)'
}

page10()
{
yellow; bold
echo '* Hack #1. AWKで3Dグラフィックを描く'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '     awkGLの紹介'
}

page11()
{
yellow; bold
echo '* awkGLとは'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  GAWKのCエクステンションという機能による'
echo '  GAWK(GNU AWK)のOpenGL拡張'
}

page12()
{
yellow; bold
echo '* Cエクステンションとは'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  (Cで書かれた)共有ライブラリを'
echo '  ダイナミックロードして(GAWKを)'
echo '  機能拡張する仕組み。'
echo ''
echo ''
echo '  より簡単に言えば'
echo '  AWKから呼び出す関数をCで書ける機能。'
}

page13()
{
echo ''
echo ''
echo '  というわけで、awkGL のデモします。'
echo ''
echo ''
echo ''
}

page14()
{
yellow; bold
echo '* Hack #2. AWKで顔認識する'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '     OpenCV-AWKの紹介'
echo ''
echo ''
echo ''
}

page15()
{
yellow; bold
echo '* OpenCV-AWKとは'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  GAWKのCエクステンションによる'
echo '  GAWK(GNU AWK)のOpenCV拡張'
echo ''
echo ''
echo ''
}

page16()
{
echo ''
echo ''
echo ''
echo '  早速ですが、デモします。'
echo ''
echo ''
echo ''
}

page17()
{
yellow; bold
echo '* Hack #3. AWKプログラムをデバッグする'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '     AVDの紹介'
}

page18()
{
yellow; bold
echo '* AVDとは'
reset
yellow
echo '----------------------------------------'
reset
}

page19()
{
yellow; bold
echo '* AVDとは'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  Awk Visual Debugger'
}

page20()
{
yellow; bold
echo '* AVDとは'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo ' GNUが作ったコマンドラインAWKデバッガ'
echo ' DGAWKというのがあります。'
echo ''
echo ' Vim上で動くDGAWKのフロントエンドがAVD'
echo ''
echo ''
}

page21()
{
yellow; bold
echo '* AVDとは'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ' DGAWKはGDBライク'
echo '    ↓'
echo ' 使い難い'
echo '    ↓'
echo ' dgawkのVimフロントエンド書いた'
echo '    ↓'
echo ' それが、AVD(AWK Visual Debugger)'
echo ''
echo ''
}

page22()
{
echo ''
echo ''
echo '  それでは、デモします。'
}

page23()
{
yellow; bold
echo '* Hack #4. AWKの黒魔術を使う'
reset
yellow; bold
echo '*         (CACCの紹介)'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo ''
}

page24()
{
yellow; bold
echo '* Hack #4. AWKの黒魔術を使う'
reset
yellow; bold
echo '*         (CACCの紹介)'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  CACC'
echo ''
echo ''
echo ''
}

page25()
{
yellow; bold
echo '* Hack #4. AWKの黒魔術を使う'
reset
yellow; bold
echo '*         (CACCの紹介)'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  C AWK Common Code'
echo ''
echo ''
echo ''
}

page26()
{
yellow; bold
echo '* Hack #4. AWKの黒魔術を使う'
reset
yellow; bold
echo '*         (CACCの紹介)'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '  C AWK 共通 コード'
echo ''
echo ''
echo ''
}

page27()
{
echo ''
echo ''
echo ''
echo '   とにかく、デモします。'
}

page28()
{
echo ''
echo ''
echo ''
echo '    今日のHackは以上です。'
}

page29()
{
yellow; bold
echo '* まとめ'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '    AWKがあれば、何でもできます。'
echo ''
echo ''
echo ''
}

page30()
{
echo ''
echo ''
echo '	AWK、いつやるか?'
}

page31()
{
echo ''
echo ''
echo '	AWK、いつやるか?'
echo ''
echo '	今でしょ！'
}

page32()
{
echo ''
echo ''
echo ''
echo '      御清聴、ありがとうございました。'
echo ''
echo ''
echo '      github.com/takubo'
echo ''
echo '      @takubo_morio'
echo ''
echo ''
}

page_num=32


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






