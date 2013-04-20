BEGIN {
    extension("./awkgl.so", "dlload")
    myTrackballInit()
    myInit()
    #		     X    Y   Wid  Height
    SetWindowPosSize(50, 50, 600, 450)
    #		  Window Title
    CreateWindow("Bounding Ball")
    #(0-255)	 R   G    B
    ClearColor(150, 150, 256)

    Enable("LIGHTING")
    #Light(0, "AMBIENT", )

    TimerFunc(interval, "timer", 0)
    MainLoop()
}

function myInit()
{
    ON = 1
    OFF = 0

    STT_IDLE = 0
    STT_STA_WAIT = 1
    STT_ACTING = 2
    STT_END_WAIT = 3

    #status = STT_IDLE
    status = STT_STA_WAIT

    k = 0.8	# 反発係数?

    g = 9.8	# 重力加速度
    radius = 20	# Ballの半径

    iniIniV = 80	# 初初速度
    th = 60	# 打出角度
    th = d2r(th)	# deg -> rad

    interval = 5	# 何秒ごとにtimer()を呼び出すか
    timeInc = 145	# 一回のtimer呼び出しまでに実時間で何秒たったことにするか

    staWaitCnt = 200	# 原点にボールをセットしてから、打出しまでに何秒待つか
    finWaitCnt = 200	# ボールが停止してから、その場で何秒待つか

    simuInit()
}

function simuInit()
{
    time = 0	# 打出しから何秒たったか
    x = y = 0	#ボールの座標
    x_org = 0	#ボールの打出し時のX座標
    v = iniIniV	#ボールの速度
}

function keyboard(key, x, y)
{
    switch (key) {
    case " ":
	if (status == STT_STA_WAIT) {
	    status = STT_ACTING #TODO
	} else {
	    simuInit()
	    status = STT_STA_WAIT
	}
	break
    case "b":
    case "l":
	zz_size /= 1.02
	break
    case "s":
	zz_size *= 1.02
	break
    case "0":
    case "=":
	zz_size = -600
	break
    case "f":
    case "\r":
    case "\n":
	FullScreenToggle()
	break
    case "q":
    case "Q":
    case "\033":
	print "exiting..."
	exit
	break
    }
}

function timer(val)
{
    if (status == STT_ACTING) {
	time += timeInc

	t = time / 1000
	#ｔ秒後の座標は
	x = v * t * cos(th) + x_org
	y = v * t * sin(th) - g * t * t / 2
if (0) {
	# 床で反発
	if (y <= 0) {
	    y = 0
	    status = STT_IDLE
	}
} else {
	if (y <= 0) {
	    y = 0
	    v = v * k
	    if (v <= iniIniV*0.03) {
		status = STT_IDLE
	    } else {
		time = 0	# 打出しから何秒たったか
		x_org = x
	    }
	}
}
    }

    TimerFunc(interval, "timer", 0)
}

function reshape(width, height)
{
    # トラックボールする範囲
    trackballRegion(width, height);

    Viewport(0, 0, width, height)

    MatrixMode("PROJECTION")
    LoadIdentity()
    Perspective(45, width/ height , 1, 10000)

    #LookAt(400.0, 150.0, 400.0,	0.0, 0.0, 0.0,	0.0, 1.0, 0.0)

    MatrixMode("MODELVIEW")
    LoadIdentity()

}

function display()
{
    MatrixMode("MODELVIEW")
    LoadIdentity()
#print status,x,y

    # 視点の移動（物体の方を奥に移動
    Translate(0.0, 0.0, zz_size);

    # トラックボール処理による回転
    MultMatrix(rt[0], rt[1], rt[2], rt[3], rt[4], rt[5], rt[6], rt[7], rt[8],
    rt[9], rt[10], rt[11], rt[12], rt[13], rt[14], rt[15])

    #print rt[0], rt[1], rt[2], rt[3], rt[4], rt[5], rt[6], rt[7], rt[8], rt[9], rt[10], rt[11], rt[12], rt[13], rt[14], rt[15]
    scene()
}

function scene()
{

    # Sun
    Light(0, "SPECULAR", 1, 1, 1, 1)
    Light(0, "DIFFUSE", 0.8, 0.8, 0.8, 1)
    #Light(0, "DIFFUSE", 0.1, 0.1, 0.1, 1)
    Light(0, "AMBIENT", 0.5, 0.5, 0.5, 1)
    #Light(0, "POSITION", 1, 0, 0, 1)
    Light(0, "POSITION", 0, 1000, 0, 0)
    Light(0, "DIRECTION", 0, -1, 0)

    #床の描画
    PushMatrix()

    Translate(0.0, -(radius+0.1), 0.0)		# ボールの半径分Y-方向に移動
    Material("FRONT", "AMBIENT", 10/255, 200/255, 132/255, 1)
    Begin("TRIANGLES")
    Normal(0, 1, 0)
    Vertex3d( 10000, 0,  10000)
    Vertex3d(-10000, 0,  10000)
    Vertex3d( 10000, 0, -10000)

    Normal(0, 1, 0)
    Vertex3d(-10000, 0,  10000)
    Vertex3d(-10000, 0, -10000)
    Vertex3d( 10000, 0, -10000)
    End()

    PushMatrix()

    Translate(0.0, 1, 0.0)		# ボールの半径分Y-方向に移動
    DrawAxes(1000)

    PopMatrix()
    PopMatrix()

    Translate(-x, y, 0.0)
    Material("BOTH", "SHININESS", 64)
    Material("BOTH", "SPECULAR", 255/255*0.9, 64/255*0.9, 64/255*0.9, 1)
    Material("BOTH", "DIFFUSE", 255/255*0.52, 64/255*0.52, 64/255*0.52, 1)
    Material("BOTH", "AMBIENT", 255/255*0.22, 64/255*0.22, 64/255*0.22, 1)
    SolidSphere(radius, 32, 32)	# Ball
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


function myTrackballInit()
{
zz_size = -600
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
SCALE = 1.3 * M_PI

# 回転の初期値 (クォータニオン)
cq[0] = 1.0;
cq[1] = 0.0;
cq[2] = 0.0;
cq[3] = 0.0;

# ドラッグ中の回転 (クォータニオン)
#? static double tq[4];

# 回転の変換行列
rt[ 0] = 0.560062
rt[ 1] = -0.195893
rt[ 2] = 0.804957
rt[ 3] = 0
rt[ 4] = 0.00566048
rt[ 5] = 0.972524
rt[ 6] = 0.232734
rt[ 7] = 0
rt[ 8] = -0.828431
rt[ 9] = -0.125789
rt[10] = 0.545783
rt[11] = 0
rt[12] = 0
rt[13] = 0
rt[14] = 0
rt[15] = 1

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
