# Windows Environment Setting

用于保存windows环境变量

## System PATH

D:\Programs\Python3\Scripts\
D:\Programs\Python3\
D:\Programs\Git\cmd\
D:\Programs\nodejs\
D:\Programs\WinSCP\
D:\Programs\WinSCP\PuTTY\
D:\Programs\MinGW\bin

# Scripts


# CodeBlocks Configuration

将%appdata%\CodeBlock目录中的default.conf文件替换

# Git Configuration

## CA error

1. 方法一：指定证书正确的位置

~~~shell
git config --system http.sslcainfo "D:\Program\Git\mingw64\ssl\certs\ca-bundle.crt"
~~~
2. 方法二：取消证书认证
~~~shell
git config --system http.sslverify false
~~~

