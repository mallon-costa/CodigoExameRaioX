%PARA COR VERDE
% Definindo as constantes reais
sig = 15.008;
u = 114,03;
x = 30:1:200;

nun = -(x - u).^2;
den = 2 * sig.^2;
A = 1 / ( sqrt( 2*pi * sig^2 ) );
y = A * exp( nun ./ den );


%PARA COR VERMELHA
sig = 15.008;
u = 84.067;
%x = -200:1:200;

% y = ( 1 /(sqrt(2*pi*sig^2) ) * exp( -(x - u).^2 / (2*sig^2) ));
% Escrevendo um codigo mais limpo do que o acima
nun = -(x - u).^2;
den = 2 * sig.^2;
A = 1 / ( sqrt( 2*pi * sig^2 ) );
y1 = A * exp( nun ./ den );

%PARA COR AZUL
sig = 17.846;
u = 137.17;
%x = -120:1:200;

% y = ( 1 /(sqrt(2*pi*sig^2) ) * exp( -(x - u).^2 / (2*sig^2) ));
% Escrevendo um codigo mais limpo do que o acima
nun = -(x - u).^2;
den = 2 * sig.^2;
A = 1 / ( sqrt( 2*pi * sig^2 ) );
y2 = A * exp( nun ./ den );

figure(1), clf
plot(x,y,'g', x, y1, 'r', x, y2,'b');
title('Curvas Gaussinas do RGB - Músculos');
legend('Verde','Vermelho','Azul');
