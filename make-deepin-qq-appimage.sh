#!/bin/bash

# Prepare the AppDir Data 
mkdir -p output
cd output
mkdir AppDir
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin.com.qq.im/deepin.com.qq.im_8.9.19983deepin20_i386.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-fonts-wine_2.18-5_all.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-libwine_2.18-5_i386.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32-preloader_2.18-5_i386.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine32_2.18-5_i386.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine/deepin-wine_2.18-5_all.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-helper/deepin-wine-helper_1.0deepin32_i386.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/d/deepin-wine-uninstaller/deepin-wine-uninstaller_0.1deepin2_i386.deb
wget -c http://packages.deepin.com/deepin/pool/non-free/u/udis86/udis86_1.72-2_i386.deb
wget -c http://mirrors.edge.kernel.org/ubuntu/pool/universe/u/unionfs-fuse/unionfs-fuse_1.0-1ubuntu2_amd64.deb
ls *.deb | awk -va="AppDir" '{print $1,a}' | xargs -n2 dpkg-deb -x
mkdir -p AppDir/Deepin-QQ 
7z x AppDir/opt/deepinwine/apps/Deepin-QQ/files.7z -oAppDir/Deepin-QQ/
mkdir -p AppDir/Temp
rm AppDir/opt/deepinwine/apps/Deepin-QQ/files.7z

# Add some run script to Appdir
wget -c -P AppDir/ https://github.com/linweilian03/Deepin-QQ-AppImage/releases/download/v1.0/AppRun 
wget -c -P AppDir/ https://github.com/linweilian03/Deepin-QQ-AppImage/releases/download/v1.0/deepinqq.desktop 
wget -c -P AppDir/ https://github.com/linweilian03/Deepin-QQ-AppImage/releases/download/v1.0/proot-130 
wget -c -P AppDir/ https://github.com/linweilian03/Deepin-QQ-AppImage/releases/download/v1.0/runqq
wget -c -P AppDir/ https://github.com/linweilian03/Deepin-QQ-AppImage/releases/download/v1.0/QQ.png 
wget -c -P AppDir/ https://github.com/linweilian03/Deepin-QQ-AppImage/releases/download/v1.0/runqq-proot 

chmod +x AppDir/AppRun AppDir/proot-130 AppDir/runqq AppDir/runqq-proot




# Use Appimagetool to produce the appimage
wget -c "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod +x appimagetool-x86_64.AppImage
ARCH=x86_64 ./appimagetool-x86_64.AppImage AppDir/ 
