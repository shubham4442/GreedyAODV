import re
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
import os 

#Control_packets
#Data_packets_Sent
# Function to extract the count value from the text

# Function to extract data from a file
def extract_data(filename, label):
  host_numbers = []
  count_values = []
  cwd = os.path.dirname(os.path.abspath(__file__))
  with open(cwd + '//' + filename, 'r') as file:
    text = file.read()
    matches = re.findall(r'statistic wireless96Nodes\.host\d+\.aodv Control_packets:stats.*?attr interpolationmode none', text, re.DOTALL)
    for match in matches:
      host_number, count = extract_count(match)
      if host_number is not None and count is not None:
        host_numbers.append(host_number)
        count_values.append(count)
  return host_numbers, count_values, label

# Function to extract count value from the text (unchanged)
def extract_count(text):
  pattern = r'statistic wireless96Nodes\.host(\d+)\.aodv Control_packets:stats\nfield count (\d+)'
  match = re.search(pattern, text)
  if match:
    host_number = int(match.group(1))
    count = int(match.group(2))
    return host_number, count
  else:
    return None, None

# Extract data from two files (replace "filename1.sca" and "filename2.sca" with your actual filenames)
host_numbers1, count_values1, label1 = extract_data("aodv.sca", "AODV")
host_numbers2, count_values2, label2 = extract_data("greedy_aodv.sca", "Greedy + AODV")
host_numbers3, count_values3, label3 = extract_data("RL_greedy_aodv.sca", "Greedy + AODV+ RL")

# Combine data (assuming the order of nodes is the same in both files)
# Combine data into a single DataFrame
data = [count_values1, count_values2, count_values3]

fig = plt.figure()
 
# Creating axes instance
ax = fig.add_axes([0, 0, 1, 1])
 
# Creating plot
bp = ax.boxplot(data)

plt.xlabel('Host number')
plt.ylabel('Number of control packets (log scale)')  # Update label with mention of log scale
plt.title('Number of control packets sent or forwarded by each host (Comparison)')
 
# show plot
plt.show()
