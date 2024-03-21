
#include <vector>
#include <algorithm>
#include <inet/routing/aodv/QTable.h>
#include "QTable.h"

namespace inet
{
    QTable::QTable(double imaxRadius, int NbDiscreteAction = 50, int NbDiscreteState = 100):
    ActionSpace(NbDiscreteAction),
    StateSpace(NbDiscreteState),
    maxRadius(imaxRadius)
    {
        // Initialize discrete qTable with MaxRadius as Max action space and 2*MaxRadius as state space 
        qTable.resize(StateSpace);
        std::vector<double> actionVec(ActionSpace, 1);
        std::fill(qTable.begin(), qTable.end(), actionVec);
    }

    bool QTable::updateTable(int iStateIndex, int iActionIndex, bool RouteFound)
    {
        if(iStateIndex > StateSpace || iActionIndex > ActionSpace)
            return false;
        double qValue = RewardFunc(iStateIndex,iActionIndex,RouteFound);
        if (qValue > 1)
            qValue = 1;
        qTable[iStateIndex][iActionIndex] = qValue;
    }

    int QTable::getMaxQvalueIndex(double remainingDistance)
    {
        int idx = getIndexForDistance(remainingDistance);
        std::vector<double> qValues = qTable[idx];
        return std::distance(qValues.begin(), std::max_element(qValues.begin(), qValues.end()));
    }
    double QTable::getRadiusFromActionIndex(int i)
    {
        return (i+1) * (maxRadius/ActionSpace);
    }

    int QTable::getActionIndexFromRadius(double iRadius)
    {
        if(iRadius>maxRadius)
            return ActionSpace;

        double DisRad = maxRadius/ActionSpace;
        int idx=0;
     
        while (iRadius > DisRad)
        {
            DisRad = DisRad + maxRadius/ActionSpace;
            idx ++;
        }
        //Discrete sections 
        return idx;
    }

    int QTable::getIndexForDistance(double remainingDistance)
    {
        double maxDist = 2*maxRadius;
        if (remainingDistance > maxDist)
            return StateSpace;
        
        double currDist = maxDist/StateSpace;
        int idx=0;
     
        while (remainingDistance > currDist)
        {
            currDist = currDist + maxDist/StateSpace;
            idx ++;
        }
        //Discrete sections 
        return idx;
    }
    double QTable::RewardFunc(int LastStateindex, int LastActionindex, bool RouteFound)
    {
        // needs some considerations
        double learning_rate = 0.01
        if(RouteFound)
            return qTable[LastStateindex][LastActionindex] + (learning_rate * 1);
        else
            return qTable[LastStateindex][LastActionindex] + (learning_rate * (-1));

        return 0.0;
    }
}
