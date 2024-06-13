import re
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
    matches = re.findall(r'statistic wireless20Nodes\.host\d+\.aodv Control_packets:stats.*?attr interpolationmode none', text, re.DOTALL)
    for match in matches:
      host_number, count = extract_count(match)
      if host_number is not None and count is not None:
        host_numbers.append(host_number)
        count_values.append(count)
  return host_numbers, count_values, label

# Function to extract count value from the text (unchanged)
def extract_count(text):
  pattern = r'statistic wireless20Nodes\.host(\d+)\.aodv Control_packets:stats\nfield count (\d+)'
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
host_numbers = host_numbers1
combined_counts = [count1 + count2 for count1, count2 in zip(count_values1, count_values2)]

# Adjust bar width to accommodate three sets of bars
bar_width = 0.3

# Calculate positions for each set of bars
index = range(len(host_numbers))
bar1_positions = index
bar2_positions = [i + bar_width for i in index]
bar3_positions = [i + bar_width * 2 for i in index]

# Plot bars for each file
plt.bar(bar1_positions, count_values1, bar_width, label=label1)
plt.bar(bar2_positions, count_values2, bar_width, label=label2)
plt.bar(bar3_positions, count_values3, bar_width, label=label3)

# Set labels and title
plt.xlabel('Host number')
plt.ylabel('Number of control packets (log scale)')  # Update label with mention of log scale
plt.title('Number of control packets sent or forwarded by each host (Comparison)')
plt.xticks([i + bar_width for i in index], host_numbers)  # Set x-axis ticks with host numbers
plt.yscale('log')  # Set y-axis to logarithmic scale
plt.legend()
plt.show()

