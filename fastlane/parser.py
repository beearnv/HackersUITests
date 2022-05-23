import os
import json

path = "../test_output/json"
testResult = []

for file in os.listdir(path):
    if file.endswith(".json"):
        with open(os.path.join(path, file)) as d:
            dictData = json.load(d)
            testResult.append(dictData['name'][:-2] + ":" + dictData['status'])

with open('../test_output/parse_result.txt', 'w') as file:
     file.write("\n".join(str(item) for item in testResult))

