a=imread('circles.png');

b=edge(a,'Canny',0.4);
figure
imshow(a);

ac=[0,0];
circles=zeros(50,3);
count=1;
PI=3.14159;

for r=10:1:35
    

    accumulator=zeros((size(b,1)),(size(b,2)));
    
    for i=1:size(b,1)
        for j=1:size(b,2)
            if(b(i,j)==1)
                for t=0:1:360
                    ac(1)=round(i+r*(cos(t)));
                    ac(2)=round(j+r*(sin(t)));
                    if(ac(1)>=1 && ac(1)<=246 && ac(2)>=1 && ac(2)<=300)
                        accumulator(ac(1),ac(2))=accumulator(ac(1),ac(2))+1;
                    end
                        
                       
                    
                end
            end
        
        end
    end
    for i=1:1:256
        for j=1:1:256
            if(accumulator(i,j)>(170))
                circles(count,1)=i;
                circles(count,2)=j;
                circles(count,3)=r;
                count=count+1;
            end
        end
    end
end
c=zeros((size(b,1)),(size(b,2)));
for i=1:1:count
    
    for t=1:1:360
        ac(1)=round(circles(i,1)+circles(i,3)*cos(t));
        ac(2)=round(circles(i,2)+circles(i,3)*sin(t));
        if(ac(1)>=1 && ac(1)<=246 && ac(2)>=1 && ac(2)<=300)
            c((ac(1)),(ac(2)))=1;
        end
    end
end
figure
imshow(c);


