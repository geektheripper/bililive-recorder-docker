# BiliBili Stream Recorder Docker

https://github.com/Bililive/BililiveRecorder

**WIP: BililiveRecorder server is not stable yet, please do not use it for production.**

`docker run -it --rm -v /path/to/config.json:/config/config.json -v /path/to/store:/store geektr/bililive-recorder:alpha`

portable mode:

`docker run -it --rm -v /path/to/config.json:/config/config.json -v /path/to/store:/store geektr/bililive-recorder:alpha BililiveRecorder.Cli portable -f '{roomid}/{date}-{time}.flv' "/store" 17151 14846654 --help`
