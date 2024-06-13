import re
import matplotlib.pyplot as plt
import os 

#Control_packets
#Data_packets_Sent
# Function to extract the count value from the text
def extract_count(text):
    pattern = r'statistic wireless96Nodes\.host(\d+)\.aodv Control_packets:stats\nfield count (\d+)'
    match = re.search(pattern, text)
    if match:
        host_number = int(match.group(1))
        count = int(match.group(2))
        return host_number, count
    else:
        return None, None

# Read the file and extract count values
host_numbers = []
count_values = []
cwd = os.path.dirname(os.path.abspath(__file__))
with open(cwd + '//General-#0.sca', 'r') as file:
    text = file.read()
    matches = re.findall(r'statistic wireless96Nodes\.host\d+\.aodv Control_packets:stats.*?attr interpolationmode none', text, re.DOTALL)
    for match in matches:
        host_number, count = extract_count(match)
        if host_number is not None and count is not None:
            host_numbers.append(host_number)
            count_values.append(count)

# Create bar graph
plt.bar(host_numbers, count_values)
plt.xlabel('Host Number')
plt.ylabel('Number of control packets')
plt.title('Number of control packets sent or forwarded by each host')
plt.legend(['Total Packets: {}'.format(sum(count_values))], loc='upper right')
plt.show()