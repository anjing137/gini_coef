use "D:\mypaper\Temp_data\基尼系数_袁卫_统计学2章.dta", clear
rename var6 people
rename var7 income
gen p2 = people^2
gen p3 = people^3
gen p4 = people^4

twoway function y = x, range(0 100) || connected income people, aspectratio(1) yline(0) xline(100)  

reg income people p2 p3, noconstant
twoway function y = x, range(0 100) aspectratio(1) yline(0) xline(100) || function z =  _b[people]*x + _b[p2]*x^2 + _b[p3]*x^3, range(0 100) || sc income people

reg income people p2
twoway function y = x, range(0 100) aspectratio(1) yline(0) xline(100) || function z = _b[_cons] + _b[people]*x + _b[p2]*x^2, range(0 100) || sc income people

reg income people p2 p3, noconstant
twoway function y = x, range(0 100) aspectratio(1) yline(0) xline(100) || function z = _b[people]*x + _b[p2]*x^2 + _b[p3]*x^3, range(0 100) || sc income people, msize(1pt)

reg income people p2, noconstant
twoway function y = x, range(0 100) aspectratio(1) yline(0) xline(100) || function z = _b[people]*x + _b[p2]*x^2, range(0 100) || sc income people, msize(1pt)

reg income people p2 p3 p4, noconstant
twoway function y = x, range(0 100) aspectratio(1) yline(0) xline(100) || function z = _b[people]*x + _b[p2]*x^2 + _b[p3]*x^3 + _b[p4]*x^4, range(0 100) || sc income people, msize(1pt)
* 使用matalab可以把基尼系数算出来为0.3152


twoway function y = x, range(0 100) || connected income people, aspectratio(1) yline(0 20 40 60 80 100, lcolor(green)) xline(0 20 40 60 80 100, lcolor(green)) msize(2pt)
*使用方格的面积可以粗略估算基尼系数。