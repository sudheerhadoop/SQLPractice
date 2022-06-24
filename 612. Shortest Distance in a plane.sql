select ROUND(SQRT(Min(POW(p2.x - p1.x, 2) + POW(p2.y-p1.y, 2))),2) as shortest
from 
point2d p1
join
point2d p2
on p1.x != p2.x or p1.y != p2.y
