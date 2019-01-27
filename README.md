
````bash
                                              _               _      ______    _____   ________  
                                             (_)             (_)   .' ___  |  |_   _| |_   __  | 
                               _ .--..--.    __    _ .--.    __   / .'   \_|    | |     | |_ \_| 
                              [ `.-. .-. |  [  |  [ `.-. |  [  |  | |   ____    | |     |  _|    
                               | | | | | |   | |   | | | |   | |  \ `.___]  |  _| |_   _| |_     
                              [___||__||__] [___] [___||__] [___]  `._____.'  |_____| |_____|    
````
**English | [中文](./docs/README_CN.md)**

# Installation

Go to release page and download the latest version(not source code). And you run below commands to move `miniGIF` to user bin directory:
````
sudo cp miniGIF /usr/bin
````

And now you can use `miniGIF` in any path.

# Usase
If not installed, you can use `miniGIF` as following command:
````bash
./miniGIF *.gif # *.gif is the gif filename you want to compress
````
If it was installed to the user bin directory, you can simply run `miniGIF` like this:
````bash
miniGIF *.gif
````
# Known BUGs
- Do not support gif filename with space. (Please rename first)

# Acknowledgements
`miniGIF` is a wrapper for `gifsicle` and `imagemagick`, thanks to thses two famous projects.

| Project | License |
| :-: | :-: |
| [gifsicle](https://github.com/kohler/gifsicle) | GPLv2 |
| [imagemagick](https://github.com/ImageMagick/ImageMagick) | [Own License](https://imagemagick.org/script/license.php) |
