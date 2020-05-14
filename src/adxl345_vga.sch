<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Reset" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4(15:0)" />
        <signal name="XLXN_5(15:0)" />
        <signal name="XLXN_6(15:0)" />
        <signal name="DataRate(3:0)" />
        <signal name="INT1" />
        <signal name="Char_DI(7:0)" />
        <signal name="Char_WE" />
        <signal name="XLXN_11" />
        <signal name="NewLine" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="Clk" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="VGA_RGB" />
        <signal name="XLXN_22" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="XLXN_31" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="DataRate(3:0)" />
        <port polarity="Input" name="INT1" />
        <port polarity="Output" name="Char_DI(7:0)" />
        <port polarity="Output" name="Char_WE" />
        <port polarity="Output" name="NewLine" />
        <port polarity="Input" name="Clk" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Output" name="VGA_RGB" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <blockdef name="VGAtxt48x20">
            <timestamp>2008-9-4T9:59:2</timestamp>
            <rect width="304" x="64" y="-640" height="728" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-608" y2="-608" x1="368" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
        </blockdef>
        <blockdef name="adxl345_i2c">
            <timestamp>2020-4-30T10:35:38</timestamp>
            <rect width="320" x="64" y="-512" height="512" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="448" y1="-480" y2="-480" x1="384" />
            <line x2="448" y1="-416" y2="-416" x1="384" />
            <rect width="64" x="384" y="-364" height="24" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <rect width="64" x="384" y="-300" height="24" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <rect width="64" x="384" y="-236" height="24" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="384" y="-172" height="24" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="vga_txt_driver">
            <timestamp>2020-5-13T12:44:47</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="320" y="-492" height="24" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="VGAtxt48x20" name="XLXI_1">
            <blockpin signalname="Char_DI(7:0)" name="Char_DI(7:0)" />
            <blockpin signalname="XLXN_11" name="Home" />
            <blockpin signalname="NewLine" name="NewLine" />
            <blockpin signalname="XLXN_13" name="Goto00" />
            <blockpin signalname="Clk" name="Clk_Sys" />
            <blockpin signalname="Clk" name="Clk_50MHz" />
            <blockpin signalname="XLXN_14" name="CursorOn" />
            <blockpin signalname="XLXN_15" name="ScrollEn" />
            <blockpin signalname="XLXN_16" name="ScrollClear" />
            <blockpin signalname="XLXN_22" name="Busy" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="VGA_RGB" name="VGA_RGB" />
            <blockpin signalname="Char_WE" name="Char_WE" />
        </block>
        <block symbolname="adxl345_i2c" name="XLXI_2">
            <blockpin signalname="DataRate(3:0)" name="DataRate(3:0)" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="INT1" name="INT1" />
            <blockpin name="NACK" />
            <blockpin signalname="XLXN_3" name="NewData" />
            <blockpin name="Device_ID(7:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="X(15:0)" />
            <blockpin signalname="XLXN_5(15:0)" name="Y(15:0)" />
            <blockpin signalname="XLXN_6(15:0)" name="Z(15:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
        </block>
        <block symbolname="vga_txt_driver" name="XLXI_3">
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="XLXN_22" name="Busy" />
            <blockpin signalname="XLXN_4(15:0)" name="X(15:0)" />
            <blockpin signalname="XLXN_5(15:0)" name="Y(15:0)" />
            <blockpin signalname="XLXN_6(15:0)" name="Z(15:0)" />
            <blockpin signalname="XLXN_3" name="NewData" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="Char_DI(7:0)" name="Char_DI(7:0)" />
            <blockpin signalname="Char_WE" name="Char_WE" />
            <blockpin signalname="XLXN_11" name="Home" />
            <blockpin signalname="NewLine" name="NewLine" />
            <blockpin signalname="XLXN_13" name="Goto00" />
            <blockpin signalname="XLXN_14" name="CursorOn" />
            <blockpin signalname="XLXN_15" name="ScrollEn" />
            <blockpin signalname="XLXN_16" name="ScrollClear" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="944" y="1344" name="XLXI_2" orien="R0">
        </instance>
        <branch name="Reset">
            <wire x2="848" y1="1008" y2="1008" x1="640" />
            <wire x2="944" y1="1008" y2="1008" x1="848" />
            <wire x2="848" y1="672" y2="1008" x1="848" />
            <wire x2="1552" y1="672" y2="672" x1="848" />
            <wire x2="1552" y1="672" y2="880" x1="1552" />
            <wire x2="1744" y1="880" y2="880" x1="1552" />
        </branch>
        <branch name="DataRate(3:0)">
            <wire x2="944" y1="864" y2="864" x1="624" />
        </branch>
        <branch name="INT1">
            <wire x2="944" y1="1296" y2="1296" x1="624" />
        </branch>
        <branch name="XLXN_11">
            <wire x2="2432" y1="1008" y2="1008" x1="2128" />
        </branch>
        <branch name="NewLine">
            <wire x2="2240" y1="1072" y2="1072" x1="2128" />
            <wire x2="2432" y1="1072" y2="1072" x1="2240" />
            <wire x2="2240" y1="1072" y2="1616" x1="2240" />
            <wire x2="2912" y1="1616" y2="1616" x1="2240" />
            <wire x2="2912" y1="1312" y2="1616" x1="2912" />
            <wire x2="3088" y1="1312" y2="1312" x1="2912" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="2432" y1="1136" y2="1136" x1="2128" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="2272" y1="1200" y2="1200" x1="2128" />
            <wire x2="2272" y1="1200" y2="1232" x1="2272" />
            <wire x2="2432" y1="1232" y2="1232" x1="2272" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="3088" y1="848" y2="848" x1="2864" />
        </branch>
        <branch name="SDA">
            <wire x2="1488" y1="1248" y2="1248" x1="1392" />
            <wire x2="1488" y1="1248" y2="1600" x1="1488" />
            <wire x2="3120" y1="1600" y2="1600" x1="1488" />
        </branch>
        <branch name="SCL">
            <wire x2="1408" y1="1312" y2="1312" x1="1392" />
            <wire x2="1408" y1="1312" y2="1664" x1="1408" />
            <wire x2="3120" y1="1664" y2="1664" x1="1408" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="2272" y1="1328" y2="1328" x1="2128" />
            <wire x2="2272" y1="1328" y2="1360" x1="2272" />
            <wire x2="2432" y1="1360" y2="1360" x1="2272" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="2272" y1="1264" y2="1264" x1="2128" />
            <wire x2="2272" y1="1264" y2="1296" x1="2272" />
            <wire x2="2432" y1="1296" y2="1296" x1="2272" />
        </branch>
        <branch name="XLXN_6(15:0)">
            <wire x2="1536" y1="1184" y2="1184" x1="1392" />
            <wire x2="1536" y1="1184" y2="1264" x1="1536" />
            <wire x2="1744" y1="1264" y2="1264" x1="1536" />
        </branch>
        <branch name="XLXN_5(15:0)">
            <wire x2="1552" y1="1120" y2="1120" x1="1392" />
            <wire x2="1552" y1="1120" y2="1200" x1="1552" />
            <wire x2="1744" y1="1200" y2="1200" x1="1552" />
        </branch>
        <branch name="XLXN_4(15:0)">
            <wire x2="1568" y1="1056" y2="1056" x1="1392" />
            <wire x2="1568" y1="1056" y2="1136" x1="1568" />
            <wire x2="1744" y1="1136" y2="1136" x1="1568" />
        </branch>
        <branch name="Clk">
            <wire x2="896" y1="1152" y2="1152" x1="640" />
            <wire x2="944" y1="1152" y2="1152" x1="896" />
            <wire x2="896" y1="1152" y2="1456" x1="896" />
            <wire x2="1680" y1="1456" y2="1456" x1="896" />
            <wire x2="2288" y1="1456" y2="1456" x1="1680" />
            <wire x2="2432" y1="1456" y2="1456" x1="2288" />
            <wire x2="2288" y1="1456" y2="1520" x1="2288" />
            <wire x2="2432" y1="1520" y2="1520" x1="2288" />
            <wire x2="1680" y1="1072" y2="1456" x1="1680" />
            <wire x2="1744" y1="1072" y2="1072" x1="1680" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1568" y1="928" y2="928" x1="1392" />
            <wire x2="1568" y1="928" y2="1008" x1="1568" />
            <wire x2="1744" y1="1008" y2="1008" x1="1568" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="1664" y1="624" y2="944" x1="1664" />
            <wire x2="1744" y1="944" y2="944" x1="1664" />
            <wire x2="2928" y1="624" y2="624" x1="1664" />
            <wire x2="2928" y1="624" y2="1104" x1="2928" />
            <wire x2="2928" y1="1104" y2="1104" x1="2864" />
        </branch>
        <instance x="1744" y="1360" name="XLXI_3" orien="R0">
        </instance>
        <iomarker fontsize="28" x="640" y="1008" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="624" y="864" name="DataRate(3:0)" orien="R180" />
        <iomarker fontsize="28" x="624" y="1296" name="INT1" orien="R180" />
        <iomarker fontsize="28" x="640" y="1152" name="Clk" orien="R180" />
        <branch name="VGA_RGB">
            <wire x2="3088" y1="976" y2="976" x1="2864" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="3088" y1="912" y2="912" x1="2864" />
        </branch>
        <branch name="Char_WE">
            <wire x2="2224" y1="944" y2="944" x1="2128" />
            <wire x2="2224" y1="800" y2="912" x1="2224" />
            <wire x2="2224" y1="912" y2="944" x1="2224" />
            <wire x2="2432" y1="912" y2="912" x1="2224" />
            <wire x2="2912" y1="800" y2="800" x1="2224" />
            <wire x2="2912" y1="800" y2="1184" x1="2912" />
            <wire x2="3088" y1="1184" y2="1184" x1="2912" />
        </branch>
        <branch name="Char_DI(7:0)">
            <wire x2="2272" y1="880" y2="880" x1="2128" />
            <wire x2="2352" y1="880" y2="880" x1="2272" />
            <wire x2="2352" y1="880" y2="1584" x1="2352" />
            <wire x2="2928" y1="1584" y2="1584" x1="2352" />
            <wire x2="2272" y1="848" y2="880" x1="2272" />
            <wire x2="2432" y1="848" y2="848" x1="2272" />
            <wire x2="2928" y1="1248" y2="1584" x1="2928" />
            <wire x2="3088" y1="1248" y2="1248" x1="2928" />
        </branch>
        <instance x="2432" y="1456" name="XLXI_1" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3088" y="848" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="3088" y="912" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="3088" y="976" name="VGA_RGB" orien="R0" />
        <iomarker fontsize="28" x="3120" y="1600" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="3120" y="1664" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1184" name="Char_WE" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1248" name="Char_DI(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3088" y="1312" name="NewLine" orien="R0" />
    </sheet>
</drawing>