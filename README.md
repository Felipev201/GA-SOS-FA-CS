# Metaheuristic algorithms comparison
A series of benchmark functions were selected due to their inherent difficulty to find their absolute minimum or maximum numerically because they are either: non-separable, non-differentiable, have a high number of dimensions or have multiple local minima (multimodal). These functions are usually used to test the performance of optimization algorithms ([Yang](https://www.sciencedirect.com/science/article/pii/B9780128197141000178)). The selected benchmark functions are:

* Schaffer N1

   <a href="https://www.codecogs.com/eqnedit.php?latex=f(x,&space;y)=0.5&space;&plus;&space;\frac{\sin^2{(x^2&plus;y^2)^2}-0.5}{(1&plus;0.001(x^2&plus;y^2))^2}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f(x,&space;y)=0.5&space;&plus;&space;\frac{\sin^2{(x^2&plus;y^2)^2}-0.5}{(1&plus;0.001(x^2&plus;y^2))^2}" title="f(x, y)=0.5 + \frac{\sin^2{(x^2+y^2)^2}-0.5}{(1+0.001(x^2+y^2))^2}" /></a>

* Holder-Table

    <a href="https://www.codecogs.com/eqnedit.php?latex=f(x,y)=-|\sin&space;x\cos&space;y\exp(|1-\frac{\sqrt{x^2&plus;y^2}}{\pi}|)|" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f(x,y)=-|\sin&space;x\cos&space;y\exp(|1-\frac{\sqrt{x^2&plus;y^2}}{\pi}|)|" title="f(x,y)=-|\sin x\cos y\exp(|1-\frac{\sqrt{x^2+y^2}}{\pi}|)|" /></a>

* Cross-in-Tray

    <a href="https://www.codecogs.com/eqnedit.php?latex=f&space;(x,y)=-0.0001(|\sin(x)\sin(y)&space;\exp(|100-\frac{\sqrt{x^2&plus;y^2}}{\pi}|)|&plus;1)^{0.1}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f&space;(x,y)=-0.0001(|\sin(x)\sin(y)&space;\exp(|100-\frac{\sqrt{x^2&plus;y^2}}{\pi}|)|&plus;1)^{0.1}" title="f (x,y)=-0.0001(|\sin(x)\sin(y) \exp(|100-\frac{\sqrt{x^2+y^2}}{\pi}|)|+1)^{0.1}" /></a>

* Happy cat

   <a href="https://www.codecogs.com/eqnedit.php?latex=f(\textbf{x})=\left[\left(||\textbf{x}||^2&space;-&space;n\right)^2\right]^\alpha&space;&plus;&space;\frac{1}{n}\left(\frac{1}{2}||\textbf{x}||^2&plus;\sum_{i=1}^{n}x_i\right)&plus;\frac{1}{2}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f(\textbf{x})=\left[\left(||\textbf{x}||^2&space;-&space;n\right)^2\right]^\alpha&space;&plus;&space;\frac{1}{n}\left(\frac{1}{2}||\textbf{x}||^2&plus;\sum_{i=1}^{n}x_i\right)&plus;\frac{1}{2}" title="f(\textbf{x})=\left[\left(||\textbf{x}||^2 - n\right)^2\right]^\alpha + \frac{1}{n}\left(\frac{1}{2}||\textbf{x}||^2+\sum_{i=1}^{n}x_i\right)+\frac{1}{2}" /></a>

* Schaffer N4

    <a href="https://www.codecogs.com/eqnedit.php?latex=f(x,&space;y)=0.5&space;&plus;&space;\frac{\cos^2(\sin{|x^2-y^2|})-0.5}{(1&plus;0.001(x^2&plus;y^2))^2}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f(x,&space;y)=0.5&space;&plus;&space;\frac{\cos^2(\sin{|x^2-y^2|})-0.5}{(1&plus;0.001(x^2&plus;y^2))^2}" title="f(x, y)=0.5 + \frac{\cos^2(\sin{|x^2-y^2|})-0.5}{(1+0.001(x^2+y^2))^2}" /></a>


* N-D Sphere

    <a href="https://www.codecogs.com/eqnedit.php?latex=f(\textbf{x})=&space;\sum_{i=1}^n&space;x_i^2" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f(\textbf{x})=&space;\sum_{i=1}^n&space;x_i^2" title="f(\textbf{x})= \sum_{i=1}^n x_i^2" /></a>

More detalied description of the function is found in the following table
![image](https://user-images.githubusercontent.com/70922559/121162240-6044fd80-c813-11eb-9a6a-6c84b6a97e1e.png)

The second column describes the boundaries of the search space that was used for each function. The third column is the number of dimensions. The fourth column gives a description of the function, D: differentiable; ND: non-differentiable; NS: non-separable; U: unimodal; M: multimodal. **f(x_{min})** is the minimum of the function and **x_{min}** is where the minimum can be found in the domain of the function, the **|x|** symbol means that the value of **x** can be positive or negative.


## Results
![image](https://user-images.githubusercontent.com/70922559/121162746-cf225680-c813-11eb-8477-ce520d6e9fff.png)

In bold are the best results

## Contributors
* [Felipe Villaseñor](https://github.com/Felipev201)
* Daniel Torres


