//
// Copyright (C) 2014 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//

import inet.common.INETDefs;
import inet.common.packet.chunk.Chunk;
import inet.common.TlvOptions;
import inet.common.packet.Packet;
import inet.networklayer.common.L3Address;
import inet.common.geometry.Geometry;

namespace inet::aodv;

enum ForwardingMode {
    GREEDY_ROUTING = 1;
    AODV_ROUTING = 2;
};


enum AodvControlPacketType
{
    RREQ = 1;
    RREP = 2;
    RERR = 3;
    RREPACK = 4;
    RREQ_IPv6 = 16;
    RREP_IPv6 = 17;
    RERR_IPv6 = 18;
    RREPACK_IPv6 = 19;
    GREEDY_BEACON = 21;
};


class GreedyOption extends TlvOptionBase {
    ForwardingMode routingMode;
    Coord destinationPosition;               // D
}

//
// Base packet for AODV Control Packets
//
class AodvControlPacket extends FieldsChunk
{
    AodvControlPacketType packetType = static_cast<AodvControlPacketType>(-1);       // packet type, stored in one byte
}

class GreedyBeacon extends AodvControlPacket
{
    L3Address address;
    Coord position;
}

//
// Represents an AODV Route Request
//
class Rreq extends AodvControlPacket
{
    // chunkLength = B(24) or B(48)
    // packetType = RREQ or RREQ_IPv6
    bool joinFlag;    // Join flag; reserved for multicast.
    bool repairFlag;    // Repair flag; reserved for multicast.
    bool gratuitousRREPFlag;    // Gratuitous RREP flag; indicates whether a gratuitous RREP should be unicast to the node specified in the Destination IP Address field
    bool destOnlyFlag;    // Destination only flag; indicates only the destination may respond to this RREQ
    bool unknownSeqNumFlag;    // Unknown sequence number; indicates the destination sequence number is unknown
    uint16_t reserved = 0;    // Sent as 0; ignored on reception.
    unsigned int hopCount;    // The number of hops from the Originator IP Address to the node handling the request.
    uint32_t rreqId;    // A sequence number uniquely identifying the particular RREQ when taken in conjunction with the originating node's IP address.
    L3Address destAddr;    // The IP address of the destination for which a route is desired.
    uint32_t destSeqNum;    // The latest sequence number received in the past by the originator for any route towards the destination.
    L3Address originatorAddr;    // The IP address of the node which originated the Route Request.
    uint32_t originatorSeqNum;    // The current sequence number to be used in the route entry pointing towards the originator of the route request.

}

//
// Represents an AODV Route Reply
//
class Rrep extends AodvControlPacket
{
    // chunkLength = B(20) or B(44)
    // packetType = RREP or RREP_IPv6
    bool repairFlag;    // Repair flag; used for multicast.
    bool ackRequiredFlag;    // Acknowledgment required.
    uint16_t reserved = 0;    // Sent as 0; ignored on reception.
    unsigned int prefixSize;    // If nonzero, the 5-bit Prefix Size specifies that the indicated next hop may be used for any nodes with the same routing prefix (as defined by the Prefix Size) as the requested destination.
    unsigned int hopCount;    // The number of hops from the Originator IP Address to the Destination IP Address.  For multicast route requests this indicates the number of hops to the multicast tree member sending the RREP.
    L3Address destAddr;    // The IP address of the destination for which a route is supplied.
    uint32_t destSeqNum;    // The destination sequence number associated to the route.
    L3Address originatorAddr;    // The IP address of the node which originated the RREQ for which the route is supplied.
    simtime_t lifeTime;     // The time in milliseconds for which nodes receiving the RREP consider the route to be valid.
}

//
// Helper struct to represent (L3Address, sequence number) pairs in a RERR message
//
struct UnreachableNode
{
    @packetData;
    L3Address addr;    // The IP address of the destination that has become unreachable due to a link break.
    uint32_t seqNum;    // The sequence number in the route table entry for the destination listed in the previous Unreachable Destination IP Address field.
};

//
// Represents an AODV Route Error
//
class Rerr extends AodvControlPacket
{
    // chunkLength = B(4 + N * (4+4)) or B(4 + N * (4+16))
    // packetType = RERR or RERR_IPv6
    bool noDeleteFlag;    // No delete flag; set when a node has performed a local repair of a link, and upstream nodes should not delete the route.
    uint16_t reserved = 0;    // Sent as 0; ignored on reception.
    UnreachableNode unreachableNodes[];    // The unreachable destinations included in the message; MUST be at least 1.
}

//
// Represents an AODV Route Reply ACK
//
class RrepAck extends AodvControlPacket
{
    chunkLength = B(2);
    // packetType = RREPACK or RREPACK_IPv6
    uint8_t reserved = 0;
}

//
// Represents an internal timer for a Route Reply packet in Aodv module
//
message WaitForRrep
{
    L3Address destAddr;
    unsigned int lastTTL;
    bool fromInvalidEntry;
}

//
// Represents a timer for delayed sending
//
message PacketHolderMessage
{
    Packet *ownedPacket @owned;
}
