#
# Palindrome detector
#

from flask import Flask
import logging
import json

#constants
#jasonIndent = 2

app = Flask(__name__)

@app.route('/palindrome/<word>', methods = ['GET'])
def palindrome(word):
  logging.info("Word received: [" + str(word) + "]")
  output = buildJSON(word)
  logging.info("JSON obtained: {" + output + "}")

  return output

def buildJSON(word):

  if word == word[::-1]:
    # Dictionary for characters count
    ch_count = {}

    # Loop for characters count
    for char in word:
      if char in ch_count:
        ch_count[char] += 1
      else:
        ch_count[char] = 1

    # Dictionary for sorting characters
    ch_count = dict(sorted(ch_count.items()))

    # Boolean test
    isPalindrome = True

    # Dictionary for .json output
    output = {
      "name": word,
      "palindrome": isPalindrome,
      "sorted": ch_count,
      "length": len(word)
      }
  else:
    # Boolean test
    isPalindrome = False

    # Dictionary for .json output
    output = {
      "name": word,
      "palindrome": isPalindrome,
      }

  return json.dumps(output, indent=2)

if __name__ == '__main__':
    app.run(host='localhost', port=81, debug = True)