cd /Users/nooshinnejati/D/DH/3_Oct2020_Bank/

use R.dta, clear
//1,720; 18 variables

//gen PERMNO_Year=string(PERMNO,"%02.0f")+string(myyear,"%02.0f")

use M.dta, clear
//1,724; 4 variables

merg 1:1 PERMNO myyear using R.dta
sort _merge

drop in 1/4
keep if _merge==3
drop _merge Daily_ret_CUML PRC

//save myRes.dta, replace
//1,718; 16 variables
