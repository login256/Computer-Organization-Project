@echo off
for /f %%i IN ('dir test_cases /b') do (

    @echo "%%i"

    java -jar Mars_debug.jar 5000000 test_cases\%%i nc mc CompactDataAtZero dump .text HexText code.txt > mars_out.txt

    mips_tb_isim_beh.exe -log isim_out.txt -tclbatch isim.cmd < quit_sim.txt > findstr_out.txt

    findstr "@" isim_out.txt > actuall.txt

    findstr "@" mars_out.txt > expected.txt

    fc /A actuall.txt expected.txt

)

pause