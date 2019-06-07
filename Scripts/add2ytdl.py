#!/usr/bin/python3
import sys

def parseURL(url):
    #https://youtu.be/5AH98p5b7to
    url = url.replace("&feature=youtu.be",'')
    url = url.replace("https://www.youtube.com/watch?v=",'youtube/')
    url = url.replace("https://youtu.be",'youtube')
    url = url.replace("http://youtu.be",'youtube')
    url = url.replace("youtu.be",'youtube')
    url = url.replace("https://www.",'')
    url = url.replace("http://www.",'')
    url = url.replace("https://",'')
    url = url.replace("http://",'')
    url = url.replace("www.",'')
    url = url.replace(".com",'')
    url = url.replace("watch?v=",'')
    url = url.replace("/video/",'/')
    url = url.replace("?playlist=",'/')
    url = url.replace("///",'/')
    url = url.replace("//",'/')
    url = url.replace("/",'|')
    parts = url.split("|")
#    print(url)
    url_line = "{} {}\n".format(parts[0], parts[1])
    return url_line

args = sys.argv
args = args[1:]
for arg in args:
#    print(arg)
    #url_line = parseURL(arg)
    if not arg:
        url_line = "|"
    else:    
        url_line = parseURL(arg)
#    print(url_line)
#    print(line)

    files = [
            "/home/pi/.temp/Commute/downloadedCommute.txt",
#            "/home/pi/.temp/Commute/downloadedShows.txt",
            ]

    for file in files:
        lines_seen = set() # holds lines already seen 
        readFile = open(file, "r")
        for line in readFile:     
            if line not in lines_seen: # not a duplicate         
                lines_seen.add(line)
        readFile.close()
        outfile = open(file, "a") 
        #outfile.writelines(lines_seen)
        if url_line not in lines_seen:
            outfile.write(url_line) 
        outfile.close()
        #with open(file, "a") as txtfile:
        #   txtfile.write(line) 
    
        dc = "/home/pi/Commute/Commute.txt"
        dcLines = []
        dcRead = open(dc, "r")
        for dcLine in dcRead:
            dcLineTest = dcLine.replace("\n", "")
            dcURL = parseURL(dcLineTest)
            #print(dcURL)
            if dcURL not in lines_seen:
                dcLines.append(dcLine)
        #print(dcLines)
        dcRead.close()
        dcWrite = open(dc, "w") 
        for dcl in dcLines:
            dcWrite.write(dcl)
        dcWrite.close()
