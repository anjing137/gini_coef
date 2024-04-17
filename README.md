<center>

<img src="https://files.mdnice.com/user/12538/79e6b544-8381-4957-8f71-cf8ed9661007.png" width=40%>
  
</center>


- 基尼系数计算公式：

$$
G = 1 - \sum_{i=1}^n 2B_i = 1 - \sum_{i=1}^n P_i\times (2\sum_{k=1}^iW_k - W_i)
$$

- 公式说明：
  - 基尼系数计算公式是 $\frac{A}{A+B}$，由于 $A+B=0.5$，所以 $G=\frac{0.5-B}{0.5}=1-2B$。
  - $B_i$是由众多梯形组成的，梯形面积计算公式是 $\frac{1}{2}(上底+下底)高$
    - 其中， $高=p_i$
    -  $$上底(较小的底)= \sum_{k=1}^i W_k - W_i$$, 
    - $$下底(较大的底边)= \sum_{k=1}^i W_k$$
_DSu-sQ-cTwhQ3H
