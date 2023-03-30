#!/bin/sh
CPP_DIR=../server/src/base/pb/protocol
DST_DIR=./gen

#C++
cp $DST_DIR/cpp/* $CPP_DIR/


#android
ANDROID_DIR=../android/app/src/main/java/com/mogujie/tt/protobuf
cp -f  $DST_DIR/java/com/mogujie/tt/protobuf/* $ANDROID_DIR/

#ios 暂时取消拷贝到IOS
#IOS_DIR=../ios/TeamTalk/Exist/GPB/objcpb
#cp -f $DST_DIR/objc/* $IOS_DIR/


#同时删除生成目录
rm -rf ./gen
