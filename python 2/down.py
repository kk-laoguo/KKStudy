#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import os
#import requests
#import json
#import request
import urllib,urllib2
#from urllib.request import urlretrieve
#client_id = 'AURYI4nYVwPmBXvGtqp9pSIx'
#client_secret = '9WQtwsQSI88kNHSWAH78zBAZkQrteZ2M'
#data = 'https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id={id}&client_secret={secret}'.format(id=client_id,secret=client_secret)
#r = requests.get(url=data)
#res = json.loads(r.text)

# for i in range(0,10000):
for i in range(1,2):
    text = "支付宝收款" + str(round(float(i)/float(100),2)) + "元"
    url = "http://tsn.baidu.com/text2audio?lan=zh&ctp=1&cuid=abcdxxx&tok=24.000b0243d45280910e3ab37df926b305.2592000.1554444186.282335-15694163&tex={tex}&vol=15&per=0&spd=5&pit=5&aue=3&rate=1".format(tex=text)
    sound = "z_" + str(round(float(i)/float(100),2))
    a,b = urllib.urlretrieve(url,'./{sound}.mp3'.format(sound=sound))
    print(sound)
#    os.popen("echo y | ffmpeg -i ding.mp3 -i "+str(round(float(i)/float(100),2))+".mp3"+" -filter_complex '[0:0] [1:0] concat=n=2:v=0:a=1 [a]' -map [a] w_"+str(round(float(i)/float(100),2))+".mp3")
#    from pydub import AudioSegment
#    # 音频文件路径
#    path = './w_{sound}.mp3'.format(sound=sound)
#    # 读取音频文件，设置采样率<default=44100>
#    song = AudioSegment.from_mp3(path).set_frame_rate(22050)
#    # 按32k的bitrate导出文件到指定路径,这里是直接覆盖原文件
#    song.export(path, format='mp3', bitrate='32k')




