use "C:\Users\rxs180135\Desktop\Data\car_fatalities.dta" , clear
xtset state

*pooled OLS all variables
reg mrall spircons unrate mlda perinc beertax sobapt mormon dry	vmiles jaild comserd gspch yngdrv

*pooled ols with significant variables
reg mrall spircons unrate mlda perinc beertax sobapt dry vmiles jaild comserd

xtreg mrall beertax mlda jaild comserd ,fe

*Fixed Effects - vehicle fatalities wrt drinking laws

xtreg mrall beertax mlda jaild comserd ,fe vce (cluster state)
xtreg mralln beertax mlda jaild comserd , fe vce(cluster state)
xtreg mraidall beertax mlda jaild comserd , fe vce (cluster state)

*Fixed Effects vs other socio-economic factors

xtreg mrall unrate perinc sobapt mormon dry gspch , fe vce (cluster state)
xtreg mralln unrate perinc sobapt mormon dry gspch , fe vce (cluster state)
xtreg mraidall unrate perinc sobapt mormon dry gspch , fe vce (cluster state)

*Fixed Effects with including significant factors

xtreg mrall beertax mlda jaild comserd unrate perinc sobapt mormon dry gspch, fe vce(cluster state)
xtreg mralln beertax mlda jaild comserd unrate perinc sobapt mormon dry gspch, fe vce(cluster state)
xtreg mraidall beertax mlda jaild comserd unrate perinc sobapt mormon dry gspch, fe vce(cluster state)

*Fixed effects with age based fatalities wrt drinking laws
xtreg mra1517 beertax mlda jaild comserd , fe vce (cluster state)
xtreg mra1820 beertax mlda jaild comserd , fe vce (cluster state)
xtreg mra2124 beertax mlda jaild comserd , fe vce (cluster state)

*Fixed effects with age related death rates wrt all significant variables.
xtreg mra1517 beertax mlda jaild comserd spircons unrate perinc sobapt dry vmiles, fe vce(cluster state)
xtreg mra1820 beertax mlda jaild comserd spircons unrate perinc sobapt dry vmiles, fe vce(cluster state)
xtreg mra2124 beertax mlda jaild comserd spircons unrate perinc sobapt dry vmiles, fe vce(cluster state)


*Fixed Effects all variables

xtreg mrall spircons unrate mlda perinc beertax sobapt mormon dry vmiles jaild comserd gspch yngdrv , fe vce(cluster state)
*Highly  insignificant variables are - mlda, beertzax, sobapt, mormon,vmiles, jaild,comserd,yngdrv

*Trying different combinations
*removing mormon
xtreg mrall spircons unrate mlda perinc beertax sobapt  dry	vmiles jaild comserd gspch yngdrv , fe vce(cluster state)
*removing yngdrv
xtreg mrall spircons unrate mlda perinc beertax sobapt dry vmiles jaild comserd gspch , fe vce(cluster state)
*removing comserd
xtreg mrall spircons unrate mlda perinc beertax sobapt dry vmiles jaild gspch , fe vce(cluster state)
*removing gspch (although it is significant , this depends upon other unobserved factors in this data)
xtreg mrall spircons unrate mlda perinc beertax sobapt dry vmiles jaild comserd , fe vce(cluster state)
*removing sobapt, vmiles
xtreg mrall spircons unrate mlda perinc beertax dry jaild comserd , fe vce(cluster state)
*removing comserd
*Fixed Effects with significant variables
xtreg mrall spircons unrate mlda perinc beertax dry jaild, fe vce (cluster state)

*Entitiy and Time Fixed Effects with significant variables
xtreg mrall spircons unrate mlda perinc beertax dry jaild i.year , fe vce(cluster state)


*Hausman Test

*Fixed Effects
xtreg mrall spircons unrate mlda perinc beertax  dry  jaild  , fe
estimates store fixed
*Random Effects
xtreg mrall spircons unrate mlda perinc beertax  dry  jaild  , re
estimates store random

*Hausman Test
hausman fixed random
