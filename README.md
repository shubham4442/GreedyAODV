# Geographical routing with AODV at concave nodes enhanced by reinforcement learning
This project is parth of master thesis. It implements Greedy geographical routing on static and dynamic scenarios with AODV as a recovery mechanism in case of concave nodes, It also further implements a restricted search area for AODV determined by reinforcement learning. The project has modified code for AODV routing from INET framework and provides scenario files to simulate in OMNET++ simulator

## Implementation details
*Simulation scenarios depict tactical battlefield operations inspired by Anglova scenario
*Selection of the next hop is based on a greedy approach
*At concave nodes, routing mode is switched to AODV and route discovery is conducted in a restricted area.
*The radius of the circular restricted area is determined with q-Learning, implemented from scratch.


