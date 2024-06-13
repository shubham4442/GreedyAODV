

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
network wireless24Nodes
{
    parameters:
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        
        @display("bgb=11043.288,10833.605");
    submodules:
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=3656.006,842.3151");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=519.7264,842.3151");
        }
        radioMedium: UnitDiskRadioMedium {
            @display("p=2150.5918,896.07996");
        }
        host1: AodvRouter {
            @display("p=2347.7295,4247.419;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host2: AodvRouter {
            @display("p=9785.192,8297.7;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host3: AodvRouter {
            @display("p=7939.268,7276.169;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host4: AodvRouter {
            @display("p=4713.3804,3853.1438;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host5: AodvRouter {
            @display("p=2491.1023,7598.758;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host6: AodvRouter {
            @display("p=1146.9823,9050.407;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host7: AodvRouter {
            @display("p=9014.564,7473.3066;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host8: AodvRouter {
            @display("p=6989.4233,6200.873;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host9: AodvRouter {
            @display("p=501.80475,7975.1113;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host10: AodvRouter {
            @display("p=2849.5342,5716.9897;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host11: AodvRouter {
            @display("p=1362.0415,4767.145;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host12: AodvRouter {
            @display("p=609.33435,5716.9897;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host13: AodvRouter {
            @display("p=3279.6526,6899.8154;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host14: AodvRouter {
            @display("p=8656.132,5842.441;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host15: AodvRouter {
            @display("p=1308.2767,6774.3643;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host16: AodvRouter {
            @display("p=6362.1675,4946.3613;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host17: AodvRouter {
            @display("p=6182.9517,3853.1438;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host18: AodvRouter {
            @display("p=3638.0845,4444.5566;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host19: AodvRouter {
            @display("p=2132.6702,6308.403;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host20: AodvRouter {
            @display("p=3279.6526,3548.4766;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host21: AodvRouter {
            @display("p=7580.8364,5251.0283;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host22: AodvRouter {
            @display("p=6989.4233,7473.3066;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host23: AodvRouter {
            @display("p=5394.4014,4444.5566;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
        host24: AodvRouter {
            @display("p=9786.33,9540.8;i=device/tank,,0;is=vs;r=2000,,#0080FF,1");
        }
}

