#!/usr/bin/env python3

import json
import requests
import os
import re
import sys
import argparse
import pystache
import string
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

is_protocol = False
filename = sys.argv[1]

if len(sys.argv) > 2:
  filename = sys.argv[2]
  if sys.argv[1] == "-p":
    is_protocol = True

def getJsonFile(file):   

  r = requests.get('https://raw.githubusercontent.com/SeraphinD/bbl-swift-lille-token/master/' + file, headers=headers, verify=False)

  if r.ok:
    return json.loads(r.content.decode('utf-8'))
  else:
    print("Unable to download token:" + file)
    r.raise_for_status()

def renderColors(json):
  file = open(filename, "a")
  if is_protocol:
    file.write("import Foundation" + "\n\n" + "public protocol MyColorProtocol {" + "\n")
    for item in json:
      item["name"] = item["name"].replace("-", "_")
      template = u'''
      func {{name}}(tint: Int) -> UIColor?
      '''
      rendering = pystache.render(template, item)
      file.write(rendering)
    file.write("\n" + "}")
    return

  file.write("import MyUIKit" + "\n\n" + "final class MyColors: MyColorProtocol {" + "\n")
  for item in json:
    item["name"] = item["name"].replace("-", "_")
    template = u'''
    func {{name}}(tint: Int) -> UIColor? {
      switch tint {
      {{#values}}
      case {{tint}}: return UIColor(rgba: "{{color}}")
      {{/values}}
      default: return nil
      }
    }
    '''
    rendering = pystache.render(template, item)
    file.write(rendering)
  file.write("\n" + "}")

  file.close()

def renderTextStyles(json):
  file = open(filename, "a")

  if is_protocol:
    file.write("\n\npublic protocol MyTextStyleProtocol {\n")
    file.write("\n\n\t  var fonts: [String] { get }\n")
    for item in json:
      for color in item["colors"]:
        for textstyle in item["textstyles"]:
          textstyle["name"] = textstyle["name"].replace("-", "_")
          textstyle["color_name"] = color["name"].replace("-", "_")
          textstyle["color_tint"] = color["tint"]
          template = u'''
      var {{name}}_{{color_name}}_{{color_tint}}: MyTextStyle { get }
          '''
          rendering = pystache.render(template, textstyle)
          file.write(rendering)
    file.write("\n" + "}")
    return

  file.write("\n\n" + "final class ARITextStyle: MyTextStyleProtocol {" + "\n")
  fonts = []
  for item in json:
    for textstyle in item["textstyles"]:
      textstyle["fontSize"] = textstyle["fontSize"]["px"]
      textstyle["lineHeight"] = textstyle["lineHeight"]["px"]
      textstyle["name"] = textstyle["name"].replace("-", "_")

      safeFontFamily = []
      count = 0
      for fontWord in textstyle["fontFamily"].title().split():
        count +=1
        safeFontFamily.append(fontWord)
        if count+1 == len(textstyle["fontFamily"].title().split()):
          safeFontFamily.append("-")
        textstyle["safe_font_name"] = "".join(safeFontFamily)
    for color in item["colors"]:
      for textstyle in item["textstyles"]:
        textstyle["color_name"] = color["name"].replace("-", "_")
        textstyle["color_tint"] = color["tint"]
        fonts.append(textstyle["safe_font_name"])
        template = u'''
    var {{name}}_{{color_name}}_{{color_tint}}: MyTextStyle {
      return MyTextStyle(color: colors.{{color_name}}(tint: {{color_tint}}),
                       fontFamily: "{{safe_font_name}}", 
                       fontSize: {{fontSize}}, 
                       shouldApplyWeight: {{shouldApplyWeight}}, 
                       fontWeight: {{fontWeight}}, 
                       lineHeight: {{lineHeight}}, 
                       letterSpacing: "{{letterSpacing}}", 
                       textTransform: "{{textTransform}}")
      }
      '''
        rendering = pystache.render(template, textstyle).replace("True", "true").replace("False", "false")
        file.write(rendering)
  fonts = list( dict.fromkeys(fonts)) # remove duplicates
  strFonts = str(fonts).replace("'", "\"")
  file.write("\n\t  var fonts: [String] { return %s }\n"%(strFonts))
  file.write("\n}")
  file.close()

def getTokens():
  with open(filename, 'w'): pass
  colors = getJsonFile('color-token-1.json')
  renderColors(colors)
  #textstyles = getJsonFile('textstyles-token.json')
  #renderTextStyles(textstyles)

getTokens()

