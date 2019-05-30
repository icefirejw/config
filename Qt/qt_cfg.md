# Qt Compile inlude directory

qt is keg-only, which means it was not symlinked into /usr/local,
because Qt 5 has CMake issues when linked.

If you need to have qt first in your PATH run:
  echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.zshrc

For compilers to find qt you may need to set:
  export LDFLAGS="-L/usr/local/opt/qt/lib"
  export CPPFLAGS="-I/usr/local/opt/qt/include"

# Error 1: No valid kits found.
## 原因:
qtcreator 无法选择Qt版本导致，此时我们需要添加qt版本。
## 解决方法：
打开qtcreator的偏好设置-Kits-QT versions，点击添加，找到/usr/local/opt/qt/bin/qmake文件，添加进去，然后在构建套件的QT 版本选项选择添加的版本即可。

# Error 2: Project ERROR: failed to parse default search paths from compiler output.
## 原因：
编译器设置问题。
## 解决方法：
打开qtcreator的偏好设置-Kits，在构建套件(kit)选项栏，选中桌面，将编译器由gcc修改编译器为Clang。



