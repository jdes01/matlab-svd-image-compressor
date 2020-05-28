clear all, close all,  clc

RGB=imread('cerezos.jpg'); %Crea una matriz en la que cada posicion almacena
%la informacion de cada pixel de la foto y se la asigna a la matriz RGB

BN=double(rgb2gray(RGB)); %Coge la matriz RGB, convierte cada valor de 
%escala RGB a escala de grisis (0-255) para finalmente transformarlo en el 
%tipo de dato doble y almacenarlo en la matriz BN

ny=size(BN,1) %Almacena el numero de pixeles de altura
nx=size(BN,2) %Almacena el numero de pixeles de anchura

figure, subplot(3,3,1) %Transforma la pantalla en una especie de matriz 3x3
%y muestra la imagen original en la posicion 1x1
imagesc(RGB), axis off; %Muestra la imagen original sin el eje
title('Original') %Ponemos a la imagen normal el titulo de Original

subplot(3,3,2) %Transforma la pantalla en una especie de matriz 3x3
%y muestra la imagen original en blanco y negro en la posicion 1x2
imagesc(BN), axis off; %Muestra la imagen original en blanco y negro sin el eje
colormap(gray);
title('Original B/N') %Ponemos a la imagen normal en blanco y negro el titulo de Original B/N

[U,S,V]=svd(BN); %Define las 3 matrices U, S y V y le asigna a cada una los 
%valores que les proporciona la funcion svd la cual recibe la matriz BN

foto=3; 
for r=[5 15 25 35 40 50 75] %Para cada foto (en este caso 7), completa el 
%siguiente bucle las distintas r veces (que seran la cantidad de i-esimos modos a sumar)

 X=U(:,1:r)*S(1:r,1:r)*V(:,1:r)'; 
    
 %                        |s1   0    0 |   |v1'|
 % X  =  |u1, ... , un| * |0   ...   0 | * |...| = s1 * u1 * v1' + ... + sn * un * vn' 
 %                        |0    0   sn |   |vn'|
                                     
    subplot(3,3,foto), foto=foto+1;
    imagesc(X), axis off, colormap(gray);
    title(['r=',num2str(r,'%d'),', ',num2str(100*r*(nx+ny+1)/(nx*ny),'%3.3f'),'% usado']); 
    %Pone encima de cada foto comprimida su r corrspondiente y el % que se
    %está usando de la imagen original
end