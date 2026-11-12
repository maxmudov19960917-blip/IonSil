#!/bin/bash
# usage: runtrim.sh workdir display "n z m" ...
W=$1; D=$2; shift 2
export DISPLAY=$D WINEDEBUG=-all WINEPREFIX=/tmp/wpfx
cd "$W"
printf '1\r\n\r\n' > TRIMAUTO
for spec in "$@"; do
 set -- $spec; n=$1; z=$2; m=$3; E=$4; N=1000
 printf '==> SRIM-2013.00 This file controls TRIM Calculations.\r\nIon: Z1 ,  M1,  Energy (keV), Angle,Number,Bragg Corr,AutoSave Number.\r\n     %s   %s   %s   0   %s   1   100000\r\nCascades(1=No;2=Full;3=Sputt;4-5=Ions;6-7=Neutrons), Random Number Seed, Reminders\r\n                      3                                   0       0\r\nDiskfiles (0=no,1=yes): Ranges, Backscatt, Transmit, Sputtered, Collisions(1=Ion;2=Ion+Recoils), Special EXYZ.txt file\r\n                          0       0           0       1               0                               0\r\nTarget material : Number of Elements & Layers\r\n"Silicon"       1               1\r\nPlotType (0-5); Plot Depths: Xmin, Xmax(Ang.) [=0 0 for Viewing Full Target]\r\n       5                         0            5000\r\nTarget Elements:    Z   Mass(amu)\r\nAtom 1 = Si =      14  28.086\r\nLayer   Layer Name /               Width Density    Si(14)\r\nNumb.   Description                (Ang) (g/cm3)    Stoich\r\n 1      "Silicon"           5000  2.3212       1\r\n0  Target layer phases (0=Solid, 1=Gas)\r\n0 \r\nTarget Compound Corrections (Bragg)\r\n 1  \r\nIndividual target atom displacement energies (eV)\r\n      15\r\nIndividual target atom lattice binding energies (eV)\r\n       2\r\nIndividual target atom surface binding energies (eV)\r\n     4.7\r\nStopping Power Version (1=2011, 0=2011)\r\n 0 \r\n' $z $m $E $N > TRIM.IN
 rm -f "SRIM Outputs/SPUTTER.txt"
 timeout 3000 wine TRIM.exe >/dev/null 2>&1
 cp "SRIM Outputs/SPUTTER.txt" /tmp/srout/SPUTTER_${n}_$E.txt 2>/dev/null
 cp TDATA.txt /tmp/srout/TDATA_${n}_$E.txt
 echo "$n done $(date +%T)" >> /tmp/srout/progress.log
done
