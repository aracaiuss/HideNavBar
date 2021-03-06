##########################################################################################
# Custom Logic
##########################################################################################


ui_print "   ----- Fullscreen/Immersive Gestures ------"
ui_print " "
ui_print "   Choose your gestures Mod   "
ui_print " "
ui_print "   Vol+ = Fullscreen, Vol- = Immersive"
if $VKSEL; then
     FS=true
     IM=false
     HP=false
     IMQS=false
else
	 IM=true
     FS=false
fi 

if $FS; then
    CODENAME=$(getprop ro.system.build.version.release)
    if [[ "$CODENAME" == "11" ]]; then
    mkdir -p $MODPATH/system/product/overlay
    cp -rf $MODPATH/R/* $MODPATH/system/product/overlay/
    elif [ -d /system/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/overlay
    cp -rf $MODPATH/Q/* $MODPATH/system/overlay/
    elif [ -d /system/vendor/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/vendor/overlay
    cp -rf $MODPATH/Q/* $MODPATH/system/vendor/overlay/
    else
    mkdir -p $MODPATH/system/product/overlay
    cp -rf $MODPATH/Q/* $MODPATH/system/product/overlay/
    fi
fi

if $IM; then
    CODENAME=$(getprop ro.system.build.version.release)
    if [[ "$CODENAME" == "11" ]]; then
    mkdir -p $MODPATH/system/product/overlay
    cp -rf $MODPATH/IMR/* $MODPATH/system/product/overlay/
    elif [ -d /system/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/overlay
    cp -rf $MODPATH/IMQ/* $MODPATH/system/overlay/
    elif [ -d /system/vendor/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/vendor/overlay
    cp -rf $MODPATH/IMQ/* $MODPATH/system/vendor/overlay/
    else
    mkdir -p $MODPATH/system/product/overlay
    cp -rf $MODPATH/IMQ/* $MODPATH/system/product/overlay/
    fi
fi

if $IM; then
     ui_print "   Hide pill and keep keyboard height/space?  "
     ui_print " "
     ui_print "   Vol+ = Yes , Vol- = No (default) "
     if $VKSEL; then
     HP=true
     else
     HP=false
     fi 
fi

if $HP; then
     if [ -d /system/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/overlay
    cp -rf $MODPATH/HP/* $MODPATH/system/overlay/
    elif [ -d /system/vendor/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/vendor/overlay
    cp -rf $MODPATH/HP/* $MODPATH/system/vendor/overlay/
    else
    mkdir -p $MODPATH/system/product/overlay
    cp -rf $MODPATH/HP/* $MODPATH/system/product/overlay/
    fi
fi

if $IM; then
     ui_print "   Reduce the size of the keyboard bar?  "
     ui_print " "
     ui_print "   Vol+ = Yes , Vol- = No (default) "
     if $VKSEL; then
     IMQS=true
     else
     IMQS=false
     fi 
fi

if $IMQS; then
     if [ -d /system/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/overlay
    cp -rf $MODPATH/IMQS/* $MODPATH/system/overlay/
    elif [ -d /system/vendor/overlay/NavigationBarModeGestural ]; then
    mkdir -p $MODPATH/system/vendor/overlay
    cp -rf $MODPATH/IMQS/* $MODPATH/system/vendor/overlay/
    else
    mkdir -p $MODPATH/system/product/overlay
    cp -rf $MODPATH/IMQS/* $MODPATH/system/product/overlay/
    fi
fi

rm -rf $MODPATH/R
rm -rf $MODPATH/Q
rm -rf $MODPATH/IMQ
rm -rf $MODPATH/IMR 
rm -rf $MODPATH/HP
rm -rf $MODPATH/IMQS
