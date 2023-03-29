#编译说明
10.2 解压编译pb
tar -zxvf protobuf-2.6.1.tar.gz
cd protobuf-2.6.1
./configure --prefix=/usr/local/protobuf
make -j 2 && make install
cd ..

11 下载TeamTalk代码
git clone https://github.com/mogujie/TeamTalk.git

12 生成pb文件
12.1 拷贝pb相关文件
拷贝pb的库、头文件到TeamTalk相关目录中:
mkdir -p /root/TeamTalk/server/src/base/pb/lib/linux/
cp /usr/local/protobuf/lib/libprotobuf-lite.a /root/TeamTalk/server/src/base/pb/lib/linux/
cp  -r /usr/local/protobuf/include/* /root/TeamTalk/server/src/base/pb/


mkdir -p /home/ggghub/TeamTalk/server/src/base/pb/lib/linux/
cp /usr/local/protobuf/lib/libprotobuf-lite.a /home/ggghub/TeamTalk/server/src/base/pb/lib/linux/
cp  -r /usr/local/protobuf/include/* /home/ggghub/TeamTalk/server/src/base/pb/

12.2 生成pb协议
cd /root/TeamTalk/pb

执行:

export PATH=$PATH:/usr/local/protobuf/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/protobuf/lib
sh create.sh

生成协议相关源码文件。

再执行:
sh sync.sh

将相关文件拷贝到server 目录下。

[root@cbig teamtalklibs]# cd ../TeamTalk/p
-bash: cd: ../TeamTalk/p: No such file or directory
[root@cbig teamtalklibs]# cd ../TeamTalk/pb/
[root@cbig pb]# sh create.sh
create.sh: line 7: protoc: command not found
create.sh: line 11: protoc: command not found
create.sh: line 15: protoc: command not found
[root@cbig pb]# mkdir -p /home/ggghub/TeamTalk/server/src/base/pb/lib/linux/
[root@cbig pb]# cp /usr/local/protobuf/lib/libprotobuf-lite.a /home/ggghub/TeamTalk/server/src/base/pb/lib/linux/
[root@cbig pb]# cp  -r /usr/local/protobuf/include/* /home/ggghub/TeamTalk/server/src/base/pb/
[root@cbig pb]# export PATH=$PATH:/usr/local/protobuf/bin
[root@cbig pb]# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/protobuf/lib
[root@cbig pb]# sh create.sh
[root@cbig pb]# sh sync.sh
[root@cbig pb]# git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   ../server/src/base/pb/protocol/IM.BaseDefine.pb.cc
        modified:   ../server/src/base/pb/protocol/IM.BaseDefine.pb.h
        modified:   ../server/src/base/pb/protocol/IM.Login.pb.cc
        modified:   ../server/src/base/pb/protocol/IM.Login.pb.h

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        ../server/src/base/pb/google/
        ../server/src/base/pb/lib/

no changes added to commit (use "git add" and/or "git commit -a")
[root@cbig pb]#
执行命令完了之后 发生的变化