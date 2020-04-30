<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="DataRate(3:0)" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="NACK" />
        <signal name="XLXN_39(7:0)" />
        <signal name="XLXN_40(3:0)" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_43(7:0)" />
        <signal name="Reset" />
        <signal name="Clk" />
        <signal name="NewData" />
        <signal name="Device_ID(7:0)" />
        <signal name="X(15:0)" />
        <signal name="Y(15:0)" />
        <signal name="Z(15:0)" />
        <signal name="XLXN_63" />
        <signal name="XLXN_74" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76(7:0)" />
        <signal name="INT1" />
        <port polarity="Input" name="DataRate(3:0)" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="NACK" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="Clk" />
        <port polarity="Output" name="NewData" />
        <port polarity="Output" name="Device_ID(7:0)" />
        <port polarity="Output" name="X(15:0)" />
        <port polarity="Output" name="Y(15:0)" />
        <port polarity="Output" name="Z(15:0)" />
        <port polarity="Input" name="INT1" />
        <blockdef name="I2C_Master">
            <timestamp>2020-4-7T13:33:35</timestamp>
            <rect width="336" x="64" y="-512" height="572" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="464" y1="-256" y2="-256" x1="400" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-140" height="24" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <line x2="464" y1="32" y2="32" x1="400" />
        </blockdef>
        <blockdef name="adxl345_driver">
            <timestamp>2020-4-29T18:48:2</timestamp>
            <line x2="448" y1="-672" y2="-672" x1="384" />
            <rect width="64" x="384" y="-236" height="24" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="384" y="-172" height="24" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <rect width="64" x="384" y="-620" height="24" />
            <line x2="448" y1="-608" y2="-608" x1="384" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <rect width="64" x="384" y="-556" height="24" />
            <line x2="448" y1="-544" y2="-544" x1="384" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <rect width="64" x="384" y="-364" height="24" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-576" y2="-576" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-412" height="24" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="320" x="64" y="-704" height="768" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
        </blockdef>
        <block symbolname="I2C_Master" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="Go" />
            <blockpin signalname="XLXN_39(7:0)" name="Address(7:0)" />
            <blockpin signalname="XLXN_40(3:0)" name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="XLXN_41" name="FIFO_Pop" />
            <blockpin signalname="XLXN_42" name="FIFO_Push" />
            <blockpin signalname="XLXN_43(7:0)" name="FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_74" name="FIFO_Empty" />
            <blockpin signalname="XLXN_75" name="FIFO_Full" />
            <blockpin signalname="XLXN_76(7:0)" name="FIFO_DO(7:0)" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_63" name="Busy" />
            <blockpin signalname="NACK" name="NACK" />
        </block>
        <block symbolname="adxl345_driver" name="XLXI_2">
            <blockpin signalname="XLXN_74" name="FIFO_Empty" />
            <blockpin signalname="XLXN_75" name="FIFO_Full" />
            <blockpin signalname="XLXN_63" name="Busy" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_76(7:0)" name="FIFO_DO(7:0)" />
            <blockpin signalname="DataRate(3:0)" name="DataRate(3:0)" />
            <blockpin signalname="XLXN_1" name="Go" />
            <blockpin signalname="XLXN_41" name="FIFO_Pop" />
            <blockpin signalname="XLXN_42" name="FIFO_Push" />
            <blockpin signalname="NewData" name="NewData" />
            <blockpin signalname="XLXN_39(7:0)" name="Address(7:0)" />
            <blockpin signalname="XLXN_40(3:0)" name="ReadCnt(3:0)" />
            <blockpin signalname="XLXN_43(7:0)" name="FIFO_DI(7:0)" />
            <blockpin signalname="Device_ID(7:0)" name="Device_ID(7:0)" />
            <blockpin signalname="X(15:0)" name="X(15:0)" />
            <blockpin signalname="Y(15:0)" name="Y(15:0)" />
            <blockpin signalname="Z(15:0)" name="Z(15:0)" />
            <blockpin signalname="INT1" name="INT1" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2400" y="1392" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="2400" y1="912" y2="912" x1="1824" />
        </branch>
        <branch name="SDA">
            <wire x2="3152" y1="912" y2="912" x1="2864" />
        </branch>
        <branch name="SCL">
            <wire x2="3152" y1="976" y2="976" x1="2864" />
        </branch>
        <branch name="NACK">
            <wire x2="3152" y1="1424" y2="1424" x1="2864" />
        </branch>
        <branch name="XLXN_39(7:0)">
            <wire x2="2400" y1="976" y2="976" x1="1824" />
        </branch>
        <branch name="XLXN_40(3:0)">
            <wire x2="2400" y1="1040" y2="1040" x1="1824" />
        </branch>
        <branch name="XLXN_41">
            <wire x2="2112" y1="1104" y2="1104" x1="1824" />
            <wire x2="2112" y1="1104" y2="1136" x1="2112" />
            <wire x2="2400" y1="1136" y2="1136" x1="2112" />
        </branch>
        <branch name="XLXN_42">
            <wire x2="2112" y1="1168" y2="1168" x1="1824" />
            <wire x2="2112" y1="1168" y2="1200" x1="2112" />
            <wire x2="2400" y1="1200" y2="1200" x1="2112" />
        </branch>
        <branch name="XLXN_43(7:0)">
            <wire x2="2112" y1="1232" y2="1232" x1="1824" />
            <wire x2="2112" y1="1232" y2="1264" x1="2112" />
            <wire x2="2400" y1="1264" y2="1264" x1="2112" />
        </branch>
        <iomarker fontsize="28" x="3152" y="1424" name="NACK" orien="R0" />
        <branch name="Reset">
            <wire x2="1264" y1="1456" y2="1456" x1="1136" />
            <wire x2="1376" y1="1456" y2="1456" x1="1264" />
            <wire x2="1264" y1="1456" y2="1648" x1="1264" />
            <wire x2="2224" y1="1648" y2="1648" x1="1264" />
            <wire x2="2400" y1="1360" y2="1360" x1="2224" />
            <wire x2="2224" y1="1360" y2="1648" x1="2224" />
        </branch>
        <branch name="Clk">
            <wire x2="1328" y1="1552" y2="1552" x1="1136" />
            <wire x2="1376" y1="1552" y2="1552" x1="1328" />
            <wire x2="1328" y1="1552" y2="1712" x1="1328" />
            <wire x2="2288" y1="1712" y2="1712" x1="1328" />
            <wire x2="2400" y1="1424" y2="1424" x1="2288" />
            <wire x2="2288" y1="1424" y2="1712" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1456" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="1136" y="1552" name="Clk" orien="R180" />
        <iomarker fontsize="28" x="3152" y="1536" name="NewData" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1664" name="X(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1728" name="Y(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="1792" name="Z(15:0)" orien="R0" />
        <iomarker fontsize="28" x="3152" y="912" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="3152" y="976" name="SCL" orien="R0" />
        <branch name="XLXN_63">
            <wire x2="2912" y1="800" y2="800" x1="1328" />
            <wire x2="2912" y1="800" y2="1360" x1="2912" />
            <wire x2="1328" y1="800" y2="1184" x1="1328" />
            <wire x2="1376" y1="1184" y2="1184" x1="1328" />
            <wire x2="2912" y1="1360" y2="1360" x1="2864" />
        </branch>
        <iomarker fontsize="28" x="3152" y="1600" name="Device_ID(7:0)" orien="R0" />
        <branch name="DataRate(3:0)">
            <wire x2="1360" y1="1328" y2="1328" x1="1136" />
            <wire x2="1376" y1="1328" y2="1328" x1="1360" />
        </branch>
        <branch name="Z(15:0)">
            <wire x2="1920" y1="1552" y2="1552" x1="1824" />
            <wire x2="1920" y1="1552" y2="1792" x1="1920" />
            <wire x2="3136" y1="1792" y2="1792" x1="1920" />
            <wire x2="3152" y1="1792" y2="1792" x1="3136" />
        </branch>
        <branch name="Y(15:0)">
            <wire x2="1984" y1="1488" y2="1488" x1="1824" />
            <wire x2="1984" y1="1488" y2="1728" x1="1984" />
            <wire x2="3136" y1="1728" y2="1728" x1="1984" />
            <wire x2="3152" y1="1728" y2="1728" x1="3136" />
        </branch>
        <branch name="X(15:0)">
            <wire x2="2048" y1="1424" y2="1424" x1="1824" />
            <wire x2="2048" y1="1424" y2="1664" x1="2048" />
            <wire x2="3136" y1="1664" y2="1664" x1="2048" />
            <wire x2="3152" y1="1664" y2="1664" x1="3136" />
        </branch>
        <branch name="Device_ID(7:0)">
            <wire x2="1840" y1="1360" y2="1360" x1="1824" />
            <wire x2="2112" y1="1360" y2="1360" x1="1840" />
            <wire x2="2112" y1="1360" y2="1600" x1="2112" />
            <wire x2="3136" y1="1600" y2="1600" x1="2112" />
            <wire x2="3152" y1="1600" y2="1600" x1="3136" />
        </branch>
        <branch name="NewData">
            <wire x2="2176" y1="1296" y2="1296" x1="1824" />
            <wire x2="2176" y1="1296" y2="1536" x1="2176" />
            <wire x2="3136" y1="1536" y2="1536" x1="2176" />
            <wire x2="3152" y1="1536" y2="1536" x1="3136" />
        </branch>
        <branch name="XLXN_76(7:0)">
            <wire x2="2944" y1="768" y2="768" x1="1296" />
            <wire x2="2944" y1="768" y2="1264" x1="2944" />
            <wire x2="1296" y1="768" y2="1104" x1="1296" />
            <wire x2="1376" y1="1104" y2="1104" x1="1296" />
            <wire x2="2880" y1="1264" y2="1264" x1="2864" />
            <wire x2="2944" y1="1264" y2="1264" x1="2880" />
        </branch>
        <branch name="XLXN_75">
            <wire x2="2976" y1="736" y2="736" x1="1264" />
            <wire x2="2976" y1="736" y2="1200" x1="2976" />
            <wire x2="1264" y1="736" y2="1008" x1="1264" />
            <wire x2="1376" y1="1008" y2="1008" x1="1264" />
            <wire x2="2880" y1="1200" y2="1200" x1="2864" />
            <wire x2="2976" y1="1200" y2="1200" x1="2880" />
        </branch>
        <branch name="XLXN_74">
            <wire x2="3008" y1="704" y2="704" x1="1232" />
            <wire x2="3008" y1="704" y2="1136" x1="3008" />
            <wire x2="1232" y1="704" y2="912" x1="1232" />
            <wire x2="1376" y1="912" y2="912" x1="1232" />
            <wire x2="2880" y1="1136" y2="1136" x1="2864" />
            <wire x2="3008" y1="1136" y2="1136" x1="2880" />
        </branch>
        <instance x="1376" y="1584" name="XLXI_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1136" y="1328" name="DataRate(3:0)" orien="R180" />
        <branch name="INT1">
            <wire x2="1360" y1="1248" y2="1248" x1="1136" />
            <wire x2="1376" y1="1248" y2="1248" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1248" name="INT1" orien="R180" />
    </sheet>
</drawing>