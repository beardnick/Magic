import xml.etree.ElementTree as ET
import argparse
from bokeh.core.properties import value
from bokeh.resources import Resources
import os
import sys
from bokeh.plotting import figure
from bokeh.io import save, output_file
from bokeh.io.state import State
from bokeh.embed import components
from bokeh.layouts import gridplot
import numpy as np
import pandas as pd
import pymysql as mysql
import math


color_dict = {"CW": "#FF0000", "ED": "#87CEEB", "EL": "#6B8E23", "ELW": "#71C671", "KNPR": "#EEEE00", "KWPE": "#7A7A7A", "LBT": "#218868", "PH": "#FFFF00", "LNAE": "#FF4500",
        "DTA":"#6A5ACD","DTS":"#FF3030","DTT":"#9400D3","EH":"#F08080","ELL":"#7FFF00","ERN":"#B03060","EW":"#00FF7F","LNBE":"#FF6EB4","TBN":"#191970","TL":"#228B22"
         ,"KNPE":"#737373",
              }

# 加新的参数只需要改这里和sql语句
column_dict = {
    'chr':1,
    'pos':2,
    'trait':3,
    'snp':4,
    'p':5,
    'annotation':6
}

my_dict = {'x':[],
           'y':[],
           'color':[]}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='draw graph')
    parser.add_argument('start', type=int, help='the start of the region')
    parser.add_argument('end', type=int, help='the end of the region')
    # parser.add_argument('path', type=str, help='the output path of the html file')
    args = parser.parse_args()
    start = str(args.start)
    end = str(args.end)
    # path = str(args.path)
    # print(path)
    db = mysql.connect("localhost", "root", "", "magic")
    cursor = db.cursor()
    # cursor.execute("select * from magic_all_sig_snp where pos BETWEEN "
    #                + start + " and " + end)
    # cursor.execute("select * from magic_all_sig_snp , sig_snp_annotation "
    #               + "where magic_all_sig_snp.id = ")
    cursor.execute("select magic_all_sig_snp.* , sig_snp_annotation.annotation " +
    " from magic_all_sig_snp , sig_snp_annotation " +
    " where magic_all_sig_snp.id = sig_snp_annotation.id " +
     " and pos between " + start + " and " + end
    )
    data = cursor.fetchall()
    start = int(start)
    end = int(end)
    print(len(data))
    lenth = len(data)
    minp = 10000;
    maxp = -10000;
    # fromkey会使所有的key都指向一个值
    for k in column_dict.keys():
        my_dict.update({k:[]})
    print(my_dict)
    for i in range(lenth):
        my_dict['x'].append(int(data[i][column_dict['pos']]))
        try:
            tmp = - math.log10(float(data[i][column_dict['p']]))
        except Exception as e:
            print("p value is " , float(data[i][column_dict['p']]))
        my_dict['y'].append(tmp)
        my_dict['color'].append(color_dict[data[i][column_dict['trait']]])
        if tmp > maxp:
            maxp = tmp
        if tmp < minp:
            minp = tmp
        for k in column_dict.keys():
            if k == 'chr':
                my_dict[k].append('chr' + str(data[i][column_dict[k]]))
            else:
                my_dict[k].append(data[i][column_dict[k]])

    tooltips = []
    for k in column_dict.keys():
        tooltips.append((k, '@' + k))

    radius = (end - start ) / 400
    vertical = (maxp - minp) / 200
    TOOLS = "crosshair, pan, wheel_zoom, box_zoom, reset, box_select, lasso_select, hover"
    p = figure(tools=TOOLS, x_range=(start - radius * 5, end + radius * 5), y_range=(minp - vertical * 5, maxp + vertical * 5),tooltips=tooltips,plot_width=1500,plot_height=600)
    p.circle(x='x', y='y', fill_color='color',line_color='color', source=my_dict,radius=radius)
    # print(save(gridplot((p,), plot_width=1400,plot_height=600), resources=output_file("chrome.html" , "chrome", mode="relative", root_dir=path)))
    output_file("chrome.html" , "chrome")
    save_path = save(gridplot((p,), plot_width=1400,plot_height=600))
    print(save_path)
    # html = open(save_path)
    # print(path + "chrome.html")
    # f = open(path + "chrome.html", 'w')
    # print(html.read())
    # line = html.readline()
    # while len(line) > 0:
    #     f.write(f)
    #     line = html.readline()
    #
    # f.write(html.read())
    # f.close()
    # html.close()
