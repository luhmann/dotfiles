function mvredisset
    pbpaste | redis-cli -x -h mydevbox set content:v1:de:de:live:$argv
end