#!gawk-4.0.1 -f

BEGIN {
    extension("./OpenCV-AWK.so", "dlload")

    cascade_name = "haarcascade_frontalface_default.xml"

    switch (ARGV[1]) {
    case "qvga":
	w = 320
	h = 240
	break
    case "vga":
	w = 640
	h = 480
	break
    case "sxga":
	w = 1280
	h = 1024
	break
    case "svga":
    default:
	w = 640
	h = 480
	break
    }

    #capture = cvCreateCameraCapture()
    capture = cvCaptureFromCAM()

    #// この設定は，利用するカメラに依存する
    #// キャプチャサイズを設定する．
    cvSetCaptureProperty(capture, "CV_CAP_PROP_FRAME_WIDTH", w)
    cvSetCaptureProperty(capture, "CV_CAP_PROP_FRAME_HEIGHT", h)

    vw = cvCreateVideoWriter("vvvvv.mov", "PIM1", 30, w, h, 1)

    cvNamedWindow("Capture")
    cvMoveWindow("Capture", 100, 100)

    cvSetMouseCallback("Capture", "onmouse")

    mon = cvCreateImage(w, h, "IPL_DEPTH_8U", 1)
    gray = cvCreateImage(w, h, "IPL_DEPTH_8U", 1)
    bin = cvCreateImage(w, h, "IPL_DEPTH_8U", 1)

    #// カメラから画像をキャプチャする
    while (1) {
	frame = cvQueryFrame(capture)
	cvCvtColor(frame, gray, "RGB2GRAY")
#    print gray
#    acvGetImgHead(gray, img_hd)
#    print img_hd["depth"]
#    print img_hd["nChannels"]
	switch (conv) {
	case "b":
	    cvThreshold(gray, bin, "OTSU", 255, "BINARY")
	    show = bin
	    break
	case "t":
	    cvThreshold(gray, bin, "OTSU", 255, "TRUNC")
	    show = bin
	    break
	case "z":
	    cvThreshold(gray, bin, "OTSU", 255, "TOZERO")
	    show = bin
	    break
	case "g":
	    show = gray
	    break
	default:
	    show = frame
	    break
	}
	#print show
	if (circle)
	    cvCircle(show, cx, cy, 80, "#ff0000", 3, "AA", 0)

	# 二値化モード時は、顔認識できない。
	if (face_detect && show == frame) {
	    num = acvDetectObjects(show, cascade_name, 1.35, 2, "DO_CANNY_PRUNING",
		    max(40, w * 0.2),
		    max(40, h * 0.2),
		    w * 0.30, h * 0.30, faces)

	    for (j = 0; j < num; j++) {
		#center_x = round(faces[j, "x"] + faces[j, "width"] * 0.5)
		#center_y = round(faces[j, "y"] + faces[j, "height"] * 0.5)
		#radius = round((faces[j, "width"] + faces[j, "height"]) * 0.25)
		#cvCircle(show, center_x, center_y, radius, "#00ff00", 2, 8, 0)
		cvRectangle(show, faces[j, "x"], faces[j, "y"], faces[j, "x"] + faces[j, "width"], faces[j, "y"] + faces[j, "height"], "#ff0000", 2, 8, 0)
			#"#ff00ff", 2, 8, 0)
	    }
	}

	cvShowImage("Capture", show)
	cvWriteFrame(vw, image)
	c = cvWaitKey(2)
	if (c == 0x1b) {
	    break
	} else if (c == ascii("q")) {
	    break
	} else if ( c == ascii("g") || c == ascii("b") || c == ascii("t") || c == ascii("z") || c == ascii("c")) {
	    conv = substr(char(c), 1, 1)
	} else if (c == ascii("\n")) {
	    cvSaveImage("_cam_on_awk_"rand()".jpeg", show, 0);
	    cvNamedWindow("")
	    cvShowImage("", show);
	} else if (c == ascii("\t")) {
	    cvSaveImage("_cam_on_awk_.jpeg", frame, 0);
	} else if (c == ascii(" ")) {
	    face_detect = !face_detect
	}
    }

    cvReleaseCapture(capture)
    cvReleaseVideoWriter(vw)
    cvDestroyWindow("Capture")
    cvReleaseImage(bin)
}


function onmouse(event, x, y, flaggs, paam)
{
    if (event == "LBUTTONDOWN") {
	cx = x; cy = y
	circle = 1
    } else if (event == "RBUTTONDOWN") {
	circle = 0
    }
    return
}


function max(a, b) { return (a > b) ? a : b }
