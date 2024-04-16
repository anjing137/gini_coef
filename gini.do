capture program drop gini
program gini
syntax varlist [if] [in] [,title(string)] //设定我们自己的命令格式
tempvar tinc tp m gini //设定tinc tp m gini 四个变量为临时变量
marksample touse //生成一个0/1 暂元，暂元名为touse
preserve //将当前内存中数据暂封存，直到restore 命令再复原
quietly { //大括号内的命令将在后台执行，前台无显示
	keep if `touse' //根据if 后输入的条件得到一个子数据
	egen `tinc'=sum(`1') //生成总收入，将总收入数据暂存在临时变量'tinc'中
	if "`2'"=="" {
		local 2=1
		} //如果没有人口变量，则默认为该变量为1
	egen `tp'=sum(`2')
	gen `m'=`1'/`2'
	sort `m'
	gen `gini'=1-sum(`2'/`tp'*(2*sum(`1'/`tinc')-`1'/`tinc'))
	}
display as result "`title'基尼系数为：" as error `gini'[_N] //显示基尼系数
restore

