# Deepin-QQ-AppImage
运行脚本make-deepin-qq-appimage.sh，可以直接制作一个Deepin-QQ的AppImage。

要成功运行生成Deepin-QQ.AppImage，需要系统已经安装好32位的支持。

此外：由于ubuntu支持unprivileged_userns_clone，所以该AppImage可以通过unsahre在ubuntu没有性能损失地运行。
而如Debian和Arch默认关闭unprivileged_userns_clone，本AppImage将使用proot代替unsahre，会有性能损失。
当然，你也可以手动开启unprivileged_userns_clone，通过命令sudo sysctl kernel.unprivileged_userns_clone=1。


最后，制作过程中的文件全部来源于deepin的源，再加上一些运行脚本和proot程序。proot是由https://github.com/proot-me/PRoot/ 中编译而来的，其中proot-130表示打上 https://github.com/proot-me/PRoot/pull/130 的补丁后编译而成的，proot-115表示打上 https://github.com/proot-me/PRoot/pull/115 的补丁后编译而成的。默认选用更新补丁的proot-130。
