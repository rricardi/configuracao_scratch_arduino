@echo off
SET downloads=%SystemDrive%\users\%username%\Downloads
SET s2afm=%downloads%
SET s2afm1=%s2afm%\s2a_fm-master
SET s2afm2=%s2afm%\s2a_fm-master\s2a_fm-master

IF EXIST %s2afm1% (
    SET s2afm=%s2afm1%
)
IF EXIST %s2afm2% (
    SET s2afm=%s2afm2%
)

IF NOT EXIST %s2afm% (
    ECHO Por favor, faca a extracao do s2a_fm na pasta Downloads.
)

cd %s2afm%
SET /p porta=Digite a porta em que o Arduino está conectado: 
python s2a_fm.py %porta%
    
    

