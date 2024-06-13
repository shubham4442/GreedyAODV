

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

package tacsim.simulations.Testing;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.unitdisk.UnitDiskRadioMedium;
import inet.node.aodv.AodvRouter;
import inet.visualizer.contract.IIntegratedVisualizer;
//
// TODO auto-generated type
//
network wireless96Nodes
{
    parameters:
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);


        @display("bgb=23033.64,22726.525");
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
            @display("p=4910,3037;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host2: AodvRouter {
            @display("p=286,2116;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host3: AodvRouter {
            @display("p=3575,3545;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host4: AodvRouter {
            @display("p=3323,4050;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host5: AodvRouter {
            @display("p=2396,7146;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host6: AodvRouter {
            @display("p=350,4451;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host7: AodvRouter {
            @display("p=3399,8290;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host8: AodvRouter {
            @display("p=3585,832;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host9: AodvRouter {
            @display("p=719,8833;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host10: AodvRouter {
            @display("p=774,4087;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host11: AodvRouter {
            @display("p=2179,5376;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host12: AodvRouter {
            @display("p=1788,9108;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host13: AodvRouter {
            @display("p=4772,9046;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host14: AodvRouter {
            @display("p=3834,1366;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host15: AodvRouter {
            @display("p=1068,855;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host16: AodvRouter {
            @display("p=2789,6255;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host17: AodvRouter {
            @display("p=3653,5685;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host18: AodvRouter {
            @display("p=1828,7944;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host19: AodvRouter {
            @display("p=3330,1123;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host20: AodvRouter {
            @display("p=1918,9222;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host21: AodvRouter {
            @display("p=4407,4756;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host22: AodvRouter {
            @display("p=1558,7072;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host23: AodvRouter {
            @display("p=2042,6409;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host24: AodvRouter {
            @display("p=2073,3494;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host25: AodvRouter {
            @display("p=8802,12588;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host26: AodvRouter {
            @display("p=5704,12285;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host27: AodvRouter {
            @display("p=5884,17009;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host28: AodvRouter {
            @display("p=9025,17542;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host29: AodvRouter {
            @display("p=6252,12746;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host30: AodvRouter {
            @display("p=8762,17971;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host31: AodvRouter {
            @display("p=7782,18864;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host32: AodvRouter {
            @display("p=7764,19479;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host33: AodvRouter {
            @display("p=7222,18047;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host34: AodvRouter {
            @display("p=9439,12949;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host35: AodvRouter {
            @display("p=5262,10106;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host36: AodvRouter {
            @display("p=5878,16499;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host37: AodvRouter {
            @display("p=7874,11653;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host38: AodvRouter {
            @display("p=9791,19253;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host39: AodvRouter {
            @display("p=5652,17079;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host40: AodvRouter {
            @display("p=7842,12764;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host41: AodvRouter {
            @display("p=8040,10887;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host42: AodvRouter {
            @display("p=8419,12521;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host43: AodvRouter {
            @display("p=5975,15656;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host44: AodvRouter {
            @display("p=6560,16679;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host45: AodvRouter {
            @display("p=9573,17326;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host46: AodvRouter {
            @display("p=9561,19704;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host47: AodvRouter {
            @display("p=6075,13490;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host48: AodvRouter {
            @display("p=6752,17813;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host49: AodvRouter {
            @display("p=11873,19105;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host50: AodvRouter {
            @display("p=13541,12742;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host51: AodvRouter {
            @display("p=14015,19066;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host52: AodvRouter {
            @display("p=11686,12197;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host53: AodvRouter {
            @display("p=12909,10515;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host54: AodvRouter {
            @display("p=11008,14202;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host55: AodvRouter {
            @display("p=10255,15409;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host56: AodvRouter {
            @display("p=11849,18475;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host57: AodvRouter {
            @display("p=10406,19620;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host58: AodvRouter {
            @display("p=13103,19125;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host59: AodvRouter {
            @display("p=10389,19889;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host60: AodvRouter {
            @display("p=14166,14983;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host61: AodvRouter {
            @display("p=14691,16137;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host62: AodvRouter {
            @display("p=10029,15346;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host63: AodvRouter {
            @display("p=14368,18932;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host64: AodvRouter {
            @display("p=11808,14587;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host65: AodvRouter {
            @display("p=14227,16887;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host66: AodvRouter {
            @display("p=13926,17691;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host67: AodvRouter {
            @display("p=10379,15368;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host68: AodvRouter {
            @display("p=13604,19624;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host69: AodvRouter {
            @display("p=14722,10370;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host70: AodvRouter {
            @display("p=12121,16650;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host71: AodvRouter {
            @display("p=14552,15365;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host72: AodvRouter {
            @display("p=12482,12205;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host73: AodvRouter {
            @display("p=19808,1785;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host74: AodvRouter {
            @display("p=18178,2842;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host75: AodvRouter {
            @display("p=17468,2638;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host76: AodvRouter {
            @display("p=18939,5497;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host77: AodvRouter {
            @display("p=18633,1602;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host78: AodvRouter {
            @display("p=18864,7500;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host79: AodvRouter {
            @display("p=18899,3693;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host80: AodvRouter {
            @display("p=15931,9397;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host81: AodvRouter {
            @display("p=15969,9873;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host82: AodvRouter {
            @display("p=17122,2687;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host83: AodvRouter {
            @display("p=19585,980;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host84: AodvRouter {
            @display("p=18959,6175;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host85: AodvRouter {
            @display("p=19267,4448;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host86: AodvRouter {
            @display("p=16736,4003;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host87: AodvRouter {
            @display("p=16843,3446;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host88: AodvRouter {
            @display("p=19221,5717;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host89: AodvRouter {
            @display("p=15694,3839;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host90: AodvRouter {
            @display("p=17769,3716;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host91: AodvRouter {
            @display("p=17388,1294;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host92: AodvRouter {
            @display("p=15618,3548;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host93: AodvRouter {
            @display("p=18579,8660;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host94: AodvRouter {
            @display("p=15226,8190;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host95: AodvRouter {
            @display("p=19820,1178;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }
        host96: AodvRouter {
            @display("p=18302,2467;i=device/tank,,0;is=vs;r=4000,,#0080FF,1");
        }

}

