# Metaheuristic algorithms comparison
A series of benchmark functions were selected due to their inherent difficulty to find their absolute minimum or maximum numerically because they are either: non-separable, non-differentiable, have a high number of dimensions or have multiple local minima (multimodal). These functions are usually used to test the performance of optimization algorithms \cite{yang2020}. The selected benchmark functions are:

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

A more complete description of these function can be found in the following table.
