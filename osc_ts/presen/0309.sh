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
echo ''
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
yellow
echo '----------------------------------------'
reset
echo '  ア．3Dグラフィックスによる情報の可視化'
echo ''
echo '  イ．画像処理のための顔認識'
echo ''
echo '  ウ．産業機器設計のための'
echo '      数値シミュレーション'
echo ''
echo '  エ．ネットワーク機器のテストのための'
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
}

page9()
{
echo ''
echo ''
echo ''
echo ''
echo '  では、実際に見てください。'
echo ''
echo ''
echo ''
}

page10()
{
echo ''
echo ''
echo ''
echo ''
echo '    なぜ、そんなものを作ったんですか？'
echo ''
echo ''
echo ''
}

page11()
{
echo ''
echo ''
echo ''
echo ''
echo '       OpenCV-AWK'
echo ''
echo ''
echo ''
}

page12()
{
echo ''
echo ''
echo ''
echo ''
echo '       OpenCV-AWK'
echo '  つい、カっとなって作った'
echo ''
echo ''
echo ''
}

page13()
{
echo ''
echo ''
echo ''
echo ''
echo '  Wikipediaで'
echo '  「OpenCV」の頁を見たら、'
echo '  AWKだけラッパーの記述がなかった。'
echo ''
echo ''
}

page14()
{
echo ''
echo ''
echo ''
echo ''
echo '  「なに!?AWKからは'
echo '    OpenCVが使えない!?」'
echo ''
echo ''
echo ''
}

page15()
{
echo ''
echo ''
echo ''
echo ''
echo '  「それは、おかしいだろう!!!!」'
echo ''
echo ''
echo ''
echo ''
}

page16()
{
echo ''
echo ''
echo ''
echo ''
echo '  怒りのあまり、'
echo '  そこからは記憶がない。'
echo ''
echo ''
echo ''
}

page17()
{
echo ''
echo ''
echo ''
echo ''
echo '  気付いたら、'
echo '  胸にライブラリが刺さったAWKが'
echo '  OpenCVまみれで倒れていた。'
echo ''
echo ''
}

page18()
{
echo ''
echo ''
echo ''
echo ''
echo '  今も反省はしていない。'
echo ''
echo ''
echo ''
}

page19()
{
echo ''
echo ''
echo ''
echo '          awkGL'
echo ''
echo ''
echo ''
}

page20()
{
echo ''
echo ''
echo ''
echo '      戦略ライブラリ awkGL'
echo ''
echo ''
echo ''
}

page21()
{
yellow; bold
echo '* なぜ戦略ライブラリawkGLを作ったか'
reset
yellow; bold
echo '*   (awkGLの目的)'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  1. 情報の手軽な可視化手段'
echo ''
echo '  2. CGプログラムのプロトタイピング'
echo ''
echo '  3. CGプログラミングの教育'
echo ''
echo '  4. AWKの普及活動'
echo ''
}

page22()
{
yellow; bold
echo '* 1. 情報の手軽な可視化手段'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  ちょっとしたことを手軽に可視化する。'
echo ''
}

page23()
{
yellow; bold
echo '* 1. 情報の手軽な可視化手段'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '    テキスト → AWK → テキスト'
echo ''
echo ''
echo '    テキスト → AWK → グラフィック'
echo ''
}

page24()
{
yellow; bold
echo '* 2. CGプログラムのプロトタイピング'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  Cで書く前に、手軽に構想を'
echo '  試してみることができる。'
}

page25()
{
yellow; bold
echo '* 3. CGプログラミングの教育'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  文法が簡易であるので、学習者は'
echo '  純粋なCGの理論に集中できる。'
echo ''
echo '  テキスト処理のことを一切考えなければ、'
echo '  AWKの学習コストは更に下がる。'
echo ''
echo '  文法がCに近いので、将来性もある。'
echo ''
echo '  AWK自体にも実用性。'
}

page26()
{
yellow; bold
echo '* 4. AWKの普及活動'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  ・ゲームを作れるようにする'
echo ''
echo '  　 − ゲームを作れない言語は普及しない説'
}

page27()
{
yellow; bold
echo '* 4. AWKの普及活動'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '  ・イベントなどでデモしたときの見栄えがよい'
echo ''
echo '     − テキスト処理は見た目が地味。'
echo ''
echo '     − テキスト処理やサーバはわかっている'
echo '       知らない人には何をしているか'
echo '       わかりずらい'
echo ''
echo '     − PerlやPythonなどの前でも'
echo '       蔭らないようなアピールが必要。'
}

page28()
{
yellow; bold
echo '* 4. AWKの普及活動'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '     − 「AwKとか言語じゃなくて'
echo '         コマンドだろｗ」'
echo '         とか言ってる連中を黙らせる。'
echo ''
}

page29()
{
yellow; bold
echo '* 4. AWKの普及活動'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo '     − 「AwKとか言語じゃなくて'
echo '         コマンドだろｗ」'
echo '         という誤った考えに染まった'
echo '	 不幸な人間たちを教え導く。'
echo ''
}

page30()
{
yellow; bold
echo '* まとめ'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '	言語は見た目が9割'
echo ''
echo ''
echo ''
}

page31()
{
yellow; bold
echo '* まとめ'
reset
yellow
echo '----------------------------------------'
reset
echo ''
echo ''
echo '	言語は見た目が9割'
echo ''
echo ''
echo '	今も反省はしていない。'
echo ''
echo ''
}

page32()
{
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






