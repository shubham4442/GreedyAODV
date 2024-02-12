//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package tacsim.simulations.TacSim;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.unitdisk.UnitDiskRadioMedium;
import inet.node.aodv.AodvRouter;
import inet.visualizer.contract.IIntegratedVisualizer;
//
// TODO auto-generated type
//
network wirelessNetwork
{
    parameters:
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="packets received: %g"; initialValue=0);
        @statistic[packetReceived](source=host20.app[0].packetReceived; record=figure(count); targetFigure=rcvdPkText);

    submodules:
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=580,125");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=44,204");
        }
        radioMedium: UnitDiskRadioMedium {
            @display("p=47,33");
        }
        host: AodvRouter {
            @display("p=352,481");
        }
        host1: AodvRouter {
            @display("p=332,354");
        }
        host2: AodvRouter {
            @display("p=454,496");
        }
        host3: AodvRouter {
            @display("p=594,259");
        }
        host4: AodvRouter {
            @display("p=423,382");
        }
        host5: AodvRouter {
            @display("p=403,259");
        }
        host6: AodvRouter {
            @display("p=266,559");
        }
        host7: AodvRouter {
            @display("p=246,411");
        }
        host8: AodvRouter {
            @display("p=616,411");
        }
        host9: AodvRouter {
            @display("p=544,475");
        }
        host10: AodvRouter {
            @display("p=729,382");
        }
        host11: AodvRouter {
            @display("p=656,298");
        }
        host12: AodvRouter {
            @display("p=564,189");
        }
        host13: AodvRouter {
            @display("p=636,110");
        }
        host14: AodvRouter {
            @display("p=761,101");
        }
        host15: AodvRouter {
            @display("p=875,101");
        }
        host16: AodvRouter {
            @display("p=1060,149");
        }
        host17: AodvRouter {
            @display("p=973,125");
        }
        host18: AodvRouter {
            @display("p=1127,204");
        }
        host19: AodvRouter {
            @display("p=1191,250");
        }
        host20: AodvRouter {
            @display("p=1257,337");
        }
}
