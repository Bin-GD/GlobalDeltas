function [R2,p]=GetFit(x,y)

    idx         =   ~isnan(x) & ~isnan(y);
    x           =   x(idx);
    y           =   y(idx);
    
    % Fit
    p           =   polyfit(x, y, 1);
    yFit        =   polyval(p, x);
    
    % R²
    yMean = mean(y);
    SSres = sum((y - yFit).^2);
    SStot = sum((y - yMean).^2);
    R2 = 1 - SSres / SStot;

end