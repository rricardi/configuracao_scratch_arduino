@echo off
ECHO Iniciando a instalacao
SET downloads=%SystemDrive%\users\%username%\Downloads
SET dir=%downloads%
SET dir1=%dir%\pip-master
SET dir2=%dir%\pip-master\pip-master

SET s2afm=%downloads%
SET s2afm1=%dir%\s2a_fm-master
SET s2afm2=%dir%\s2a_fm-master\s2a_fm-master

IF EXIST %dir1% (
    SET dir=%dir1%
)
IF EXIST %dir2% (
    SET dir=%dir2%
)

IF EXIST %s2afm1% (
    SET s2afm=%s2afm1%
)
IF EXIST %s2afm2% (
    SET s2afm=%s2afm2%
)

IF EXIST %dir% (
    cd %dir%
    IF EXIST "setup.py" (
        python setup.py install
        start cmd /C pip install pyserial && pip install pymata && ECHO Pacotes instalados && pip freeze
        IF EXIST %s2afm% (
	    cd %s2afm%
            IF EXIST "s2a_fm.py" (
                cd %downloads%\configuracao
                start call s2afm.bat   
            ) ELSE (
                ECHO O arquivo s2a_fm.py nao foi encontrado. Faca a extracao do s2a_fm dentro da pasta Downloads.
            )
        )
    ) ELSE (
        ECHO O arquivo setup.py nao foi encontrado. Faca a extracao do Pip dentro da pasta Downloads.
    )
)

