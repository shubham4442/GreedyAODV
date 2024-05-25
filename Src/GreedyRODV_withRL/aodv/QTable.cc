
#include <vector>
#include <algorithm>
#include <inet/routing/aodv/QTable.h>
#include "QTable.h"
#include <fstream>


namespace inet
{
    QTable::QTable()
    {
        ActionSpace = 10;
        StateSpace = 100;
        maxRadius = 8000;
        // Initialize discrete qTable with MaxRadius as Max action space and 2*MaxRadius as state space 
        qTable.resize(StateSpace);
        std::vector<double> actionVec(ActionSpace, 1);
        std::fill(qTable.begin(), qTable.end(), actionVec);
    }

    void QTable::setParams(double imaxRadius, int iActionSpace, int iStateSpace)
    {
        ActionSpace = iActionSpace;
        StateSpace = iStateSpace;
        maxRadius = imaxRadius;
    }

    bool QTable::updateTable(double iState,  bool RouteFound)
    {
        if (iState<0) return false;
        int stateIndex = getIndexForDistance(iState);

        if((stateIndex < 0) || stateIndex>StateSpace) return false;

        double Radius = getActionFromState(iState);
        if(Radius<0) return false;
        int actionIndex = getActionIndexFromRadius(Radius);
        if(actionIndex<0 || actionIndex > ActionSpace) return false;

        double qValue = RewardFunc(stateIndex,actionIndex,RouteFound);
        if (qValue > 1)
            qValue = 1;
        qTable[stateIndex][actionIndex] = qValue;

        return true;
    }

    double QTable::getActionFromState(double iState)
    {
        if(iState<0) return 0.0;
        int idx = getMaxQvalueIndex(iState);
        return getRadiusFromActionIndex(idx);
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
        if(iRadius>=maxRadius)
            return ActionSpace -1;

        double DisRad = maxRadius/ActionSpace;

        if((iRadius / DisRad) == 0) return 0;

        return (iRadius / DisRad) - 1; // carefull
    }

    int QTable::getIndexForDistance(double remainingDistance)
    {
        double maxDist = 2*maxRadius;
        if (remainingDistance > maxDist)
            return StateSpace-1;
        
        double DiscreteDistBlock = maxDist/StateSpace;

        return remainingDistance / DiscreteDistBlock;
     
        // while (remainingDistance > currDist)
        // {
        //     currDist = currDist + maxDist/StateSpace;
        //     idx ++;
        // }
        // //Discrete sections 
        // return idx;
    }
    double QTable::RewardFunc(int LastStateindex, int LastActionindex, bool RouteFound)
    {
        // needs some considerations
        double learning_rate = 0.01;
        if(RouteFound)
            return qTable[LastStateindex][LastActionindex] + (learning_rate * 1);
        else
            return qTable[LastStateindex][LastActionindex] + (learning_rate * (-1));

        return 0.0;
    }
}
