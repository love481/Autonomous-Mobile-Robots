function [v, H, Rt] = associateMeasurements(x, P, Z, R, M, g)
% [v, H, R] = associateMeasurements(x, P, Z, R, M, g) returns a set of
% innovation vectors and associated jacobians and measurement covariances
% by matching line features by Mahalanobis distance.
Min_dist=inf;
v=zeros(size(Z,1),size(Z,2));
H=zeros(2,3,size(Z,2));
Rt=zeros(2,2,size(Z,2));
n=0;
for i=1:size(Z,2)
 for j=1:size(M,2)
 [h, H_x] = measurementFunction(x, M(:,j));
 vt=Z(:,i)-h;
 SigmaN=H_x*P*H_x'+R(:,:,i);
 dt=vt'*pinv(SigmaN)*vt;
 if (dt<=g^2) && (dt<Min_dist)
     Min_dist= dt;
     n=n+1;
     v(:,n)=vt;
     H(:,:,n)=H_x;
     Rt(:,:,n)=R(:,:,i);
 end
 end
   Min_dist=inf;
end
v=v(:,1:n);
H=H(:,:,1:n);
Rt=Rt(:,:,1:n);
end
