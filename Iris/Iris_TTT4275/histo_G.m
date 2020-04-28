x1all = load('class_1','-ascii');
x2all = load('class_2','-ascii');
x3all = load('class_3','-ascii');

%Class1
f1_c1 = [x1all(:,1)];
f2_c1 = [x1all(:,2)];
f3_c1 = [x1all(:,3)];
f4_c1 = [x1all(:,4)];

%Class2
f1_c2 = [x2all(:,1)];
f2_c2 = [x2all(:,2)];
f3_c2 = [x2all(:,3)];
f4_c2 = [x2all(:,4)];

%Class3
f1_c3 = [x3all(:,1)];
f2_c3 = [x3all(:,2)];
f3_c3 = [x3all(:,3)];
f4_c3 = [x3all(:,4)];

%Histogram of feature 1
%Shows second most overlap
figure(1)
histogram(f1_c1);
hold on 
histogram(f1_c2);
hold on 
histogram(f1_c3);
title('Feature 1 of class 1, 2 and 3')
legend('Class1','Class2','Class3')

%Histogram of feature 2
%Shows most overlap
figure(2)
histogram(f2_c1);
hold on 
histogram(f2_c2);
hold on 
histogram(f2_c3);
title('Feature 2 of class 1, 2 and 3')
legend('Class1','Class2','Class3')

%Histogram of feature 3
%Shows less overlap
figure(3)
histogram(f3_c1);
hold on 
histogram(f3_c2);
hold on 
histogram(f3_c3);
title('Feature 3 of class 1, 2 and 3')
legend('Class1','Class2','Class3')

%Histogram of feature 4
%Shows second less overlap
figure(4)
histogram(f4_c1);
hold on 
histogram(f4_c2);
hold on 
histogram(f4_c3);
title('Feature 4 of class 1, 2 and 3')
legend('Class1','Class2','Class3')

