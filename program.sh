#!/bin/bash
if [ $# -lt 1 ]
then
 echo "A program használatához minimum egy paramétert meg kell adni"
 echo "ha nem tudod milyen paramétert adj meg, a 'help' paraméter segíteni fog "
 exit
fi
T=$1
while [ "$T" != "" ]
do
 case $T in
    help | -help )
shift
cat <<END
-----------------------------------------------------------------------

A program mapparendszert készít az adott mappában ahol a program is van
ha máshová szeretne mapparendszert kérem helyezze át magát a programot

-----------------------------------------------------------------------
A program paraméterezéssel működik:
-----------------------------------------------------------------------

Paramérterként megadható :
'h' mint html
'p' mint php
 A css-t alapértelmezetten létrehozza , de kikapcsolható a 
'c' paraméterrel (csak a már létrehozo paraméter után írva működik)
'torol' paramétert válsztva az eddig létrehozott mapákat törli

-----------------------------------------------------------------------
END
        ;;
    h | -h | -html )
shift
        echo "html készítés"
if [ -d html ]
then
  echo "már létezik a Html"
  echo "ha ujra létre akarod hozni törölnöd kell az elözöt"
else
   echo "létrehozom a html-t"
   mkdir html
   cd html
   touch html.txt
   echo "<!DOCTYPE html>" >> html.txt
   echo "<html>" >> html.txt
   echo "<head>" >> html.txt
   echo "<title>Az oldal cime</title>" >> html.txt
   echo "</head>" >> html.txt
   echo "<body>" >> html.txt
   echo "<h1>Cím</h1>" >> html.txt
   echo "</body>" >> html.txt
   echo "</html>" >> html.txt
   cd ..
   mkdir css
   cd css
   touch style.css
   cd ..
   echo "A mappa elkészült a dokumentummal"
fi
        ;;
    p | -p | -php )
shift
	echo "php készítés"
if [ -d php ]
then
    echo "már létezik a php"
    echo "ha ujra létre akarod hozni törölnöd kell az elözöt"
else
    echo "létrehozom a php-t"
    mkdir php
    cd php
    touch html.php
    echo "<!DOCTYPE html>" >> html.txt
    echo "<html>" >> html.txt
    echo "<body>" >> html.txt    
    echo "<?php" >> html.txt
    echo "ide ird a php kódot" >> html.txt
    echo "?>" >> html.txt   
    echo "<h1>Cím</h1>" >> html.txt
    echo "</body>" >> html.txt
    echo "</html>" >> html.txt
    cd ..
    echo "A mappa elkészült a dokumentummal"
fi
	;;
    c | -c | -css )
shift
	echo "css törlés"
if [ -d css ]
then 
    rm -r css
else
    echo "törlés nem sikerült mert nincs ilyen mappa"
fi
	;;
	torol )
	shift
	if [ -d html ]
	then 
	    rm -r html
	fi
	if [ -d php ]
	then
	    rm -r php
	fi
	if [ -d css ]
	then
	    rm -r css
	fi
	echo "törlés sikeres" 
	;;
    *) echo "érvénytelen paraméter! Irja be a help paramétert"
	exit 2
	;;
 esac
 T=$1
done
