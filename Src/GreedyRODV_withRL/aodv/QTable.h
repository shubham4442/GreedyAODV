#ifndef INET_QTABLE_H
#define INET_QTABLE_H

#include <vector>

namespace inet
{
    class QTable
    {
    private:
        typedef std::vector<std::vector<double>> Vector2D;
        Vector2D qTable;
        double maxRadius;
        int ActionSpace, StateSpace;



    public:
        // Constructor, initialize Qtable with random/predefined values
        QTable();

        // set parameters
        void setParams(double imaxRadius, int iActionSpace, int iStateSpace);

        // Update Table with new qValue
        bool updateTable(double iState,  bool RouteFound);
        
        // Getter method (action)
        double getActionFromState (double iState);


        // internal methods
        int getMaxQvalueIndex(double remainingDistance);

        // Get radius from index (Action)
        double getRadiusFromActionIndex(int i); 

        // Get Action index from radius
        int getActionIndexFromRadius(double iRadius); 

        // Returns index for distance (state index)
        int getIndexForDistance(double remainingDistance);

        // returns new qvalue caculated by reward logic
        double RewardFunc(int LastStateindex,int  LastActionindex , bool RouteFound = false);
    };
} // namespace inet

#endif
