X =[1 2 3 4 5 6 7 8];
x= transpose(X);
N = length(x);
y = zeros(1,N);
for k = 1: N
    for n = 1:N 
        y(k) = y(k) + (x(n).*exp(((-1j)*2*pi*k *n/N)));
    end
end



time = 0: N-1;
subplot(2,2,1);
stem(time,x);

mag1 = abs(y);
subplot(2,2,2);
stem(time,mag1);

Y = fft(x,N);
mag2 = abs(Y);
subplot(2,2,3);
stem(time,mag2);