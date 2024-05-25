#include "GreedyAodv.h"

Define_Module(GreedyAodv);


void GreedyAodv::initialize(int stage)
{
    Aodv::initialize(stage);
    // Initialize start time for delay calculation
    CtrlPckSignal = registerSignal("ctrlPckCount");
    OverheadSignal = registerSignal("RoutingOverhead");
    //EndToEndDelaySignal = registerSignal("EndToEndDelay");

    iCtrlPcktCount = 0;
    overheadPckCount = 0;
    //arrivalSignal = simTime();
}


void GreedyAodv::handleMessageWhenUp(cMessage *msg)
{
    Aodv::handleMessageWhenUp(msg); // Call base class handleMessage

    // Add your additional logic here to measure overhead and end-to-end delay
    if (msg->isSelfMessage()) {
        // Handle control messages
        // Record routing overhead
        recordRoutingOverhead();
        delete msg;
    } else {
        // Handle data packets
        // Record timestamps for end-to-end delay calculation
        recordCtrlPacketReceived();
    }
}



void GreedyAodv::recordPacketSentTimestamp()
{
    // Record timestamp when packet is sent
    // Example implementation
    //simtime_t currentTime = simTime();
    // Store currentTime...
}

void GreedyAodv::recordCtrlPacketReceived()
{
    // Record timestamp when packet is received
    // Example implementation
    //simtime_t currentTime = simTime();
    // Calculate end-to-end delay
    //simtime_t delay = currentTime - startTime;
    // Store delay...

    iCtrlPcktCount++;
    emit(CtrlPckSignal, iCtrlPcktCount);
}

void GreedyAodv::recordRoutingOverhead()
{
    // Example implementation to track routing overhead
    // Increment a counter each time a control message is sent
    // Example:
    // routingOverheadCounter++;
    overheadPckCount++;
    emit(OverheadSignal, overheadPckCount);
}
