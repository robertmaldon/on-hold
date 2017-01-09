on-hold
=======

An experiment using the ffmpeg command line tool to create a "zoom+pan" video from a series of still images plus a soundtrack.

# Why?

Sure, there are plenty of graphical video editing tools around, but using the command line is more fun :)

# Would you recommend using ffmpeg to edit videos?

In most cases no. The doco on ffmpeg filters is not great. Figuring out the order of command line options is a lot of trial and error. Trying to use more than one filter at a time is painful. But it's fun :)

# How do I create a video?

1. Put images in the 'images' folder using the naming convention 'img-XXX.jpg' where XXX is a sequential number. e.g. 001
1. Put the sound track in the 'audio' folder (the name is currently hard-coded to soundtrack.mp3)
1. Install [ffmpeg](https://ffmpeg.org/). If you are using a mac you can install by doing a:
   ```
   brew install ffmpeg
   ```
1. Run the BASH shell script:
   ```
   ./slideshow.sh
   ```

The shell script will create a temporary folder named 'tmp' to do its work. The final video will be created as 'tmp/on-hold.mp4'.

If you're curious to how it all works take a look at [slideshow.sh](slideshow.sh) source.

Check out the [on-hold.mp4](on-hold.mp4) sample video.

# Credits

* [ffmpeg](https://ffmpeg.org/)
* Awesome on hold jazz music by [Hadouk](https://www.youtube.com/watch?v=d9crjCKsbuI)
* Awesome late excuses from the [Sorry I'm Late 2](https://www.youtube.com/watch?v=GtSiLjnULb8) prankster video

# License

The MIT License (MIT)

Copyright (c) 2017 Robert Maldon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
