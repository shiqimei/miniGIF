# Environment Headers

# The MIT License (MIT)

# Copyright (c) 2019 lolimay <lolimay@lolimay.cn>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# A POSIX variable
OPTIND=1  # Reset in case getopts has been used previously in the shell.

# Global Variables
version="1.0.0"
output_file=""
verbose=0

while getopts "h?vf:" opt; do
    case "$opt" in
    h|\?)
        base64 -d <<<"H4sICAFTTVwCA2xvZ28udHh0AJ1QSxaEIAzbc4rsnFmIB0JfPUgPb9oCA6Mrq/0kkPgqMIc8Y/Ho
U2dsTH+Sj3wfcF7gt5Wv67V25xI/lNc1W6KyqFzHm5kAO6UwkTe4j3Gp4My8bsmjgqjnhEPVlvl5
IEyTU+3BUAe805MGR9NN+9Cj8FA18kCRVkccFiK2kfqkveP+T9/EBVHWMdHbAQAA" | gunzip
        localize '\n\t\t\t\b\b\b一款强大的GIF图像压缩工具' '\n\t\t\t\b\b\bA Powerful GIF Image Compressor'
        localize '\t\t\t\b\b\b\blolimay <lolimay@lolimay.cn>' '\t\t\t\blolimay\b <lolimay@lolimay.cn>'
        localize '\t\t\t\t\b\b\b\b\b版本: 1.0.0\n' '\t\t\t\t\b\b\bVersion: 1.0.0\n'
        exit 0
        ;;
    esac
done