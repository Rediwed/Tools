#%%
#This script will add two equal length binairy values together and print a result
bin1 = input("Enter the first value: ")
bin2 = input("Enter the second value : ")

if len(bin1) != len(bin2): raise ValueError("Both values must be the same length.")
bit_length = len(bin1)
result = ''
remainder = 0
for i in reversed(range(0, bit_length)):
    compute = remainder 
    compute = compute + 1 if bin1[i] == '1' else compute + 0
    compute = compute + 1 if bin2[i] == '1' else compute + 0
    if compute % 2 == 0: addition = '0'
    else: addition = '1'
    result = addition + result
    remainder = 0 if compute < 2 else 1
if remainder == 1: result = '1' + result
print(result)