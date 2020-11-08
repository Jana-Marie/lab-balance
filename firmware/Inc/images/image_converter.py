#!/bin/python3.8
from PIL import Image
import sys
import os

def rgb_hex565(red, green, blue):
    return ("0x%0.4X" % ((int(blue / 255 * 31) << 11) | (int(red / 255 * 63) << 5) | (int(green / 255 * 31))))

def generate_header(file):
    nm = os.path.splitext(file)[0]
    of = open(nm+".h","w+")
    hf = open('image_header.h', 'a+')
    hf.write("#include \"" + nm + ".h\"\r\n")
    hf.close()
    im = Image.open(file, 'r')
    width, height = im.size
    pixel_values = list(im.transpose(Image.ROTATE_180).getdata())

    of.write("#ifndef __{}_H\r\n".format(nm.upper()))
    of.write("#define __{}_H\r\n".format(nm.upper()))
    of.write("\r\n")
    of.write("const uint16_t {}[] = {{\r\n".format(nm.lower()))
    for index,i in enumerate(pixel_values):
        of.write("{}".format(rgb_hex565(*i[:3])))
        if(index < len(pixel_values)-1):
            of.write(",")
        if((index+1) % 10 == 0):
            of.write("\r\n")
    of.write("};\r\n")
    of.write("\r\n")
    of.write("#endif\r\n")
    of.close()

hf = open('image_header.h', 'w+')
hf.write("#ifndef __IMAGE_HEADERS_H\r\n")
hf.write("#define __IMAGE_HEADERS_H\r\n")
hf.write("\r\n")
hf.close()

for file in os.listdir(sys.argv[1]):
    if file.endswith(".png"):
        print(os.path.join(sys.argv[1], file))
        generate_header(file)

hf = open('image_header.h', 'a+')
hf.write("\r\n")
hf.write("#endif")
hf.close()
