#!/usr/bin/python3
import sys

args = sys.argv
args = args[1:]
for arg in args:
#    print(arg)
    url = "https://www.youtube.com/watch?v=rPp3EfbxmC0"
    url = arg
#    print(url)
    url = url.replace("https://www.",'')
    url = url.replace("http://www.",'')
    url = url.replace("https://",'')
    url = url.replace("http://",'')
    url = url.replace("www.",'')
    url = url.replace(".com",'')
    url = url.replace("watch?v=",'')
    url = url.replace("/video/",'/')
    url = url.replace("?playlist=",'/')
    url = url.replace("//",'/')
    parts = url.split("/")
#    print(url)
    line = "{} {}\n".format(parts[0], parts[1])
#    print(line)

    files = [
            "/home/pi/.temp/Commute/downloadedCommute.txt",
            "/home/pi/.temp/Commute/downloadedShows.txt",
            ]

    for file in files:
        with open(file, "a") as txtfile:
            txtfile.write(line)  
