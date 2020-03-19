<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2" />
        <signal name="CLK_50Mhz" />
        <signal name="SPI_MISO" />
        <signal name="AMP_DOUT" />
        <signal name="SPI_MOSI" />
        <signal name="SPI_SCK" />
        <signal name="AMP_CS" />
        <signal name="APM_SHDN" />
        <signal name="AD_CONV" />
        <signal name="DAC_CS" />
        <signal name="DAC_CLR" />
        <signal name="SPI_SS_B" />
        <signal name="FPGA_INIT_B" />
        <signal name="XLXN_34(10:0)" />
        <signal name="XLXN_35(9:0)" />
        <signal name="XLXN_36(2:0)" />
        <signal name="XLXN_37(13:0)" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40(7:0)" />
        <signal name="VGA_VS" />
        <signal name="VGA_HS" />
        <signal name="VGA_B" />
        <signal name="VGA_G" />
        <signal name="VGA_R" />
        <port polarity="Input" name="CLK_50Mhz" />
        <port polarity="Input" name="SPI_MISO" />
        <port polarity="Input" name="AMP_DOUT" />
        <port polarity="Output" name="SPI_MOSI" />
        <port polarity="Output" name="SPI_SCK" />
        <port polarity="Output" name="AMP_CS" />
        <port polarity="Output" name="APM_SHDN" />
        <port polarity="Output" name="AD_CONV" />
        <port polarity="Output" name="DAC_CS" />
        <port polarity="Output" name="DAC_CLR" />
        <port polarity="Output" name="SPI_SS_B" />
        <port polarity="Output" name="FPGA_INIT_B" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_R" />
        <blockdef name="ADC_Ctrl">
            <timestamp>2009-10-5T13:47:32</timestamp>
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="416" y1="-800" y2="-800" x1="480" />
            <line x2="480" y1="-736" y2="-736" x1="416" />
            <line x2="480" y1="-672" y2="-672" x1="416" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <line x2="480" y1="-96" y2="-96" x1="416" />
            <rect width="64" x="416" y="-12" height="24" />
            <line x2="480" y1="0" y2="0" x1="416" />
            <rect width="64" x="416" y="52" height="24" />
            <line x2="480" y1="64" y2="64" x1="416" />
            <line x2="480" y1="128" y2="128" x1="416" />
            <line x2="0" y1="128" y2="128" x1="64" />
            <line x2="480" y1="-352" y2="-352" x1="416" />
            <line x2="480" y1="-288" y2="-288" x1="416" />
            <line x2="480" y1="-416" y2="-416" x1="416" />
            <line x2="416" y1="-480" y2="-480" x1="480" />
            <line x2="0" y1="-640" y2="-640" x1="64" />
            <line x2="480" y1="-544" y2="-544" x1="416" />
            <line x2="480" y1="-608" y2="-608" x1="416" />
            <rect width="352" x="64" y="-832" height="992" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <line x2="0" y1="64" y2="64" x1="64" />
        </blockdef>
        <blockdef name="vga_driver">
            <timestamp>2020-3-18T20:5:25</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="game_ctrl">
            <timestamp>2020-3-19T8:51:46</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <rect width="64" x="416" y="-108" height="24" />
            <line x2="480" y1="-96" y2="-96" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <block symbolname="ADC_Ctrl" name="XLXI_1">
            <blockpin signalname="CLK_50Mhz" name="Clk_Sys" />
            <blockpin signalname="XLXN_38" name="AMP_WE" />
            <blockpin signalname="XLXN_39" name="ADC_Start" />
            <blockpin signalname="SPI_MISO" name="SPI_MISO" />
            <blockpin signalname="AMP_DOUT" name="AMP_DOUT" />
            <blockpin signalname="XLXN_40(7:0)" name="AMP_DI(7:0)" />
            <blockpin name="Busy" />
            <blockpin signalname="SPI_MOSI" name="SPI_MOSI" />
            <blockpin signalname="SPI_SCK" name="SPI_SCK" />
            <blockpin signalname="AMP_CS" name="AMP_CS" />
            <blockpin signalname="APM_SHDN" name="AMP_SHDN" />
            <blockpin signalname="AD_CONV" name="AD_CONV" />
            <blockpin signalname="DAC_CS" name="DAC_CS" />
            <blockpin signalname="DAC_CLR" name="DAC_CLR" />
            <blockpin signalname="SPI_SS_B" name="SPI_SS_B" />
            <blockpin name="SF_CE0" />
            <blockpin signalname="FPGA_INIT_B" name="FPGA_INIT_B" />
            <blockpin signalname="XLXN_37(13:0)" name="ADC_DOA(13:0)" />
            <blockpin name="ADC_DOB(13:0)" />
            <blockpin name="Reset" />
            <blockpin signalname="CLK_50Mhz" name="Clk_50MHz" />
        </block>
        <block symbolname="game_ctrl" name="XLXI_5">
            <blockpin signalname="CLK_50Mhz" name="CLK_50Mhz" />
            <blockpin signalname="XLXN_34(10:0)" name="PIX_X(10:0)" />
            <blockpin signalname="XLXN_35(9:0)" name="PIX_Y(9:0)" />
            <blockpin signalname="XLXN_37(13:0)" name="ADC_DOA(13:0)" />
            <blockpin signalname="XLXN_38" name="AMP_Fetch" />
            <blockpin signalname="XLXN_39" name="ADC_START" />
            <blockpin signalname="XLXN_40(7:0)" name="AMP_Gain(7:0)" />
            <blockpin signalname="XLXN_36(2:0)" name="RGB(2:0)" />
        </block>
        <block symbolname="vga_driver" name="XLXI_2">
            <blockpin signalname="CLK_50Mhz" name="CLK_50MHz" />
            <blockpin signalname="XLXN_36(2:0)" name="RGB(2:0)" />
            <blockpin signalname="VGA_R" name="VGA_R" />
            <blockpin signalname="VGA_G" name="VGA_G" />
            <blockpin signalname="VGA_B" name="VGA_B" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="XLXN_34(10:0)" name="PIX_X(10:0)" />
            <blockpin signalname="XLXN_35(9:0)" name="PIX_Y(9:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="816" y="1520" name="XLXI_1" orien="R0">
        </instance>
        <branch name="CLK_50Mhz">
            <wire x2="752" y1="1648" y2="1648" x1="560" />
            <wire x2="816" y1="1648" y2="1648" x1="752" />
            <wire x2="752" y1="1648" y2="1728" x1="752" />
            <wire x2="1600" y1="1728" y2="1728" x1="752" />
            <wire x2="816" y1="1584" y2="1584" x1="752" />
            <wire x2="752" y1="1584" y2="1648" x1="752" />
            <wire x2="1600" y1="1312" y2="1728" x1="1600" />
            <wire x2="1744" y1="1312" y2="1312" x1="1600" />
            <wire x2="1744" y1="1312" y2="1504" x1="1744" />
            <wire x2="1760" y1="1504" y2="1504" x1="1744" />
            <wire x2="2448" y1="1312" y2="1312" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="560" y="1648" name="CLK_50Mhz" orien="R180" />
        <branch name="SPI_MISO">
            <wire x2="1328" y1="720" y2="720" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="720" name="SPI_MISO" orien="R0" />
        <branch name="AMP_DOUT">
            <wire x2="1328" y1="1040" y2="1040" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1040" name="AMP_DOUT" orien="R0" />
        <branch name="SPI_MOSI">
            <wire x2="1328" y1="784" y2="784" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="784" name="SPI_MOSI" orien="R0" />
        <branch name="SPI_SCK">
            <wire x2="1328" y1="848" y2="848" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="848" name="SPI_SCK" orien="R0" />
        <branch name="AMP_CS">
            <wire x2="1328" y1="976" y2="976" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="976" name="AMP_CS" orien="R0" />
        <branch name="APM_SHDN">
            <wire x2="1328" y1="1104" y2="1104" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1104" name="APM_SHDN" orien="R0" />
        <branch name="AD_CONV">
            <wire x2="1328" y1="912" y2="912" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="912" name="AD_CONV" orien="R0" />
        <branch name="DAC_CS">
            <wire x2="1328" y1="1232" y2="1232" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1232" name="DAC_CS" orien="R0" />
        <branch name="DAC_CLR">
            <wire x2="1328" y1="1168" y2="1168" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1168" name="DAC_CLR" orien="R0" />
        <branch name="SPI_SS_B">
            <wire x2="1328" y1="1296" y2="1296" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1296" name="SPI_SS_B" orien="R0" />
        <branch name="FPGA_INIT_B">
            <wire x2="1328" y1="1424" y2="1424" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1328" y="1424" name="FPGA_INIT_B" orien="R0" />
        <instance x="1760" y="1728" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_34(10:0)">
            <wire x2="1760" y1="1568" y2="1568" x1="1664" />
            <wire x2="1664" y1="1568" y2="1952" x1="1664" />
            <wire x2="2976" y1="1952" y2="1952" x1="1664" />
            <wire x2="2976" y1="1632" y2="1632" x1="2832" />
            <wire x2="2976" y1="1632" y2="1952" x1="2976" />
        </branch>
        <branch name="XLXN_35(9:0)">
            <wire x2="1728" y1="1632" y2="1888" x1="1728" />
            <wire x2="2912" y1="1888" y2="1888" x1="1728" />
            <wire x2="1760" y1="1632" y2="1632" x1="1728" />
            <wire x2="2912" y1="1696" y2="1696" x1="2832" />
            <wire x2="2912" y1="1696" y2="1888" x1="2912" />
        </branch>
        <branch name="XLXN_36(2:0)">
            <wire x2="2256" y1="1696" y2="1696" x1="2240" />
            <wire x2="2448" y1="1696" y2="1696" x1="2256" />
        </branch>
        <branch name="XLXN_37(13:0)">
            <wire x2="1520" y1="1520" y2="1520" x1="1296" />
            <wire x2="1520" y1="1520" y2="1696" x1="1520" />
            <wire x2="1760" y1="1696" y2="1696" x1="1520" />
        </branch>
        <branch name="XLXN_38">
            <wire x2="752" y1="608" y2="720" x1="752" />
            <wire x2="816" y1="720" y2="720" x1="752" />
            <wire x2="2304" y1="608" y2="608" x1="752" />
            <wire x2="2304" y1="608" y2="1504" x1="2304" />
            <wire x2="2304" y1="1504" y2="1504" x1="2240" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="816" y1="880" y2="880" x1="800" />
            <wire x2="800" y1="880" y2="1776" x1="800" />
            <wire x2="2288" y1="1776" y2="1776" x1="800" />
            <wire x2="2288" y1="1568" y2="1568" x1="2240" />
            <wire x2="2288" y1="1568" y2="1776" x1="2288" />
        </branch>
        <branch name="XLXN_40(7:0)">
            <wire x2="2384" y1="544" y2="544" x1="688" />
            <wire x2="2384" y1="544" y2="1632" x1="2384" />
            <wire x2="688" y1="544" y2="784" x1="688" />
            <wire x2="816" y1="784" y2="784" x1="688" />
            <wire x2="2384" y1="1632" y2="1632" x1="2240" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="2848" y1="1568" y2="1568" x1="2832" />
            <wire x2="2864" y1="1568" y2="1568" x1="2848" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="2848" y1="1504" y2="1504" x1="2832" />
            <wire x2="2864" y1="1504" y2="1504" x1="2848" />
        </branch>
        <branch name="VGA_B">
            <wire x2="2848" y1="1440" y2="1440" x1="2832" />
            <wire x2="2864" y1="1440" y2="1440" x1="2848" />
        </branch>
        <branch name="VGA_G">
            <wire x2="2848" y1="1376" y2="1376" x1="2832" />
            <wire x2="2864" y1="1376" y2="1376" x1="2848" />
        </branch>
        <branch name="VGA_R">
            <wire x2="2848" y1="1312" y2="1312" x1="2832" />
            <wire x2="2864" y1="1312" y2="1312" x1="2848" />
        </branch>
        <instance x="2448" y="1728" name="XLXI_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2864" y="1568" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="2864" y="1504" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="2864" y="1440" name="VGA_B" orien="R0" />
        <iomarker fontsize="28" x="2864" y="1376" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="2864" y="1312" name="VGA_R" orien="R0" />
    </sheet>
</drawing>