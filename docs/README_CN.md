````bash
                                          _               _      ______    _____   ________  
                                         (_)             (_)   .' ___  |  |_   _| |_   __  | 
                           _ .--..--.    __    _ .--.    __   / .'   \_|    | |     | |_ \_| 
                          [ `.-. .-. |  [  |  [ `.-. |  [  |  | |   ____    | |     |  _|    
                           | | | | | |   | |   | | | |   | |  \ `.___]  |  _| |_   _| |_     
                          [___||__||__] [___] [___||__] [___]  `._____.'  |_____| |_____|    
````
**<p align="center"><a href="https://github.com/lolimay/miniGIF"> English </a> | 中文</p>**

# 介绍
[miniGIF](https://github.com/lolimay/miniGIF)是一款功能强大的 gif 压缩工具，具有友好的 cli 界面。 没有额外的复杂功能，专注于使您的 gif 图像变得更小、更容易与他人分享。

# 安装

切换到 [release](https://github.com/lolimay/miniGIF/releases) 页下载最新版本的 `miniGIF`(不是源代码).接着你可以通过下面的命令将 `miniGIF` 安装到你的用户 bin 目录:
````
sudo cp miniGIF /usr/bin # 安装 miniGIF
````

现在你可以在任何路径下使用 `miniGIF`。

# 用法
如果没有安装 `miniGIF`,你可以通过下面的方式使用 `miniGIF`:
````bash
# 需要确保先切换到包含 miniGIF 文件的路径下
./miniGIF *.gif # *.gif 是你需要压缩的 gif 文件名
````
如果已经通过上面的方式安装了 `miniGIF`，你可以简单地通过下面的方式使用它:
````bash
miniGIF *.gif
````
# 已知的BUG
- 暂不支持文件名中含有空格的 gif (请先修改成不包含空格的文件名)

# 鸣谢
`miniGIF` 是对 `gifsicle` 和 `imagemagick` 的封装，感谢这两个著名的项目。

| 项目名 | 协议 |
| :-: | :-: |
| [gifsicle](https://github.com/kohler/gifsicle) | GPLv2 |
| [imagemagick](https://github.com/ImageMagick/ImageMagick) | [自有协议](https://imagemagick.org/script/license.php) |
