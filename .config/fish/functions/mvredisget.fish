function mvredisget
redis-cli -h mydevbox --raw get content:v1:de:de:live:$argv
end