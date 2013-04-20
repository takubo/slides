function keyboard(key, x, y)
{
    switch (key) {
    case " ":
    case "f":
    case "\r":
    case "\n":
	FullScreenToggle()
	break
    case "b":
    case "l":
	#zz_size *= 1.01
	zz_size += 0.05
	break
    case "s":
	zz_size *= 1 / 1.01
	#zz_size -= 0.05
	#zz_size = zz_size < 0.00 ? 0.00 : zz_size
	break
    case "0":
    case "=":
	zz_size = 1.5
	break
    case "q":
    case "Q":
    case "\033":
	print "exiting..."
	exit
	break
    }

}

#
# シーンの描画
#
function scene()
{
    ClearColor(39,39,39)
    ClearColor(39,0,0)
    #ClearColor(0, 0, 39)
    DrawAxes(10000 * zz_size)
    Color(255.0, 255.0, 0.0) # 黄
    Color(255.0, 255.0, 255.0) # 黄
    #SolidTeapot(-0.1 )
    #SolidTeapot(-1 )
    #SolidTeapot(-10 )
    #SolidTeapot(0.1 )
    WireTeapot(1 * zz_size)
    #SolidTeapot(10 )
    #SolidIcosahedron(2.6)
}

function display()
{
    # モデルビュー変換行列の初期化
    MatrixMode("MODELVIEW");
    LoadIdentity();

    # 光源の位置を設定
    #glLightfv(0, "POSITION", 0.0, 0.0, 1.0, 0.0 );

    # 視点の移動（物体の方を奥に移動
    Translate(0.0, 0.0, -5.0);

    # トラックボール処理による回転
    MultMatrix(rt[0], rt[1], rt[2], rt[3], rt[4], rt[5], rt[6], rt[7], rt[8],
    rt[9], rt[10], rt[11], rt[12], rt[13], rt[14], rt[15])

    print rt[0], rt[1], rt[2], rt[3], rt[4], rt[5], rt[6], rt[7], rt[8],
    rt[9], rt[10], rt[11], rt[12], rt[13], rt[14], rt[15]

    # 画面クリア
    #glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    # シーンの描画
    scene();

    # ダブルバッファリング
    #SwapBuffers();
}

function reshape(w, h)
{
    # トラックボールする範囲
    trackballRegion(w, h);

    # ウィンドウ全体をビューポートにする
    Viewport(0, 0, w, h);

    # 透視変換行列の指定
    MatrixMode("PROJECTION");

    # 透視変換行列の初期化
    LoadIdentity();
    Perspective(60.0, w / h, 1.0, 100.0);
}

function mouse(button, state, x, y)
{
    switch (button) {
    case "left":
	switch (state) {
	    case "down":
		# トラックボール開始
		trackballStart(x, y, 1);
		break;
	    case "up":
		# トラックボール停止
		trackballStop(x, y);
		break;
	    default:
		break;
	}
	break;
    case "right":
	switch (state) {
	    case "down":
		# トラックボール開始
		trackballStart(x, y, 2);
		dx = dy = arr = 0
		break;
	    case "up":
		# トラックボール停止
		trackballStop(x, y);
		break;
	    default:
		break;
	}
	break;
    default:
	break;
    }
}

function motion(x, y)
{
    # トラックボール移動
    trackballMotion(x, y);
}






#==================================================

BEGIN {
    extension("./awkgl.so", "dlload")
    #Enable("LIGHTING")
    myTrackballInit()
    #		     X    Y   Wid  Height
    SetWindowPosSize(50, 50, 900, 700)
    CreateWindow("Track-Demo")
    #Enable("LINE_SMOOTH")
    MainLoop()
}

function myTrackballInit()
{
zz_size = 1.5
#
# 簡易トラックボール処理
#

#extern void trackballInit(void);
#extern void trackballRegion(int w, int h);
#extern void trackballStart(int x, int y);
#extern void trackballMotion(int x, int y);
#extern void trackballStop(int x, int y);
#extern double *trackballRotation(void);

M_PI = 3.14159265358979323846

# ドラッグ開始位置
#? static int cx, cy;

# マウスの絶対位置→ウィンドウ内での相対位置の換算係数
#? static double sx, sy;

# マウスの相対位置→回転角の換算係数
SCALE = 2.0 * M_PI

# 回転の初期値 (クォータニオン)
cq[0] = 1.0;
cq[1] = 0.0;
cq[2] = 0.0;
cq[3] = 0.0;

# ドラッグ中の回転 (クォータニオン)
#? static double tq[4];

# 回転の変換行列
rt[ 0] = 1.0;
rt[ 1] = 0.0;
rt[ 2] = 0.0;
rt[ 3] = 0.0;
rt[ 4] = 0.0;
rt[ 5] = 1.0;
rt[ 6] = 0.0;
rt[ 7] = 0.0;
rt[ 8] = 0.0;
rt[ 9] = 0.0;
rt[10] = 1.0;
rt[11] = 0.0;
rt[12] = 0.0;
rt[13] = 0.0;
rt[14] = 0.0;
rt[15] = 1.0;

# ドラッグ中か否か
drag = 0;
}

