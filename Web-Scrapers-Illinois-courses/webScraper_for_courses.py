# -*- encoding: utf-8 -*-
# this code is to extract the Course information from website of courses of UIUC
# using Python 3
# initiated from INFO490 courses
# 03/09/2017
#
#
'''
Given a department name and Year, will print and save the courses information
scaped from UI website.
'''
import re
import json
from lxml import html
from bs4 import BeautifulSoup
import requests
import numpy as np

# first define some functions
def parse_xml(json_text,key_str):
    '''
    This funcion helps to parse a json string to find values we need
    '''
    html_txt = html.fromstring(json_text[key_str])
    value    = html_txt.xpath('//div/text()')
    if value:
        return value[0]
    else:
        return 'NaN'

# end def

# get the information of website
def getSectionInfo(url):
    '''
    this function finds the detailed course information, output to files and
    print on screen.
    '''
    my_html = requests.get(url).content
    my_soup = BeautifulSoup(my_html,'lxml')
    script_tag = my_soup.find(type='text/javascript')
    script_txt = script_tag.contents[0]
    print ('{0:8s}{1:6s}{2:25s}{3:20s}{4}'.format('section','days','time', \
    'instructor','location'))
    for match in re.finditer(pattern,script_txt):
        data = match.group(0)
        json_text = json.loads(data)

        sec  = parse_xml(json_text,'section')
        days = parse_xml(json_text,'day')
        time = parse_xml(json_text,'time')
        inst = parse_xml(json_text,'instructor')
        loca = parse_xml(json_text,'location')
        print ('{0:8s}{1:6s}{2:25s}{3:20s}{4}'.format(sec,days,time,inst,loca))
        with open('{0}_{1}.txt'.format(department,year),'a') as fin:
            fin.write('{0:8s}{1:6s}{2:25s}{3:20s}{4}' \
            .format(sec,days,time,inst,loca)+'\n')
# end def

# the main function
if __name__ == '__main__':
    print("Input a UIUC Department Shortname from 'CS','MSE','NPRE', \
    'ESL','AE','ECE','INFO','STAT':")
    department  = input()
    departments = set(['CS','MSE','NPRE','ESL','AE','ECE','INFO','STAT'])
    depart = True
    while depart:
        if department not in departments:
            print('Wrong input, please input a correct department name again:')
            department  = input()
        else:
            depart = False
    #end while

    print("Input a year (2005-2016):")
    year  = input()
    years = str(list(range(2005,2017))) #range(2000,2017)
    ye = True
    while ye:
        if year not in years:
            print('Wrong input, please input a correct year again:')
            year  = input()
        else:
            ye = False
    #end while


    pattern = re.compile(r'(\{[^}]+\})')
    my_url = 'https://courses.illinois.edu/schedule/{0}/spring/{1}' \
    .format(year,department)
    html_1 = requests.get(my_url).content
    soup_1 = BeautifulSoup(html_1,'lxml')
    tb = soup_1.find(id='default-dt').tbody  # the tables of all courses
    for row in tb.find_all('tr'):  # iterate all the rows of tables
        t_idx  = [val for val in row.find_all('td')]
        cour_ID = t_idx[0].contents[0].strip()
        cour_url = 'https://courses.illinois.edu/{0}'.format(t_idx[1].a['href'])
        cour_nam = t_idx[1].a.contents[0].strip()
        print(100*'-')
        print('Course ID: {0} & Course Name: {1}'.format(cour_ID,cour_nam))
        print(100*'-')
        with open('{0}_{1}.txt'.format(department,year),'a') as fin:
            fin.write(100*'-'+'\n')
            fin.write('Course ID: {0} & Course Name: {1}' \
            .format(cour_ID,cour_nam)+'\n')
            fin.write(100*'-'+'\n')
        getSectionInfo(cour_url)

    #end for

#end of the code
