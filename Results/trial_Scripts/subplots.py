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
host_numbers = host_numbers1
combined_counts = [count1 + count2 for count1, count2 in zip(count_values1, count_values2)]

# Create a figure with 2 rows and 2 columns of subplots
fig, axes = plt.subplots(2, 2, figsize=(12, 8))  # Adjust figsize for better visualization

# Distribute data across subplots (assuming roughly equal data size)
plot_count = int(len(host_numbers1) / 4)  # Assuming roughly equal data per subplot
start_index = 0
for i in range(2):
  for j in range(2):
    end_index = start_index + plot_count
    axes[i, j].bar(host_numbers1[start_index:end_index], count_values1[start_index:end_index],0.2)
    axes[i, j].bar([h + 0.2 for h in host_numbers1[start_index:end_index]], count_values2[start_index:end_index],0.2)
    axes[i, j].bar([h + 0.4 for h in host_numbers1[start_index:end_index]], count_values3[start_index:end_index],0.2)
    axes[i, j].set_xlabel('Host number')
    axes[i, j].set_ylabel('Number of control packets (log scale)')
    axes[i, j].set_title(f'Hosts {start_index+1} to {end_index}')  # Adjust title based on data distribution
    axes[i, j].set_yscale('log')  # Set logarithmic scale for y-axis
    #axes[i, j].xticks([i + 0.2 for i in host_numbers1[start_index:end_index]], host_numbers1) 
    start_index = end_index

# Adjust layout and display the plot
fig.suptitle('Number of control packets sent or forwarded by each host (Comparison - Subplots)', fontsize=12)
plt.tight_layout()
plt.show()

