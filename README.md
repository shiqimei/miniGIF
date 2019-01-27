
````bash
                                          _               _      ______    _____   ________  
                                         (_)             (_)   .' ___  |  |_   _| |_   __  | 
                           _ .--..--.    __    _ .--.    __   / .'   \_|    | |     | |_ \_| 
                          [ `.-. .-. |  [  |  [ `.-. |  [  |  | |   ____    | |     |  _|    
                           | | | | | |   | |   | | | |   | |  \ `.___]  |  _| |_   _| |_     
                          [___||__||__] [___] [___||__] [___]  `._____.'  |_____| |_____|    
````
**<p align="center">English | <a href="./docs/README_CN.md">中文</a></p>**

# Introduction
[miniGIF](https://github.com/lolimay/miniGIF) is a powerful unix gif compressor with user friendly cli interface. No extra complex functions, focusing on making your gif image become smaller and easier to share with others. Any [issues](https://github.com/lolimay/miniGIF/issues/new) is welcomed!
<p align="center"><img height="235" src="./docs/images/preview.gif"></p>

# Installation

Go to [release](https://github.com/lolimay/miniGIF/releases) page and download the latest version(not source code). And you can run below commands to move `miniGIF` to the user bin directory:
````
sudo chmod +x miniGIF # add executable permission
sudo cp miniGIF /usr/bin
````

And now you can use `miniGIF` in any path.

# Usase
If not installed, you can use `miniGIF` as following command:
````bash
sudo chmod +x miniGIF # add executable permission
./miniGIF *.gif # *.gif is the gif filename you want to compress
````
If it was installed to the user bin directory, you can simply run `miniGIF` like this:
````bash
miniGIF *.gif
````
# Known BUGs
- Do not support gif filename with space. (Please rename first)

# Acknowledgements
`miniGIF` is a wrapper for `gifsicle` and `imagemagick`, thanks to theses two famous projects.

| Project | License |
| :-: | :-: |
| [gifsicle](https://github.com/kohler/gifsicle) | GPLv2 |
| [imagemagick](https://github.com/ImageMagick/ImageMagick) | [Own License](https://imagemagick.org/script/license.php) |