#
# r <- p x q
#
#	static
function qmul(r, p, q)
{
    r[0] = p[0] * q[0] - p[1] * q[1] - p[2] * q[2] - p[3] * q[3];
    r[1] = p[0] * q[1] + p[1] * q[0] + p[2] * q[3] - p[3] * q[2];
    r[2] = p[0] * q[2] - p[1] * q[3] + p[2] * q[0] + p[3] * q[1];
    r[3] = p[0] * q[3] + p[1] * q[2] - p[2] * q[1] + p[3] * q[0];
}

#
# 回転変換行列 r <- クォータニオン q
#
#	static
function qrot(r, q,    x2, y2, z2, xy, yz, zx, xw, yw, zw)
{
    x2 = q[1] * q[1] * 2.0;
    y2 = q[2] * q[2] * 2.0;
    z2 = q[3] * q[3] * 2.0;
    xy = q[1] * q[2] * 2.0;
    yz = q[2] * q[3] * 2.0;
    zx = q[3] * q[1] * 2.0;
    xw = q[1] * q[0] * 2.0;
    yw = q[2] * q[0] * 2.0;
    zw = q[3] * q[0] * 2.0;

    r[ 0] = 1.0 - y2 - z2;
    r[ 1] = xy + zw;
    r[ 2] = zx - yw;
    r[ 4] = xy - zw;
    r[ 5] = 1.0 - z2 - x2;
    r[ 6] = yz + xw;
    r[ 8] = zx + yw;
    r[ 9] = yz - xw;
    r[10] = 1.0 - x2 - y2;
    r[ 3] = r[ 7] = r[11] = r[12] = r[13] = r[14] = 0.0;
    r[15] = 1.0;
}

#
# トラックボール処理の初期化
# 　　プログラムの初期化処理のところで実行する
#
function trackballInit()
{
    # ドラッグ中ではない
    drag = 0;

    # 単位クォーターニオン
    cq[0] = 1.0;
    cq[1] = 0.0;
    cq[2] = 0.0;
    cq[3] = 0.0;

    # 回転行列の初期化
    qrot(rt, cq);
}

#
# トラックボールする領域
# 　　Reshape コールバック (resize) の中で実行する
#
function trackballRegion(w, h)
{
    # マウスポインタ位置のウィンドウ内の相対的位置への換算用
    sx = 1.0 / w;
    sy = 1.0 / h;
}

#
# ドラッグ開始
# 　　マウスボタンを押したときに実行する
#
function trackballStart(x, y, d)
{
    # ドラッグ開始
    drag = d;

    # ドラッグ開始点を記録
    cx = x;
    cy = y;
}

#
# ドラッグ中
# 　　マウスのドラッグ中に実行する
#
#function trackballMotion(x, y,    dx, dy, a,    ar, as, dq)
function trackballMotion(x, y,    a,    ar, as, dq)
{
    if (drag) {
	# マウスポインタの位置のドラッグ開始位置からの変位
	dx = (x - cx) * sx;
	dy = (y - cy) * sy;

	# マウスポインタの位置のドラッグ開始位置からの距離
	a = sqrt(dx * dx + dy * dy);

	if ((drag == 1) && (a != 0.0)) {
	    ar = a * SCALE * 0.5;
	    as = sin(ar) / a;
	    dq[0] = cos(ar);
	    dq[1] = dy * as;
	    dq[2] = dx * as;
	    dq[3] = 0.0;

	    # クォータニオンを掛けて回転を合成
	    qmul(tq, dq, cq);

	    # クォータニオンから回転の変換行列を求める
	    qrot(rt, tq);
	}
    }
}

#
# 停止
# 　　マウスボタンを離したときに実行する
#
function trackballStop(x, y)
{
    # ドラッグ終了点における回転を求める
    trackballMotion(x, y);

    # 回転の保存
    cq[0] = tq[0];
    cq[1] = tq[1];
    cq[2] = tq[2];
    cq[3] = tq[3];

    # ドラッグ終了
    drag = 0;
}

#
# 回転の変換行列を戻す
# 　　戻り値を glMultMatrixd() などで使用してオブジェクトを回転する
#
function trackballRotation()
{
    return rt;
}


function idle(    a,    ar, as, dq)
{
    if (drag == 2) {
	# マウスポインタの位置のドラッグ開始位置からの変位
	#dx = (x - cx) * sx;
	#dy = (y - cy) * sy;

	# マウスポインタの位置のドラッグ開始位置からの距離
	a = sqrt(dx * dx + dy * dy);

	if (a != 0.0) {
	    #ar = arr + a * SCALE * 0.05
	    ar = (arr + a * SCALE * 0.05) % (2 * M_PI);
	    #print ar
	    as = sin(ar) / a;
	    dq[0] = cos(ar);
	    dq[1] = dy * as;
	    dq[2] = dx * as;
	    dq[3] = 0.0;

	    # クォータニオンを掛けて回転を合成
	    qmul(tq, dq, cq);

	    # クォータニオンから回転の変換行列を求める
	    qrot(rt, tq);
	    arr = ar
	}
    }
    PostRedisplay()
}
