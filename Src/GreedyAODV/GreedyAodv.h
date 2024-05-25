// GreedyAodv.h
#ifndef GreedyAodv_H
#define GreedyAodv_H

#include "Aodv.h"

using namespace inet;
using namespace omnetpp;
using namespace aodv;

class GreedyAodv : public Aodv
{
protected:

    private:
    simsignal_t  CtrlPckSignal;
    simsignal_t  OverheadSignal;
   // simsignal_t  EndToEndDelaySignal;
    int iCtrlPcktCount;
    int overheadPckCount;

protected:

    virtual void initialize(int stage) override;
    virtual void handleMessageWhenUp(cMessage *msg) override;

    // Custom functions for statistics collection
    void recordPacketSentTimestamp();
    void recordPacketSentTimestamp();
    void recordRoutingOverhead();
    // Add additional functions for statistics collection
};

#endif /* GreedyAodv_H */

